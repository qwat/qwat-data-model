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
		_pipe_id := id FROM qwat_od.pipe WHERE ST_Equals(ST_Force2d(geometry),ST_Force2d(geometry)) IS TRUE LIMIT 1;
		RETURN _pipe_id;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_pipe_get_id(geometry) IS 'Returns the pipe at a given position. If geometry is a point, do not return a pipe which ends on it.';


