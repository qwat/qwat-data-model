/*
	qWat - QGIS Water Module
	
	SQL file :: dimension arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_dr.dimension_orientation CASCADE;
CREATE TABLE qwat_dr.dimension_orientation (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_dr.dimension_orientation IS 'dimension arcs displays measures done on the field. For example: orientations to buildings corner';

/* columns */
ALTER TABLE qwat_dr.dimension_orientation ADD COLUMN observation varchar(120) ;
ALTER TABLE qwat_dr.dimension_orientation ADD COLUMN remark      text ;

/* geometry */
SELECT AddGeometryColumn('qwat_dr', 'dimension_orientation','geometry',21781,'LINESTRING',2);
CREATE INDEX dimension_orientation_geoidx ON qwat_dr.dimension_orientation USING GIST ( geometry );



