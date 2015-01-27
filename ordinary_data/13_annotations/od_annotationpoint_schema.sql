/*
	qWat - QGIS Water Module

	SQL file :: annotationpoint_schema table
*/


DROP TABLE IF EXISTS qwat_od.annotationpoint_schema CASCADE;
CREATE TABLE qwat_od.annotationpoint_schema (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.annotationpoint_schema IS 'Table for annotationpoint_schemas.';

/* COLUMNS */
ALTER TABLE qwat_od.annotationpoint_schema ADD COLUMN text_size        decimal(7,2);
ALTER TABLE qwat_od.annotationpoint_schema ADD COLUMN text_orientation decimal(7,2);
ALTER TABLE qwat_od.annotationpoint_schema ADD COLUMN annotation       text default '';

/* GEOMETRY */
SELECT AddGeometryColumn('qwat_od', 'annotationpoint_schema', 'geometry', 21781, 'POINT', 2)  ;
CREATE INDEX annotationpoint_schema_geoidx ON qwat_od.annotationpoint_schema USING GIST ( geometry );

