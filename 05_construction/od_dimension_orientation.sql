/*
	qWat - QGIS Water Module
	
	SQL file :: dimension arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.dimension_orientation CASCADE;
CREATE TABLE qwat_od.dimension_orientation (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.dimension_orientation IS 'dimension arcs displays measures done on the field. For example: orientations to buildings corner';

/* columns */
ALTER TABLE qwat_od.dimension_orientation ADD COLUMN observation varchar(120) default '';
ALTER TABLE qwat_od.dimension_orientation ADD COLUMN remark      text default '';

/* geometry */
SELECT AddGeometryColumn('qwat_od', 'dimension_orientation','geometry',21781,'LINESTRING',2);
CREATE INDEX dimension_orientation_geoidx ON qwat_od.dimension_orientation USING GIST ( geometry );



