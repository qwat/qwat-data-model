/*
	qWat - QGIS Water Module

	SQL file :: get node id function
*/

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
