-- Add status in node table
ALTER TABLE qwat_od.node ADD COLUMN fk_status integer default null;
ALTER TABLE qwat_od.node ADD CONSTRAINT node_fk_status FOREIGN KEY (fk_status) REFERENCES qwat_vl.status(id) MATCH FULL;
CREATE INDEX fki_node_fk_status ON qwat_od.node(fk_status);

-- Copy column status from network_element table to node table
UPDATE qwat_od.node
SET fk_status = qwat_od.network_element.fk_status
FROM qwat_od.network_element
WHERE qwat_od.node.id = qwat_od.network_element.id;

-- Drop index
DROP INDEX IF EXISTS fki_element_fk_status;
-- Drop constraint
ALTER TABLE qwat_od.network_element DROP CONSTRAINT element_fk_status;
-- Drop status column in network_element table
ALTER TABLE qwat_od.network_element DROP COLUMN fk_status CASCADE;

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

CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_node_type() RETURNS TRIGGER AS
	$BODY$
	DECLARE
		node_ids integer[];
	BEGIN
		IF TG_OP = 'INSERT' THEN
			node_ids := ARRAY[NEW.fk_node_a, NEW.fk_node_b];
		ELSE
			-- delete or update (OLD exists)
			node_ids := ARRAY[OLD.fk_node_a, OLD.fk_node_b];
		END IF;
		IF TG_OP = 'UPDATE' THEN
			IF NEW.fk_node_a <> OLD.fk_node_a THEN
				node_ids := array_append(node_ids, NEW.fk_node_a);
			END IF;
			IF NEW.fk_node_b <> OLD.fk_node_b THEN
				node_ids := array_append(node_ids, NEW.fk_node_b);
			END IF;
		END IF;
		PERFORM qwat_od.fn_node_set_type( node_ids );
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_node_status()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
	DECLARE
		node_ids integer[];
	BEGIN
		IF TG_OP = 'INSERT' THEN
			node_ids := ARRAY[NEW.fk_node_a, NEW.fk_node_b];
		ELSE
			-- delete or update (OLD exists)
			node_ids := ARRAY[OLD.fk_node_a, OLD.fk_node_b];
		END IF;
		IF TG_OP = 'UPDATE' THEN
			IF NEW.fk_node_a <> OLD.fk_node_a THEN
				node_ids := array_append(node_ids, NEW.fk_node_a);
			END IF;
			IF NEW.fk_node_b <> OLD.fk_node_b THEN
				node_ids := array_append(node_ids, NEW.fk_node_b);
			END IF;
		END IF;
		PERFORM qwat_od.fn_node_set_status( node_ids );
		RETURN NEW;
	END;
	$function$
;

CREATE TRIGGER tr_pipe_node_status_insert
    AFTER INSERT
    ON qwat_od.pipe
    FOR EACH ROW
    EXECUTE PROCEDURE qwat_od.ft_pipe_node_status();
COMMENT ON TRIGGER tr_pipe_node_status_insert ON qwat_od.pipe IS 'Trigger: after insert of a pipe, set the status of nodes.';

CREATE TRIGGER tr_pipe_node_status_update
    AFTER update of fk_status
    ON qwat_od.pipe
    FOR EACH ROW
    EXECUTE PROCEDURE qwat_od.ft_pipe_node_status();
COMMENT ON TRIGGER tr_pipe_node_status_update ON qwat_od.pipe IS 'Trigger: after updating status of a pipe, set the status of nodes.';

DROP FUNCTION IF EXISTS qwat_od.fn_node_create(geometry, boolean);
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

CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_node_moved() RETURNS TRIGGER AS
    $BODY$
    DECLARE
        node_ids integer[];
        new_node_a integer;
        new_node_b integer;
        start_geom geometry;
        end_geom geometry;
    BEGIN
        -- We get start and end points of the pipe
        SELECT ST_StartPoint(geometry) into start_geom FROM qwat_od.pipe WHERE fk_node_a = OLD.id;
        SELECT ST_EndPoint(geometry) into end_geom FROM qwat_od.pipe WHERE fk_node_b = OLD.id;
        IF start_geom IS NOT NULL THEN
            -- In that case, we can create a new node, and affect it to the pipe
            new_node_a := qwat_od.fn_node_create(start_geom, /* deactivate_node_add_pipe_vertex */ true, OLD.fk_status, OLD.fk_distributor);
            UPDATE qwat_od.pipe SET fk_node_a = new_node_a WHERE fk_node_a = OLD.id;
            perform qwat_od.fn_node_set_status(new_node_a);
           	perform qwat_od.fn_node_set_distributors(new_node_a);
        END IF;
        IF end_geom IS NOT NULL THEN
            -- In that case, we can create a new node, and affect it to the pipe
            new_node_b := qwat_od.fn_node_create(end_geom, /* deactivate_node_add_pipe_vertex */ true, OLD.fk_status, OLD.fk_distributor);
            UPDATE qwat_od.pipe SET fk_node_b = new_node_b WHERE fk_node_b = OLD.id;
            perform qwat_od.fn_node_set_status(new_node_b);
           	perform qwat_od.fn_node_set_distributors(new_node_b);
        END IF;
        RETURN NEW;
    END;
    $BODY$
    LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_pipe_node_moved() IS 'Trigger: if a network element (i.e. a node) has moved, then reaasign the nodes for the pipe.';

CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_geom() RETURNS TRIGGER AS
	$BODY$
	BEGIN
		IF TG_OP = 'INSERT' OR ST_Equals(ST_StartPoint(NEW.geometry), ST_StartPoint(OLD.geometry)) IS FALSE THEN
			NEW.fk_node_a       := qwat_od.fn_node_create(ST_StartPoint(NEW.geometry), /* deactivate_node_add_pipe_vertex */ true, status => new.fk_status, distributors => array[new.fk_distributor]);
            perform qwat_od.fn_node_set_status(new.fk_node_a, new.fk_status);
           	perform qwat_od.fn_node_set_distributors(new.fk_node_a);
		END IF;
		IF TG_OP = 'INSERT' OR ST_Equals(ST_EndPoint(NEW.geometry), ST_EndPoint(OLD.geometry)) IS FALSE THEN
			NEW.fk_node_b       := qwat_od.fn_node_create(ST_EndPoint(NEW.geometry), /* deactivate_node_add_pipe_vertex */ true, status => new.fk_status, distributors => array[new.fk_distributor]);
            perform qwat_od.fn_node_set_status(new.fk_node_b, new.fk_status);
           	perform qwat_od.fn_node_set_distributors(new.fk_node_b);		
		END IF;
		NEW.fk_district         := qwat_od.fn_get_district(NEW.geometry);
		NEW.fk_pressurezone     := qwat_od.fn_get_pressurezone(NEW.geometry);
		NEW.fk_printmap         := qwat_od.fn_get_printmap_id(NEW.geometry);
		NEW._printmaps          := qwat_od.fn_get_printmaps(NEW.geometry);
		NEW._length2d           := ST_Length(NEW.geometry);
		NEW._length3d           := ST_3DLength(NEW.geometry);
		NEW._diff_elevation     := @(ST_Z(ST_StartPoint(NEW.geometry))-ST_Z(ST_EndPoint(NEW.geometry)));
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE plpgsql;
