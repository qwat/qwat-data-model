/*
 This script aims at transforming QWAT data from EPSG:21781 to EPSG:2056 (MN03 to MN95)
 It should be used with caution and is not given with any warranty, backup your data prior to any usage
 This SQL script should be called from srid_21781_to_2056.sh
 */

DO
$$
DECLARE
	row record;
BEGIN
	SET SESSION session_replication_role = replica;
	FOR row IN SELECT f_table_schema, f_table_name, f_geometry_column, type, coord_dimension
		FROM geometry_columns geo
		INNER JOIN pg_tables inf ON geo.f_table_schema = inf.schemaname AND geo.f_table_name = inf.tablename
		WHERE geo.f_table_schema LIKE 'qwat_%'
	LOOP
		EXECUTE 'ALTER TABLE '||row.f_table_schema||'.'||row.f_table_name||' DISABLE TRIGGER ALL;';
    EXECUTE 'UPDATE '||row.f_table_schema||'.'||row.f_table_name||' SET '||row.f_geometry_column||' = NULL WHERE ST_IsEmpty('||row.f_geometry_column||') IS TRUE;'; -- remove empty geoms see https://github.com/strk/fineltra/issues/10
		EXECUTE 'ALTER TABLE '||row.f_table_schema||'.'||row.f_table_name||' ALTER COLUMN '||row.f_geometry_column||' TYPE Geometry('||row.type||CASE WHEN row.coord_dimension=3 THEN 'Z' ELSE '' END||', 2056) USING ST_GeomFromEWKB(ST_Fineltra('||row.f_geometry_column||', ''chenyx06.chenyx06_triangles'', ''the_geom_lv03'', ''the_geom_lv95''));';
		EXECUTE 'ALTER TABLE '||row.f_table_schema||'.'||row.f_table_name||' ENABLE TRIGGER ALL;';
	END LOOP;
	SET session_replication_role = DEFAULT;
END
$$;

-- update label
update qwat_od.network_element set
label_1_x = st_x(ST_GeomFromEWKB(ST_Fineltra(ST_SetSRID(ST_MakePoint(label_1_x,label_1_y),21781), 'chenyx06.chenyx06_triangles', 'the_geom_lv03', 'the_geom_lv95'))),
label_1_y = st_y(ST_GeomFromEWKB(ST_Fineltra(ST_SetSRID(ST_MakePoint(label_1_x,label_1_y),21781), 'chenyx06.chenyx06_triangles', 'the_geom_lv03', 'the_geom_lv95')))
where label_1_x is not null and label_1_y is not null;

update qwat_od.network_element set
label_2_x = st_x(ST_GeomFromEWKB(ST_Fineltra(ST_SetSRID(ST_MakePoint(label_2_x,label_2_y),21781), 'chenyx06.chenyx06_triangles', 'the_geom_lv03', 'the_geom_lv95'))),
label_2_y = st_y(ST_GeomFromEWKB(ST_Fineltra(ST_SetSRID(ST_MakePoint(label_2_x,label_2_y),21781), 'chenyx06.chenyx06_triangles', 'the_geom_lv03', 'the_geom_lv95')))
where label_2_x is not null and label_2_y is not null;

update qwat_od.valve set
label_1_x = st_x(ST_GeomFromEWKB(ST_Fineltra(ST_SetSRID(ST_MakePoint(label_1_x,label_1_y),21781), 'chenyx06.chenyx06_triangles', 'the_geom_lv03', 'the_geom_lv95'))),
label_1_y = st_y(ST_GeomFromEWKB(ST_Fineltra(ST_SetSRID(ST_MakePoint(label_1_x,label_1_y),21781), 'chenyx06.chenyx06_triangles', 'the_geom_lv03', 'the_geom_lv95')))
where label_1_x is not null and label_1_y is not null;

update qwat_od.valve set
label_2_x = st_x(ST_GeomFromEWKB(ST_Fineltra(ST_SetSRID(ST_MakePoint(label_2_x,label_2_y),21781), 'chenyx06.chenyx06_triangles', 'the_geom_lv03', 'the_geom_lv95'))),
label_2_y = st_y(ST_GeomFromEWKB(ST_Fineltra(ST_SetSRID(ST_MakePoint(label_2_x,label_2_y),21781), 'chenyx06.chenyx06_triangles', 'the_geom_lv03', 'the_geom_lv95')))
where label_2_x is not null and label_2_y is not null;

