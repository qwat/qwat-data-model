-- Add distributor in node table
alter table qwat_od.node add column fk_distributor integer[];
-- foreign key for array is still not supported in 2022 so we can not add constraint foreign key

-- Copy column status from network_element table to node table
UPDATE qwat_od.node
SET fk_distributor = qwat_od.node.fk_distributor || qwat_od.network_element.fk_distributor
FROM qwat_od.network_element
WHERE qwat_od.node.id = qwat_od.network_element.id;

-- Drop index
DROP INDEX IF EXISTS fki_element_fk_distributor;
-- Drop constraint
ALTER TABLE qwat_od.network_element DROP CONSTRAINT element_fk_distributor;
-- Drop distributor column in network_element table
ALTER TABLE qwat_od.network_element DROP COLUMN fk_distributor CASCADE;

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

CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_node_distributor()
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
				node_ids := array_append(node_ids, OLD.fk_node_a);
			END IF;
			IF NEW.fk_node_b <> OLD.fk_node_b THEN
				node_ids := array_append(node_ids, OLD.fk_node_b);
			END IF;
		END IF;
		PERFORM qwat_od.fn_node_set_distributors( node_ids );
		RETURN NEW;
	END;
	$function$
;

CREATE TRIGGER tr_pipe_node_distributor_insert
    AFTER INSERT
    ON qwat_od.pipe
    FOR EACH ROW
    EXECUTE FUNCTION qwat_od.ft_pipe_node_distributor();
COMMENT ON TRIGGER tr_pipe_node_distributor_insert ON qwat_od.pipe IS 'Trigger: after insert of a pipe, set distributor(s) of nodes.';

CREATE TRIGGER tr_pipe_node_distributor_update
    AFTER update of fk_distributor
    ON qwat_od.pipe
    FOR EACH ROW
    EXECUTE FUNCTION qwat_od.ft_pipe_node_distributor();
COMMENT ON TRIGGER tr_pipe_node_distributor_update ON qwat_od.pipe IS 'Trigger: after updating distributor of a pipe, set distributor(s) of nodes.';
