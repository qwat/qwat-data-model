/*
	qWat - QGIS Water Module

	SQL file :: annotationline table
*/


DROP TABLE IF EXISTS qwat_od.annotationline CASCADE;
CREATE TABLE qwat_od.annotationline (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.annotationline IS 'Table for annotationlines.';

/* COLUMNS */
ALTER TABLE qwat_od.annotationline ADD COLUMN labelvisible        boolean not null default true; 
ALTER TABLE qwat_od.annotationline ADD COLUMN text_size           decimal(7,2);
ALTER TABLE qwat_od.annotationline ADD COLUMN text_orientation    decimal(7,2);
ALTER TABLE qwat_od.annotationline ADD COLUMN annotation          text default '';

/* GEOMETRY */
SELECT AddGeometryColumn('qwat_od', 'annotationline', 'geometry', 21781, 'LINESTRING', 2)  ;
CREATE INDEX annotationline_geoidx ON qwat_od.annotationline USING GIST ( geometry );
