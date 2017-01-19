 
-- adds new auditing functions

CREATE TABLE qwat_sys.logged_relations (
    relation_name text not null,
    uid_column text not null,
    PRIMARY KEY (relation_name, uid_column)
);

COMMENT ON TABLE qwat_sys.logged_relations IS 'Table used to store unique identifier columns for table or views, so that events can be replayed';
COMMENT ON COLUMN qwat_sys.logged_relations.relation_name IS 'Relation (table or view) name (with schema if needed)';
COMMENT ON COLUMN qwat_sys.logged_relations.uid_column IS 'Name of a column that is used to uniquely identify a row in the relation';

CREATE OR REPLACE FUNCTION qwat_sys.if_modified_func() RETURNS TRIGGER AS $body$
DECLARE
    audit_row qwat_sys.logged_actions;
    include_values BOOLEAN;
    log_diffs boolean;
    h_old hstore;
    h_new hstore;
    excluded_cols text[] = ARRAY[]::text[];
BEGIN

    IF NOT (TG_WHEN IN ('AFTER' , 'INSTEAD OF')) THEN
        RAISE EXCEPTION 'qwat_sys.if_modified_func() may only run as an AFTER trigger';
    END IF;

    audit_row = ROW(
        nextval('qwat_sys.logged_actions_event_id_seq'), -- event_id
        TG_TABLE_SCHEMA::text,                        -- schema_name
        TG_TABLE_NAME::text,                          -- table_name
        TG_RELID,                                     -- relation OID for much quicker searches
        session_user::text,                           -- session_user_name
        current_timestamp,                            -- action_tstamp_tx
        statement_timestamp(),                        -- action_tstamp_stm
        clock_timestamp(),                            -- action_tstamp_clk
        txid_current(),                               -- transaction ID
        (SELECT setting FROM pg_settings WHERE name = 'application_name'),
        inet_client_addr(),                           -- client_addr
        inet_client_port(),                           -- client_port
        current_query(),                              -- top-level query or queries (if multistatement) from client
        substring(TG_OP,1,1),                         -- action
        NULL, NULL,                                   -- row_data, changed_fields
        'f'                                           -- statement_only
        );

    IF NOT TG_ARGV[0]::boolean IS DISTINCT FROM 'f'::boolean THEN
        audit_row.client_query = NULL;

    END IF;

    IF TG_ARGV[1] IS NOT NULL THEN
        excluded_cols = TG_ARGV[1]::text[];
    END IF;
    
    IF (TG_OP = 'UPDATE' AND TG_LEVEL = 'ROW') THEN
        h_old = hstore(OLD.*) - excluded_cols;
        audit_row.row_data = h_old;
        h_new = hstore(NEW.*)- excluded_cols;
        audit_row.changed_fields =  h_new - h_old;

        IF audit_row.changed_fields = hstore('') THEN
            -- All changed fields are ignored. Skip this update.
            RAISE WARNING '[qwat_sys.if_modified_func] - Trigger detected NULL hstore. ending';
            RETURN NULL;
        END IF;
  INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
  RETURN NEW;
        
    ELSIF (TG_OP = 'DELETE' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(OLD.*) - excluded_cols;
  INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
        RETURN OLD;
        
    ELSIF (TG_OP = 'INSERT' AND TG_LEVEL = 'ROW') THEN
        audit_row.row_data = hstore(NEW.*) - excluded_cols;
  INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
        RETURN NEW;

    ELSIF (TG_LEVEL = 'STATEMENT' AND TG_OP IN ('INSERT','UPDATE','DELETE','TRUNCATE')) THEN
        audit_row.statement_only = 't';
        INSERT INTO qwat_sys.logged_actions VALUES (audit_row.*);
  RETURN NULL;

    ELSE
        RAISE EXCEPTION '[qwat_sys.if_modified_func] - Trigger func added as trigger for unhandled case: %, %',TG_OP, TG_LEVEL;
        RETURN NEW;
    END IF;


END;
$body$
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = pg_catalog, public;


COMMENT ON FUNCTION qwat_sys.if_modified_func() IS $body$
Track changes to a table at the statement and/or row level.

Optional parameters to trigger in CREATE TRIGGER call:

param 0: boolean, whether to log the query text. Default 't'.

param 1: text[], columns to ignore in updates. Default [].

         Updates to ignored cols are omitted from changed_fields.

         Updates with only ignored cols changed are not inserted
         into the audit log.

         Almost all the processing work is still done for updates
         that ignored. If you need to save the load, you need to use
         WHEN clause on the trigger instead.

         No warning or error is issued if ignored_cols contains columns
         that do not exist in the target table. This lets you specify
         a standard set of ignored columns.

There is no parameter to disable logging of values. Add this trigger as
a 'FOR EACH STATEMENT' rather than 'FOR EACH ROW' trigger if you do not
want to log row values.

Note that the user name logged is the login role for the session. The audit trigger
cannot obtain the active role because it is reset by the SECURITY DEFINER invocation
of the audit trigger its self.
$body$;

CREATE OR REPLACE FUNCTION qwat_sys.replay_event(pevent_id int) RETURNS void AS $body$
DECLARE
  query text;
BEGIN
    with
    event as (
        select * from qwat_sys.logged_actions where event_id = pevent_id
    )
    -- get primary key names
    , where_pks as (
        select array_to_string(array_agg(uid_column || '=' || quote_literal(row_data->uid_column)), ' AND ') as where_clause
          from qwat_sys.logged_relations r
          join event on relation_name = (schema_name || '.' || table_name)
    )
    select into query
        case
            when action = 'I' then
                'INSERT INTO ' || schema_name || '.' || table_name ||
                ' ('||(select string_agg(key, ',') from each(row_data))||') VALUES ' ||
                '('||(select string_agg(case when value is null then 'null' else quote_literal(value) end, ',') from each(row_data))||')'
            when action = 'D' then
                'DELETE FROM ' || schema_name || '.' || table_name ||
                ' WHERE ' || where_clause
            when action = 'U' then
                'UPDATE ' || schema_name || '.' || table_name ||
                ' SET ' || (select string_agg(key || '=' || case when value is null then 'null' else quote_literal(value) end, ',') from each(changed_fields)) ||
                ' WHERE ' || where_clause
        end
    from
        event, where_pks
    ;
    
    execute query;
END;
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys.replay_event(int) IS $body$
Replay a logged event.
 
Arguments:
   pevent_id:  The event_id of the event in qwat_sys.logged_actions to replay
$body$;

CREATE FUNCTION qwat_sys.audit_view(target_view regclass, audit_query_text BOOLEAN, ignored_cols text[], uid_cols text[]) RETURNS void AS $body$
DECLARE
  stm_targets text = 'INSERT OR UPDATE OR DELETE';
  _q_txt text;
  _ignored_cols_snip text = '';

BEGIN
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_row ON ' || target_view::text;
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_stm ON ' || target_view::text;
 
	IF array_length(ignored_cols,1) > 0 THEN
	    _ignored_cols_snip = ', ' || quote_literal(ignored_cols);
	END IF;
	_q_txt = 'CREATE TRIGGER audit_trigger_row INSTEAD OF INSERT OR UPDATE OR DELETE ON ' || 
		 target_view::TEXT || 
		 ' FOR EACH ROW EXECUTE PROCEDURE qwat_sys.if_modified_func(' ||
		 quote_literal(audit_query_text) || _ignored_cols_snip || ');';
	RAISE NOTICE '%',_q_txt;
	EXECUTE _q_txt;

    -- store uid columns if not already present
  IF (select count(*) from qwat_sys.logged_relations where relation_name = (select target_view)::text AND  uid_column= (select unnest(uid_cols))::text) = 0 THEN
      insert into qwat_sys.logged_relations (relation_name, uid_column)
       select target_view, unnest(uid_cols);
  END IF;    

END;
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys.audit_view(regclass, BOOLEAN, text[], text[]) IS $body$
ADD auditing support TO a VIEW.
 
Arguments:
   target_view:      TABLE name, schema qualified IF NOT ON search_path
   audit_query_text: Record the text of the client query that triggered the audit event?
   ignored_cols:     COLUMNS TO exclude FROM UPDATE diffs, IGNORE updates that CHANGE only ignored cols.
   uid_cols:         COLUMNS to use to uniquely identify a row from the view (in order to replay UPDATE and DELETE)
$body$;
 
-- Pg doesn't allow variadic calls with 0 params, so provide a wrapper
CREATE OR REPLACE FUNCTION qwat_sys.audit_view(target_view regclass, audit_query_text BOOLEAN, uid_cols text[]) RETURNS void AS $body$
SELECT qwat_sys.audit_view($1, $2, ARRAY[]::text[], uid_cols);
$body$ LANGUAGE SQL;
 
-- And provide a convenience call wrapper for the simplest case
-- of row-level logging with no excluded cols and query logging enabled.
--
CREATE OR REPLACE FUNCTION qwat_sys.audit_view(target_view regclass, uid_cols text[]) RETURNS void AS $$
SELECT qwat_sys.audit_view($1, BOOLEAN 't', uid_cols);
$$ LANGUAGE 'sql';




--- ###################################################################
-- adds table and view triggers for auditing, only if triggers handle editable views -------------------------------------
DO $$
BEGIN
PERFORM qwat_sys.audit_table('qwat_od.valve');

-- PERFORM qwat_sys.audit_view('qwat_od.vw_consumptionzone', 'true'::boolean, '{}'::text[], '{id}'::text[]);

PERFORM qwat_sys.audit_view('qwat_od.vw_element_hydrant', 'true'::boolean, '{}'::text[], '{id}'::text[]);
PERFORM qwat_sys.audit_view('qwat_od.vw_element_installation', 'true'::boolean, '{}'::text[], '{id}'::text[]);
PERFORM qwat_sys.audit_view('qwat_od.vw_element_meter', 'true'::boolean, '{}'::text[], '{id}'::text[]);
PERFORM qwat_sys.audit_view('qwat_od.vw_element_part', 'true'::boolean, '{}'::text[], '{id}'::text[]);
PERFORM qwat_sys.audit_view('qwat_od.vw_element_samplingpoint', 'true'::boolean, '{}'::text[], '{id}'::text[]);
PERFORM qwat_sys.audit_view('qwat_od.vw_element_subscriber', 'true'::boolean, '{}'::text[], '{id}'::text[]);

-- PERFORM qwat_sys.audit_view('qwat_od.vw_export_hydrant', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_export_installation', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_export_meter', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_export_part', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_export_subscriber', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_export_valve', 'true'::boolean, '{}'::text[], '{id}'::text[]);

PERFORM qwat_sys.audit_view('qwat_od.vw_installation_chamber', 'true'::boolean, '{}'::text[], '{id}'::text[]);
PERFORM qwat_sys.audit_view('qwat_od.vw_installation_pressurecontrol', 'true'::boolean, '{}'::text[], '{id}'::text[]);
PERFORM qwat_sys.audit_view('qwat_od.vw_installation_pump', 'true'::boolean, '{}'::text[], '{id}'::text[]);
PERFORM qwat_sys.audit_view('qwat_od.vw_installation_source', 'true'::boolean, '{}'::text[], '{id}'::text[]);
PERFORM qwat_sys.audit_view('qwat_od.vw_installation_tank', 'true'::boolean, '{}'::text[], '{id}'::text[]);
PERFORM qwat_sys.audit_view('qwat_od.vw_installation_treatment', 'true'::boolean, '{}'::text[], '{id}'::text[]);

-- PERFORM qwat_sys.audit_view('qwat_od.vw_leak', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_node_element', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_pipe', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_pipe_child_parent', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_pipe_schema_merged', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_pipe_schema', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_pipe_schema_error', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_pipe_schema_visibleitems', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_printmap', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_protectionzone', 'true'::boolean, '{}'::text[], '{id}'::text[]);

PERFORM qwat_sys.audit_view('qwat_od.vw_qwat_installation', 'true'::boolean, '{}'::text[], '{id}'::text[]);
PERFORM qwat_sys.audit_view('qwat_od.vw_qwat_network_element', 'true'::boolean, '{}'::text[], '{id}'::text[]);
PERFORM qwat_sys.audit_view('qwat_od.vw_qwat_node', 'true'::boolean, '{}'::text[], '{id}'::text[]);

-- PERFORM qwat_sys.audit_view('qwat_od.vw_remote', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_search_view', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_subscriber_pipe_relation', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- PERFORM qwat_sys.audit_view('qwat_od.vw_valve_lines', 'true'::boolean, '{}'::text[], '{id}'::text[]);

END
$$;



-- finishes with upgrading qwat version

UPDATE qwat_sys.versions SET version = '1.1.1';

