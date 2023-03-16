/*
	qWat - QGIS Water Module
	
	SQL file :: dimension arcs
*/


/* CREATE TABLE */
CREATE TABLE qwat_dr.dimension_distance (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_dr.dimension_distance IS 'dimension arcs displays measures done on the field. For example: distances to buildings corner';

/* columns */
ALTER TABLE qwat_dr.dimension_distance ADD COLUMN observation  varchar(120) ;
ALTER TABLE qwat_dr.dimension_distance ADD COLUMN _calculation double precision;
ALTER TABLE qwat_dr.dimension_distance ADD COLUMN remark       text ;

/* geometry */
ALTER TABLE qwat_dr.dimension_distance ADD COLUMN geometry geometry('LINESTRING',:SRID);
CREATE INDEX dimension_distance_geoidx ON qwat_dr.dimension_distance USING GIST ( geometry );


/* --------- !! !! ----------*/
/* Trigger for 2d length */
CREATE OR REPLACE FUNCTION qwat_dr.ft_dimension_distance_distance() RETURNS trigger AS 
$BODY$
	BEGIN
		NEW._calculation := ST_Distance( ST_StartPoint(NEW.geometry), ST_EndPoint(NEW.geometry) );
		RETURN NEW;
	END;
$BODY$ LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_dr.ft_dimension_distance_distance() IS 'Fcn/Trigger: updates the distance between the two extremities of the arc.';

CREATE TRIGGER tr_dimension_distance
	BEFORE INSERT OR UPDATE OF geometry ON qwat_dr.dimension_distance
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_dr.ft_dimension_distance_distance();
COMMENT ON TRIGGER tr_dimension_distance ON qwat_dr.dimension_distance IS 'Trigger: updates the length and other fields of the pipe after insert/update.';




