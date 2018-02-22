CREATE OR REPLACE FUNCTION qwat_sys.audit_table(target_table regclass, audit_rows BOOLEAN, audit_query_text BOOLEAN, ignored_cols text[]) RETURNS void AS $body$
DECLARE
  stm_targets text = 'INSERT OR UPDATE OR DELETE OR TRUNCATE';
  _q_txt text;
  _ignored_cols_snip text = '';
BEGIN
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_row ON ' || target_table::text;
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_stm ON ' || target_table::text;
 
    IF audit_rows THEN
        IF array_length(ignored_cols,1) > 0 THEN
            _ignored_cols_snip = ', ' || quote_literal(ignored_cols);
        END IF;
        _q_txt = 'CREATE TRIGGER audit_trigger_row AFTER INSERT OR UPDATE OR DELETE ON ' || 
                 target_table::text || 
                 ' FOR EACH ROW EXECUTE PROCEDURE qwat_sys.if_modified_func(' ||
                 quote_literal(audit_query_text) || _ignored_cols_snip || ');';
        RAISE NOTICE '%',_q_txt;
        EXECUTE _q_txt;
        stm_targets = 'TRUNCATE';
    ELSE
    END IF;
 
    _q_txt = 'CREATE TRIGGER audit_trigger_stm AFTER ' || stm_targets || ' ON ' ||
             target_table ||
             ' FOR EACH STATEMENT EXECUTE PROCEDURE qwat_sys.if_modified_func('||
             quote_literal(audit_query_text) || ');';
    RAISE NOTICE '%',_q_txt;
    EXECUTE _q_txt;

    -- store primary key names
    insert into qwat_sys.logged_relations (relation_name, uid_column)
         select target_table, a.attname
           from pg_index i
           join pg_attribute a on a.attrelid = i.indrelid
                              and a.attnum = any(i.indkey)
          where i.indrelid = target_table::regclass
            and i.indisprimary
          on conflict do nothing;
END;
$body$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION qwat_sys.unaudit_table(target_table regclass) RETURNS void AS $body$
BEGIN
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_row ON ' || target_table::text;
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_stm ON ' || target_table::text;
END;
$body$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION qwat_sys.unaudit_view(target_view regclass) RETURNS void AS $body$
BEGIN
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_row ON ' || target_view::text;
    EXECUTE 'DROP TRIGGER IF EXISTS audit_trigger_stm ON ' || target_view::text;
END;
$body$
LANGUAGE plpgsql;


/* Audit */
CREATE OR REPLACE FUNCTION qwat_sys._list_audit_tables() RETURNS text[] AS $body$
DECLARE
    tables_to_audit text[];
BEGIN
    tables_to_audit := ARRAY[
        --qwat_dr
        'qwat_dr.annotationline',
        'qwat_dr.annotationpoint',
        'qwat_dr.constructionpoint',
        'qwat_dr.dimension_distance',
        'qwat_dr.dimension_orientation',
        --qwat_od
        'qwat_od.distributor',
        'qwat_od.district',
        'qwat_od.folder',
        'qwat_od.leak',
        'qwat_od.pipe',
        'qwat_od.printmap',
        'qwat_od.protectionzone',
        'qwat_od.remote',
        'qwat_od.surveypoint',
        'qwat_od.valve',
        -- qwat_vl
        'qwat_vl.cistern',
        'qwat_vl.hydrant_provider',
        'qwat_vl.hydrant_material',
        'qwat_vl.leak_cause',
        'qwat_vl.overflow',
        'qwat_vl.pipe_function',
        'qwat_vl.pipe_installmethod',
        'qwat_vl.pipe_material',
        'qwat_vl.pipe_protection',
        'qwat_vl.precision',
        'qwat_vl.pressurecontrol_type',
        'qwat_vl.protectionzone_type',
        'qwat_vl.pump_type',
        'qwat_vl.remote_type',
        'qwat_vl.source_quality',
        'qwat_vl.source_type',
        'qwat_vl.status',
        'qwat_vl.subscriber_type',
        'qwat_vl.survey_type',
        'qwat_vl.tank_firestorage',
        'qwat_vl.valve_function',
        'qwat_vl.valve_maintenance',
        'qwat_vl.valve_actuation',
        'qwat_vl.valve_type',
        'qwat_vl.visible'];
    return tables_to_audit;
END
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys._list_audit_tables() IS $body$
Return the tables to be audited.
$body$;

CREATE OR REPLACE FUNCTION qwat_sys.activate_audit_tables() RETURNS void AS $body$
BEGIN
    PERFORM qwat_sys.audit_table(t) FROM unnest(qwat_sys._list_audit_tables()) t;
END
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys.activate_audit_tables() IS $body$
Activate auditing of tables.
$body$;

CREATE OR REPLACE FUNCTION qwat_sys.deactivate_audit_tables() RETURNS void AS $body$
BEGIN
    PERFORM qwat_sys.unaudit_table(t) FROM unnest(qwat_sys._list_audit_tables()) t;
END
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys.deactivate_audit_tables() IS $body$
Deactivate auditing of tables.
$body$;

/* Audit views only for those having explicit triggers handling data editing*/
CREATE OR REPLACE FUNCTION qwat_sys._list_audit_views() RETURNS text[] AS $body$
DECLARE
    views_to_audit text[];
BEGIN
    views_to_audit := ARRAY[
        'qwat_od.vw_consumptionzone',
        'qwat_od.vw_element_hydrant',
        'qwat_od.vw_element_installation',
        'qwat_od.vw_element_meter',
        'qwat_od.vw_element_part',
        'qwat_od.vw_element_samplingpoint',
        'qwat_od.vw_element_subscriber',
        'qwat_od.vw_protectionzone',
        'qwat_od.vw_qwat_installation',
        'qwat_od.vw_qwat_network_element',
        'qwat_od.vw_qwat_node'];
    return views_to_audit;
END
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys._list_audit_views() IS $body$
Return the views to be audited.
$body$;

CREATE OR REPLACE FUNCTION qwat_sys.activate_audit_views() RETURNS void AS $body$
BEGIN
    PERFORM qwat_sys.audit_view(t, 'true'::boolean, '{}'::text[], '{id}'::text[])
            FROM unnest(qwat_sys._list_audit_views()) t;
END
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys.activate_audit_views() IS $body$
Activate auditing of views.
$body$;

CREATE OR REPLACE FUNCTION qwat_sys.deactivate_audit_views() RETURNS void AS $body$
BEGIN
    PERFORM qwat_sys.unaudit_view(t) FROM unnest(qwat_sys._list_audit_views()) t;
END
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys.deactivate_audit_views() IS $body$
Deactivate auditing of views.
$body$;
