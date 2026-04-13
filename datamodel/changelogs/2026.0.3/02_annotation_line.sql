/*
	qWat - QGIS Water Module

	SQL file :: annotationline table
*/


CREATE TABLE qwat_od.annotation_line (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.annotation_line IS 'Table for annotationlines.';

/* COLUMNS */
ALTER TABLE qwat_od.annotation_line ADD COLUMN labelvisible     boolean not null default true; 
ALTER TABLE qwat_od.annotation_line ADD COLUMN text_size        decimal(7,2);
ALTER TABLE qwat_od.annotation_line ADD COLUMN text_orientation decimal(7,2);
ALTER TABLE qwat_od.annotation_line ADD COLUMN annotation       text;
ALTER TABLE qwat_od.annotation_line ADD COLUMN scale_1          boolean default true;
ALTER TABLE qwat_od.annotation_line ADD COLUMN scale_2          boolean default true;

/* GEOMETRY */
ALTER TABLE qwat_od.annotation_line ADD COLUMN geometry geometry('LINESTRING',:SRID);
CREATE INDEX annotationline_geoidx ON qwat_od.annotation_line USING GIST ( geometry );
