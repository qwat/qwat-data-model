/*
	qWat - QGIS Water Module

	SQL file :: node distributor functions
*/

-- Set distributor(s) of a node regarding connected pipes
CREATE OR REPLACE FUNCTION qwat_od.fn_node_set_distributors(_node_id integer)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	declare
	    _grouped	record;
        _pipeitem	record;
        _distributors integer[]='{}';
	begin
        -- count pipes associated to this node
		SELECT
			COUNT(pipe.id) AS count,
				bool_or(coalesce(schema_force_visible,pipe_function.schema_visible)) AS schema_visible
            INTO _grouped
            FROM qwat_od.pipe
                INNER JOIN qwat_vl.pipe_function ON pipe.fk_function = pipe_function.id
            WHERE (fk_node_a = _node_id OR fk_node_b = _node_id);
        IF _grouped.count > 0 THEN
            /* loop over pipes to take distributor */
            FOR _pipeitem IN (
                SELECT  pipe.id, pipe.fk_distributor as distributor
                        FROM qwat_od.pipe
                        WHERE fk_node_a = _node_id
                UNION ALL
                SELECT  pipe.id, pipe.fk_distributor as distributor
                        FROM qwat_od.pipe
                        WHERE fk_node_b = _node_id
            ) loop
                -- set distributor in _distributors if it does not exist
            	if not _pipeitem.distributor = any(_distributors) then 
        			_distributors := _distributors || _pipeitem.distributor;
            	end if;
            END LOOP;
       end if;

		-- update the node table
		UPDATE qwat_od.node SET
		    fk_distributor = _distributors
		    WHERE id = _node_id;      
	END;
$function$
;
COMMENT ON FUNCTION qwat_od.fn_node_set_distributors( _node_id integer ) IS 'Set distributor(s) of node regarding connected pipes.';

CREATE OR REPLACE FUNCTION qwat_od.fn_node_set_distributors(_node_ids integer[] DEFAULT NULL::integer[])
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	DECLARE
		node record;
		_node_id integer;
	BEGIN
		IF _node_ids IS NULL THEN
			FOR node IN (SELECT id FROM qwat_od.node ORDER BY id) LOOP
				PERFORM qwat_od.fn_node_set_distributors(node.id);
			END LOOP;
		ELSE
			FOREACH _node_id IN ARRAY _node_ids LOOP
				PERFORM qwat_od.fn_node_set_distributors(_node_id);
			END LOOP;
		END IF;
	END;
$function$
;
COMMENT ON FUNCTION qwat_od.fn_node_set_distributors( _node_ids integer[] ) IS 'Set distributor(s) of nodes regarding connected pipes.';
