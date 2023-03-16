/*
	qWat - QGIS Water Module

	SQL file :: create node function
*/

CREATE OR REPLACE FUNCTION qwat_od.fn_node_create( _point geometry, deactivate_node_add_pipe_vertex boolean = FALSE, status integer = -1, distributors integer[] = '{}'::integer[] ) RETURNS integer AS
$BODY$
    DECLARE
        _node_id integer;
    BEGIN
        SELECT id FROM qwat_od.node WHERE ST_Equals(ST_Force2d(_point), ST_Force2d(node.geometry)) IS TRUE LIMIT 1 INTO _node_id;
        IF _node_id IS NULL THEN
			IF (status = -1) THEN 
			-- If it is default value for status, it is a node created connected with a pipe. 
			-- Let the trigger set status and distributors and create the node only with a geometry.
				INSERT INTO qwat_od.node (geometry) VALUES (ST_Force3D(_point)) RETURNING id INTO _node_id;
			ELSE
            	INSERT INTO qwat_od.node (geometry, fk_status, fk_distributor) VALUES (ST_Force3D(_point), status, distributors) RETURNING id INTO _node_id;
			END IF;
            IF _node_id IS NULL THEN
                RAISE EXCEPTION 'Node is null although it should have been created';
            END IF;
        END IF;
        RETURN _node_id;
    END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_node_create(geometry, boolean, integer, integer[]) IS 'Returns the node for a given geometry (point). If node does not exist, create it.';

