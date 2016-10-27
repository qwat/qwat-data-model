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
        select array_to_string(array_agg(a.attname || '=' || quote_literal(row_data->a.attname)), ' AND ') as where_clause
          from pg_index i
          join pg_attribute a on a.attrelid = i.indrelid
                             and a.attnum = any(i.indkey)
          join event on i.indrelid = (schema_name || '.' || table_name)::regclass
          where         i.indisprimary
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
