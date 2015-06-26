/*
	qWat - QGIS Water Module

	SQL file :: annotationpoint table
*/


DROP TABLE IF EXISTS qwat_dr.annotationpoint CASCADE;
CREATE TABLE qwat_dr.annotationpoint (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_dr.annotationpoint IS 'Table for annotationpoints.';

/* COLUMNS */
ALTER TABLE qwat_dr.annotationpoint ADD COLUMN text_size        decimal(7,2);
ALTER TABLE qwat_dr.annotationpoint ADD COLUMN text_orientation decimal(7,2);
ALTER TABLE qwat_dr.annotationpoint ADD COLUMN annotation       text;
ALTER TABLE qwat_dr.annotationpoint ADD COLUMN scale_1          boolean default true;
ALTER TABLE qwat_dr.annotationpoint ADD COLUMN scale_2          boolean default true;

/* GEOMETRY */
SELECT AddGeometryColumn('qwat_dr', 'annotationpoint', 'geometry', 21781, 'POINT', 2)  ;
CREATE INDEX annotationpoint_geoidx ON qwat_dr.annotationpoint USING GIST ( geometry );

