/*
	qWat - QGIS Water Module

	SQL file :: create node function
*/

CREATE OR REPLACE FUNCTION qwat_od.fn_node_create( _point geometry, deactivate_node_add_pipe_vertex boolean = FALSE ) RETURNS integer AS
$BODY$
	DECLARE
		_node_id integer;
	BEGIN
		SELECT id FROM qwat_od.node WHERE ST_Equals(ST_Force2d(_point), ST_Force2d(node.geometry)) IS TRUE LIMIT 1 INTO _node_id;
		IF _node_id IS NULL THEN

            INSERT INTO qwat_od.node (geometry) VALUES (ST_Force3D(_point)) RETURNING id INTO _node_id;

			IF _node_id IS NULL THEN
				RAISE EXCEPTION 'Node is null although it should have been created';
			END IF;
		END IF;
		RETURN _node_id;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_node_create(geometry, boolean) IS 'Returns the node for a given geometry (point). If node does not exist, create it.';


