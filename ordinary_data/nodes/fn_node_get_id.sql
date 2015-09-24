/*
	qWat - QGIS Water Module

	SQL file :: get node id function
*/

CREATE OR REPLACE FUNCTION qwat_od.fn_get_node( _point geometry, _create_node boolean ) RETURNS integer AS
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
COMMENT ON FUNCTION qwat_od.fn_get_node(geometry,boolean) IS 'Returns the node for a given geometry (point). If node does not exist and if specified in argument, it is created.';



CREATE OR REPLACE FUNCTION qwat_od.fn_node_get_ids( extent box2d DEFAULT NULL ) RETURNS integer[] AS
$BODY$
	DECLARE
		node_ids integer[];
	BEGIN
		IF extent IS NULL THEN
			SELECT ARRAY( SELECT id FROM qwat_od.node ) INTO node_ids;
		ELSE
			SELECT ARRAY( SELECT id FROM qwat_od.node WHERE node.geometry && extent ) INTO node_ids;
		END IF;
		RETURN node_ids;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_node_get_ids(extent box2d) IS 'Returns a list of node IDs contained a given extent.';
