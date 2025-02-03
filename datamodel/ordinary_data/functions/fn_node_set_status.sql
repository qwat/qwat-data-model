/*
	qWat - QGIS Water Module

	SQL file :: node status functions
*/
-- Get status of a node regarding connected pipes
CREATE OR REPLACE FUNCTION qwat_od.fn_node_get_status(_node_id integer, user_value integer = -1)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
	declare
	    _grouped	record;
	    _status		integer;
        _pipeitem	record;
	begin
--		RAISE NOTICE 'get status of the node:  %', _node_id;
    	-- init status to user_value
    	_status := user_value; 	
        -- count pipes associated to this node
		SELECT
			COUNT(pipe.id) AS count,
				bool_or(coalesce(schema_force_visible,pipe_function.schema_visible)) AS schema_visible
            INTO _grouped
            FROM qwat_od.pipe
                INNER JOIN qwat_vl.status ON pipe.fk_status = status.id
                INNER JOIN qwat_vl.pipe_function ON pipe.fk_function = pipe_function.id
            WHERE (fk_node_a = _node_id OR fk_node_b = _node_id);
        IF _grouped.count > 0 THEN
            /* loop over pipes to take status */
            FOR _pipeitem IN (
                SELECT  pipe.id, pipe.year, pipe.fk_status as status
                        FROM qwat_od.pipe
                        WHERE fk_node_a = _node_id
                UNION ALL
                SELECT  pipe.id, pipe.year, pipe.fk_status as status
                        FROM qwat_od.pipe
                        WHERE fk_node_b = _node_id
            ) loop
                -- prioritise according to status of all the pipes connected with the node
                -- watch status of current pipe to see if it needs to change status of the node
--              RAISE NOTICE 'current status of the node:  %', _status;
--				RAISE NOTICE 'current status of the pipe:  %', _pipeitem.status;            
                case 
                	when _status = -1
                    	then _status := _pipeitem.status; -- first pass in the loop so we set the status to the status of the first pipe
                    when _status = 103 -- lowest priority - to be determined
                    	then _status := _pipeitem.status; -- set the status to the status of the current pipe as it can not be a lowest priority
                    when _status = 102 -- unknown
                    	then if _pipeitem.status not in (103) -- check if is not a lower priority
        	            		then _status := _pipeitem.status; -- set the status to the status of the current pipe as it can not be a lowest priority
    	                	end if;
                    when _status = 101 -- other
                    	then if _pipeitem.status not in (102, 103) -- check if is not a lower priority
	                    		then _status := _pipeitem.status; -- set the status to the status of the current pipe as it can not be a lowest priority
	                    	end if;
                    when _status = 1307 -- fictional
                    	then if _pipeitem.status not in (101, 102, 103) -- check if is not a lower priority
            	        		then _status := _pipeitem.status; -- set the status to the status of the current pipe as it can not be a lowest priority
            	        	end if;
                    when _status = 1305 -- destroyed
                    	then if _pipeitem.status not in (1307, 101, 102, 103) -- check if is not a lower priority
	                    		then _status := _pipeitem.status; -- set the status to the status of the current pipe as it can not be a lowest priority
                    		end if;
                    when _status = 1304 -- disused
                    	then if _pipeitem.status not in (1305, 1307, 101, 102, 103) -- check if is not a lower priority
	                    		then _status := _pipeitem.status; -- set the status to the status of the current pipe as it can not be a lowest priority
	                    	end if;
                    when _status = 1303 -- shut down
                    	then if _pipeitem.status not in (1304, 1305, 1307, 101, 102, 103) -- check if is not a lower priority
	                    		then _status := _pipeitem.status; -- set the status to the status of the current pipe as it can not be a lowest priority
	                    	end if;
                    when _status = 1302 -- out of service
                    	then if _pipeitem.status not in (1303, 1304, 1305, 1307, 101, 102, 103) -- check if is not a lower priority
	                    		then _status := _pipeitem.status; -- set the status to the status of the current pipe as it can not be a lowest priority
                    		end if;
                    when _status = 1308 -- project in execution
                    	then if _pipeitem.status not in (1302, 1303, 1304, 1305, 1307, 101, 102, 103) -- check if is not a lower priority
	                    		then _status := _pipeitem.status; -- set the status to the status of the current pipe as it can not be a lowest priority
	                    	end if;
                    when _status = 1306 -- project planned
                    	then if _pipeitem.status not in (1308, 1302, 1303, 1304, 1305, 1307, 101, 102, 103) -- check if is not a lower priority
	                    		then _status := _pipeitem.status; -- set the status to the status of the current pipe as it can not be a lowest priority
	                    	end if;
                    when _status = 1301 -- in use
                    	then _status := 1301; -- it is the highet priority so it needs to be the final priority of the created node
                end case;
            END LOOP;
		ELSE
			_status := user_value;
    	end if;

		RETURN _status;     
	END;
$function$
;
COMMENT ON FUNCTION qwat_od.fn_node_get_status( _node_id integer, user_value integer ) IS 'Get the status of node regarding connected pipes. If one pipe: status of the pipe. If many: depends on priority of status of all pipes. If none: get value from user.';

-- Set status of a node regarding connected pipes
CREATE OR REPLACE FUNCTION qwat_od.fn_node_set_status(_node_id integer, user_value integer default -1)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	declare
	    _status		integer;
	begin
    	_status := qwat_od.fn_node_get_status(_node_id, user_value); 	

		-- update the node table
		UPDATE qwat_od.node SET
		    fk_status = _status
		    WHERE id = _node_id;
	END;
$function$
;
COMMENT ON FUNCTION qwat_od.fn_node_set_status( _node_id integer, user_value integer ) IS 'Set the status of node regarding connected pipes. If one pipe: status of the pipe. If many: depends on priority of status of all pipes.';

-- Set status of each nodes
CREATE OR REPLACE FUNCTION qwat_od.fn_node_set_status(_node_ids integer[] DEFAULT NULL::integer[])
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	DECLARE
		node record;
		_node_id integer;
	BEGIN
		IF _node_ids IS NULL THEN
			FOR node IN (SELECT id FROM qwat_od.node ORDER BY id) LOOP
				PERFORM qwat_od.fn_node_set_status(node.id);
			END LOOP;
		ELSE
			FOREACH _node_id IN ARRAY _node_ids LOOP
				PERFORM qwat_od.fn_node_set_status(_node_id);
			END LOOP;
		END IF;
	END;
$function$
;
COMMENT ON FUNCTION qwat_od.fn_node_set_status( _node_ids integer[] ) IS 'Set the status of nodes regarding connected pipes.';
