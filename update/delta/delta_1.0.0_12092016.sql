CREATE OR REPLACE FUNCTION qwat_sys.replay_event(pevent_id int) RETURNS void AS $body$
DECLARE
  query text;
BEGIN
	select into query
	  case
	  when action = 'I' then
	    'INSERT INTO ' || schema_name || '.' || table_name ||
	    ' ('||(select string_agg(key, ',') from each(row_data))||') VALUES ' ||
	    '('||(select string_agg(case when value is null then 'null' else '''' || value || '''' end, ',') from each(row_data))||')'
	  when action = 'D' then
            'DELETE FROM ' || schema_name || '.' || table_name ||
	    ' WHERE id=' || (row_data->'id')::text
          when action = 'U' then
            'UPDATE ' || schema_name || '.' || table_name ||
            ' SET ' || (select string_agg(key || '=' || case when value is null then 'null' else ''''||value||'''' end, ',') from each(changed_fields)) ||
            ' WHERE id=' || (row_data->'id')::text
	  end
	from qwat_sys.logged_actions where event_id=pevent_id;

	--raise notice '%', query;

	execute query;
END;
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys.replay_event(int) IS $body$
Replay a logged event.
 
Arguments:
   pevent_id:  The event_id of the event in qwat_sys.logged_actions to replay
$body$;

UPDATE qwat_sys.versions SET version = '1.0.0';