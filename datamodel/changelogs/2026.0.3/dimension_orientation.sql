/*
	qWat - QGIS Water Module
	
	SQL file :: dimension arcs
*/


/* CREATE TABLE */
CREATE TABLE qwat_dr.dimension_orientation (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_dr.dimension_orientation IS 'dimension arcs displays measures done on the field. For example: orientations to buildings corner';

/* columns */
ALTER TABLE qwat_dr.dimension_orientation ADD COLUMN observation varchar(120) ;
ALTER TABLE qwat_dr.dimension_orientation ADD COLUMN remark      text ;

/* geometry */
ALTER TABLE qwat_dr.dimension_orientation ADD COLUMN geometry geometry('LINESTRING',:SRID);
CREATE INDEX dimension_orientation_geoidx ON qwat_dr.dimension_orientation USING GIST ( geometry );



