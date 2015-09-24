

CREATE OR REPLACE FUNCTION qwat_od.fn_node_update_id() RETURNS void AS
$BODY$
declare 
  node_table        record;
  stmt     text;
  max_id   integer;
begin
  FOR node_table IN SELECT * FROM qwat_od.node_table
    LOOP
    RAISE NOTICE '%', node_table.table_name;
    stmt := 'UPDATE qwat_od.' || node_table.table_name || ' SET fk_node = qwat_od.fn_get_node(geometry,false);';
    EXECUTE stmt;
  END LOOP;
end;
$BODY$
LANGUAGE plpgsql;

