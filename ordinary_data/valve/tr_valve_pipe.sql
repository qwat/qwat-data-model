/*
	qWat - QGIS Water Module

	SQL file :: valve-pipe functions and triggers
*/

/* UPDATES NUMBER OF VALVES AND CLOSED/OPEN FOR PIPES */
CREATE OR REPLACE FUNCTION qwat_od.fn_pipe_update_valve(_pipe_id integer) RETURNS VOID AS
$BODY$
	BEGIN
		UPDATE qwat_od.pipe
			SET
				_valve_count  = valve_group.vcount,
				_valve_closed = valve_group.vclosed
			FROM qwat_od.pipe pipe_dupp
			INNER JOIN (
				SELECT fk_pipe, count(id) AS vcount, bool_or(closed) AS vclosed
				FROM qwat_od.valve
				WHERE fk_pipe = _pipe_id
				GROUP BY fk_pipe
				) AS valve_group
			ON pipe_dupp.id = valve_group.fk_pipe
			WHERE pipe.id = _pipe_id;
	END;
$BODY$
LANGUAGE plpgsql;


/* ASSIGN PIPE AFTER VALVE INSERT */
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_insert() RETURNS TRIGGER AS
$BODY$
	BEGIN
		IF NEW.fk_pipe IS NULL THEN
			NEW.fk_pipe := qwat_od.fn_pipe_get_id(node.geometry) FROM qwat_od.node WHERE node.id = NEW.id;
		END IF;
		PERFORM qwat_od.fn_pipe_update_valve(NEW.id);
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_insert() IS 'Trigger: when inserting a valve, get a pipe if not given. Do a BEFORE trigger, valve will be update..';
CREATE TRIGGER tr_valve_insert_trigger
	BEFORE INSERT ON qwat_od.valve
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_valve_insert();
COMMENT ON TRIGGER tr_valve_insert_trigger ON qwat_od.valve IS 'Trigger: when inserting a valve, get a pipe if not given. Do a BEFORE trigger, valve will be update.';



/* REASSIGN THE PIPE OF A VALVE WHEN THE VALVE MOVES */
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_node_update() RETURNS TRIGGER AS
$BODY$
	BEGIN
		-- this will be fired for every node, although not every node is valve (see trigger)
		UPDATE qwat_od.vw_element_valve SET fk_pipe = qwat_od.fn_pipe_get_id(geometry) WHERE id = OLD.id; -- TODO prompt user to move it or not
		-- this will be calling the trigger ft_valve_update
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_node_update() IS 'Trigger: when moving a valve, reassign the pipe. Do an AFTER trigger since it will update valve after updating the node.';
/* WHEN THE VALVE MOVES */
CREATE TRIGGER tr_valve_node_update_trigger
    -- this will be fired for every node, although not every node is valve
	AFTER UPDATE OF geometry ON qwat_od.node
	FOR EACH ROW
	WHEN ( ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
	EXECUTE PROCEDURE qwat_od.ft_valve_node_update();
COMMENT ON TRIGGER tr_valve_node_update_trigger ON qwat_od.node IS 'Trigger: when moving a valve, reassign the pipe. Do an AFTER trigger since it will update valve after updating the node.';


/* REASSIGN THE PIPE OF A VALVE WHEN THE PIPE MOVES OR IS DELETED */
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_pipe_update() RETURNS TRIGGER AS
$BODY$
	BEGIN
		UPDATE qwat_od.vw_element_valve SET fk_pipe = qwat_od.fn_pipe_get_id(geometry) WHERE fk_pipe = OLD.id; -- TODO prompt user to move it or not
		-- this will be calling the trigger ft_valve_update
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_pipe_update() IS 'Trigger: when moving or deleting a pipe, reassign the pipe to all valves connected to the old pipe. Do an AFTER trigger since it will update valve after updating the node.';
/* WHEN THE PIPE MOVES */
CREATE TRIGGER tr_valve_pipe_update
    -- this will be fired for every node, although not every node is valve
	AFTER UPDATE OF geometry ON qwat_od.pipe
	FOR EACH ROW
	WHEN ( ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
	EXECUTE PROCEDURE qwat_od.ft_valve_pipe_update();
COMMENT ON TRIGGER tr_valve_pipe_update ON qwat_od.pipe IS 'Trigger: when moving a pipe, reassign the pipe to all valves connected to the old pipe. Do an AFTER trigger since it will update valve after updating the node.';
/* WHEN THE PIPE IS DELETED */
CREATE TRIGGER tr_valve_pipe_delete
    -- this will be fired for every node, although not every node is valve
	AFTER DELETE ON qwat_od.pipe
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_valve_pipe_update();
COMMENT ON TRIGGER tr_valve_pipe_delete ON qwat_od.pipe IS 'Trigger: when deleting a pipe, reassign the pipe to all valves connected to the old pipe. Do an AFTER trigger since it will update valve after updating the node.';






/* AFTER UPDATE OF A VALVE: REEVALUATE OLD AND NEW PIPES */
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_update() RETURNS TRIGGER AS
$BODY$
	BEGIN
		PERFORM qwat_od.fn_pipe_update_valve(OLD.id);
		PERFORM qwat_od.fn_pipe_update_valve(NEW.id);
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_update() IS 'Trigger: when updating a valve, reevaluate old and new pipes.';
CREATE TRIGGER tr_valve_update_trigger
	AFTER UPDATE ON qwat_od.valve
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_valve_update();
COMMENT ON TRIGGER tr_valve_update_trigger ON qwat_od.valve IS 'Trigger: when updating a valve, reevaluate old and new pipes.';

