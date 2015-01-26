/*
	qWat - QGIS Water Module

	SQL file :: annotationpoint table
*/


DROP TABLE IF EXISTS qwat_od.annotationpoint CASCADE;
CREATE TABLE qwat_od.annotationpoint (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.annotationpoint IS 'Table for annotationpoints.';

/* COLUMNS */
ALTER TABLE qwat_od.annotationpoint ADD COLUMN text_size        decimal(7,2);
ALTER TABLE qwat_od.annotationpoint ADD COLUMN text_orientation decimal(7,2);
ALTER TABLE qwat_od.annotationpoint ADD COLUMN annotation       text default '';

/* GEOMETRY */
SELECT AddGeometryColumn('qwat_od', 'annotationpoint', 'geometry', 21781, 'POINT', 2)  ;
CREATE INDEX annotationpoint_geoidx ON qwat_od.annotationpoint USING GIST ( geometry );

