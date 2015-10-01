/*
	qWat - QGIS Water Module
	
	SQL file :: pipe functions
*/

/*----------------!!!---!!!----------------*/
/* get pipe id */
CREATE OR REPLACE FUNCTION qwat_od.fn_pipe_get_id(_geometry geometry) RETURNS integer AS
$BODY$
	DECLARE
		_pipe_id integer := NULL;
	BEGIN
		IF ST_IsPoint(_geometry) THEN
			WITH pipes AS (
			SELECT id, geometry 
				FROM qwat_od.pipe 
				WHERE ST_DWithin(point,geometry,0.0001) 
				ORDER BY ST_Distance(point,geometry)
			)
			_pipe_id := pipes.id FROM pipes WHERE ST_AsBinary(_geometry) <> ST_AsBinary(ST_FirstPoint(pipes.geometry))
											AND   ST_AsBinary(_geometry) <> ST_AsBinary(ST_EndPoint( pipes.geometry));
		ELSE
			_pipe_id := id FROM qwat_od.pipe WHERE ST_DWithin(point,geometry,0.0001) ORDER BY ST_Distance(point,geometry) ASC LIMIT 1;
		END IF;
		RETURN _pipe_id;	
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_pipe_get_id(geometry) IS 'Returns the pipe at a given position. If geometry is a point, do not return a pipe which ends on it.';


