/*
	qWat - QGIS Water Module

	SQL file :: pressure zones
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.folder CASCADE;
CREATE TABLE qwat_od.folder (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.folder IS 'Technical folders.';

/* COLUMNS */
ALTER TABLE qwat_od.folder ADD COLUMN name        varchar(50) not null;
ALTER TABLE qwat_od.folder ADD COLUMN description text;
ALTER TABLE qwat_od.folder ADD COLUMN date_start  date;
ALTER TABLE qwat_od.folder ADD COLUMN date_end    date;

/* GEOMETRY */
SELECT AddGeometryColumn('qwat_od', 'folder', 'geometry_polygon', :SRID, 'MULTIPOLYGON', 2);
SELECT AddGeometryColumn('qwat_od', 'folder', 'geometry_line', :SRID, 'MULTILINESTRING', 2);
CREATE INDEX folder_geoidx_polygon ON qwat_od.folder USING GIST ( geometry_polygon );
CREATE INDEX folder_geoidx_line ON qwat_od.folder    USING GIST ( geometry_line );

/* CONSTRAINT */
ALTER TABLE qwat_od.folder ADD CONSTRAINT folder_name UNIQUE (name);

