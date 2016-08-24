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
--                         IF deactivate_node_add_pipe_vertex THEN
                           -- if we are called from a pipe creation, do not try to add a vertex on the pipe
--                            ALTER TABLE qwat_od.node DISABLE TRIGGER tr_node_add_pipe_vertex_insert;
--                         END IF;
			INSERT INTO qwat_od.node (geometry) VALUES (ST_Force3D(_point)) RETURNING id INTO _node_id;
--                         IF deactivate_node_add_pipe_vertex THEN
--                            ALTER TABLE qwat_od.node ENABLE TRIGGER tr_node_add_pipe_vertex_insert;
--                         END IF;
			IF _node_id IS NULL THEN
				RAISE EXCEPTION 'Node is null although it should have been created';
			END IF;
		END IF;
		RETURN _node_id;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_node_create(geometry, boolean) IS 'Returns the node for a given geometry (point). If node does not exist, create it.';


