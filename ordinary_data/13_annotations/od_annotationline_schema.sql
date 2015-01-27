/*
	qWat - QGIS Water Module

	SQL file :: annotationline_schema table
*/


DROP TABLE IF EXISTS qwat_od.annotationline_schema CASCADE;
CREATE TABLE qwat_od.annotationline_schema (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.annotationline_schema IS 'Table for annotationline_schemas.';

/* COLUMNS */
ALTER TABLE qwat_od.annotationline_schema ADD COLUMN labelvisible        boolean not null default true; 
ALTER TABLE qwat_od.annotationline_schema ADD COLUMN text_size           decimal(7,2);
ALTER TABLE qwat_od.annotationline_schema ADD COLUMN text_orientation    decimal(7,2);
ALTER TABLE qwat_od.annotationline_schema ADD COLUMN annotation          text default '';

/* GEOMETRY */
SELECT AddGeometryColumn('qwat_od', 'annotationline_schema', 'geometry', 21781, 'LINESTRING', 2)  ;
CREATE INDEX annotationline_schema_geoidx ON qwat_od.annotationline_schema USING GIST ( geometry );
