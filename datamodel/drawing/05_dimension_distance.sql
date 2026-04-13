/*
	qWat - QGIS Water Module
	
	SQL file :: dimension arcs
*/


/* CREATE TABLE */
CREATE TABLE qwat_od.dimension_distance (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.dimension_distance IS 'dimension arcs displays measures done on the field. For example: distances to buildings corner';

/* columns */
ALTER TABLE qwat_od.dimension_distance ADD COLUMN observation  varchar(120) ;
ALTER TABLE qwat_od.dimension_distance ADD COLUMN _calculation double precision;
ALTER TABLE qwat_od.dimension_distance ADD COLUMN remark       text ;

/* geometry */
ALTER TABLE qwat_od.dimension_distance ADD COLUMN geometry geometry('LINESTRING',:SRID);
CREATE INDEX dimension_distance_geoidx ON qwat_od.dimension_distance USING GIST ( geometry );
