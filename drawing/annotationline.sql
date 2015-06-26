/*
	qWat - QGIS Water Module

	SQL file :: annotationline table
*/


DROP TABLE IF EXISTS qwat_dr.annotationline CASCADE;
CREATE TABLE qwat_dr.annotationline (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_dr.annotationline IS 'Table for annotationlines.';

/* COLUMNS */
ALTER TABLE qwat_dr.annotationline ADD COLUMN labelvisible     boolean not null default true; 
ALTER TABLE qwat_dr.annotationline ADD COLUMN text_size        decimal(7,2);
ALTER TABLE qwat_dr.annotationline ADD COLUMN text_orientation decimal(7,2);
ALTER TABLE qwat_dr.annotationline ADD COLUMN annotation       text;
ALTER TABLE qwat_dr.annotationline ADD COLUMN scale_1          boolean default true;
ALTER TABLE qwat_dr.annotationline ADD COLUMN scale_2          boolean default true;

/* GEOMETRY */
SELECT AddGeometryColumn('qwat_dr', 'annotationline', 'geometry', 21781, 'LINESTRING', 2)  ;
CREATE INDEX annotationline_geoidx ON qwat_dr.annotationline USING GIST ( geometry );
