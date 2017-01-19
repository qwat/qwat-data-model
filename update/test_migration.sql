/* List all table */
COPY (
SELECT table_schema,table_name 
  FROM information_schema.tables 
 WHERE table_schema in ('public', 'qwat_dr', 'qwat_od', 'qwat_sys', 'qwat_vl') 
ORDER BY table_schema,table_name
) TO STDOUT WITH CSV FORCE QUOTE *;;

/* List tables columns */
COPY (
WITH table_list AS (
  SELECT table_schema,table_name 
  FROM information_schema.tables 
  WHERE table_schema in ('qwat_dr', 'qwat_od', 'qwat_sys', 'qwat_vl') 
  ORDER BY table_schema,table_name
)
SELECT isc.table_schema, isc.table_name, column_name, column_default, is_nullable, data_type, character_maximum_length::text, numeric_precision::text, numeric_precision_radix::text, datetime_precision::text FROM information_schema.columnS isc,table_list tl  
 WHERE isc.table_schema = tl.table_schema 
   AND isc.table_name = tl.table_name
   ORDER BY isc.table_schema, isc.table_name, column_name
) TO STDOUT WITH CSV FORCE QUOTE *;;

/* List constraints */
COPY (
select 
    tc.constraint_name, 
    tc.constraint_schema || '.' || tc.table_name || '.' || kcu.column_name as physical_full_name,  
    tc.constraint_schema,
    tc.table_name, 
    kcu.column_name, 
    ccu.table_name as foreign_table_name, 
    ccu.column_name as foreign_column_name,
    tc.constraint_type
from information_schema.table_constraints as tc  
join information_schema.key_column_usage as kcu on (tc.constraint_name = kcu.constraint_name and tc.table_name = kcu.table_name)
join information_schema.constraint_column_usage as ccu on ccu.constraint_name = tc.constraint_name
where tc.constraint_schema in ('qwat_dr', 'qwat_od', 'qwat_sys', 'qwat_vl')
ORDER BY tc.constraint_schema, physical_full_name, tc.constraint_name
) TO STDOUT WITH CSV FORCE QUOTE *;;

/* List views & definition */
COPY (
select table_name, replace(view_definition,'"','') 
from INFORMATION_SCHEMA.views
WHERE table_schema in ('qwat_dr', 'qwat_od', 'qwat_sys', 'qwat_vl')
AND table_name not like 'vw_export_%'
ORDER BY table_schema, table_name
) TO STDOUT WITH CSV FORCE QUOTE *;;

/* List sequences */
COPY (
SELECT c.relname  
  FROM pg_class c 
 WHERE c.relkind = 'S'
 ORDER BY c.relname
) TO STDOUT WITH CSV FORCE QUOTE *;;

/* Lists indexes */
COPY (
select
    t.relname as table_name,
    i.relname as index_name,
    a.attname as column_name
from
    pg_class t,
    pg_class i,
    pg_index ix,
    pg_attribute a
where
    t.oid = ix.indrelid
    and i.oid = ix.indexrelid
    and a.attrelid = t.oid
    and a.attnum = ANY(ix.indkey)
    and t.relkind = 'r'
order by
    t.relname,
    i.relname,
    a.attname
) TO STDOUT WITH CSV FORCE QUOTE *;;

/* List triggers */
COPY (
select tgname, p.relname
from pg_trigger
JOIN pg_class p ON tgrelid=p.oid
WHERE tgname not ilike 'RI_ConstraintTrigger_%'
AND SUBSTR(p.relname, 1, 3) != 'vw_'  -- We cannot check for vw_ views, because  they are created after that script
order by tgname, relname
) TO STDOUT WITH CSV FORCE QUOTE *;;


/* Definition triggers */
COPY (
WITH trigger_list AS (
  select tgname from pg_trigger 
  GROUP BY tgname
)
select prosrc, p.relname
from pg_trigger t, pg_proc, trigger_list, pg_class p
where pg_proc.oid=t.tgfoid
  and t.tgname = trigger_list.tgname
  AND t.tgrelid = p.oid
  and  SUBSTR(p.relname, 1, 3) != 'vw_' -- We cannot check for vw_ views, because  they are created after that script
ORDER BY t.tgname, p.relname
) TO STDOUT WITH CSV FORCE QUOTE *;;

/* List functions */
COPY (
SELECT routines.routine_name, parameters.data_type, routines.routine_definition
  FROM information_schema.routines
  JOIN information_schema.parameters ON routines.specific_name=parameters.specific_name
 WHERE routines.specific_schema in ('qwat_dr', 'qwat_od', 'qwat_sys', 'qwat_vl')
ORDER BY routines.routine_name, parameters.data_type, routines.routine_definition, parameters.ordinal_position
) TO STDOUT WITH CSV FORCE QUOTE *;;

/* List rules */
COPY (
select n.nspname as rule_schema, 
       c.relname as rule_table, 
       case r.ev_type  
         when '1' then 'SELECT' 
         when '2' then 'UPDATE' 
         when '3' then 'INSERT' 
         when '4' then 'DELETE' 
         else 'UNKNOWN' 
       end as rule_event
from pg_rewrite r  
  join pg_class c on r.ev_class = c.oid 
  left join pg_namespace n on n.oid = c.relnamespace 
  left join pg_description d on r.oid = d.objoid 
  WHERE n.nspname in ('qwat_dr', 'qwat_od', 'qwat_sys', 'qwat_vl')
  ORDER BY n.nspname, c.relname, rule_event
) TO STDOUT WITH CSV FORCE QUOTE *;;
