/*
	qWat - QGIS Water Module

	SQL file :: pressure zones
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.folder (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.folder IS 'Technical folders.';

/* COLUMNS */
ALTER TABLE qwat_od.folder ADD COLUMN identification varchar(50) not null;
ALTER TABLE qwat_od.folder ADD COLUMN description    text;
ALTER TABLE qwat_od.folder ADD COLUMN date_start     date;
ALTER TABLE qwat_od.folder ADD COLUMN date_end       date;

/* GEOMETRY */
ALTER TABLE qwat_od.folder ADD COLUMN geometry_polygon geometry('MULTIPOLYGON',:SRID);
ALTER TABLE qwat_od.folder ADD COLUMN geometry_line    geometry('MULTILINESTRING',:SRID);
CREATE INDEX folder_geoidx_polygon ON qwat_od.folder USING GIST ( geometry_polygon );
CREATE INDEX folder_geoidx_line ON qwat_od.folder    USING GIST ( geometry_line );

/* CONSTRAINT */
ALTER TABLE qwat_od.folder ADD CONSTRAINT folder_identification UNIQUE (identification);

