/*
	qWat - QGIS Water Module

	SQL file :: create node function
*/


CREATE OR REPLACE FUNCTION qwat_od.fn_create_node( _point geometry ) RETURNS integer AS
$BODY$
	DECLARE
		_node_id integer;
	BEGIN
		SELECT id FROM qwat_od.node WHERE ST_DWithin(_point,geometry,0.0) IS TRUE LIMIT 1 INTO _node_id;
		IF _node_id IS NULL AND _create_node IS TRUE THEN
			INSERT INTO qwat_od.node (geometry) VALUES (_point);
			_node_id := qwat_od.fn_get_node( _point, false );
			IF _node_id IS NULL THEN
				RAISE EXCEPTION 'Node is null although it should have been created';
			END IF;
		END IF;
		RETURN _node_id;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_get_node(geometry) IS 'Returns the node for a given geometry (point). If node does not exist, create it.';
