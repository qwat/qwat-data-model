/* --------- !! !! ----------*/
/* Trigger for 2d length */
CREATE OR REPLACE FUNCTION qwat_app.ft_dimension_distance_distance() RETURNS trigger AS 
$BODY$
	BEGIN
		NEW._calculation := ST_Distance( ST_StartPoint(NEW.geometry), ST_EndPoint(NEW.geometry) );
		RETURN NEW;
	END;
$BODY$ LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_app.ft_dimension_distance_distance() IS 'Fcn/Trigger: updates the distance between the two extremities of the arc.';

CREATE TRIGGER tr_dimension_distance
	BEFORE INSERT OR UPDATE OF geometry ON qwat_od.dimension_distance
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_app.ft_dimension_distance_distance();
COMMENT ON TRIGGER tr_dimension_distance ON qwat_od.dimension_distance IS 'Trigger: updates the length and other fields of the pipe after insert/update.';
