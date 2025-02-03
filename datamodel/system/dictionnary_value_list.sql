CREATE VIEW qwat_sys.dictionary_value_list AS 
  SELECT p.relname AS vl_name, vl.* 
  FROM qwat_vl.value_list_base vl, pg_class p 
  WHERE vl.tableoid = p.oid;
