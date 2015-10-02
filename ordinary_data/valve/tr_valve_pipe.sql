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


/* ASSIGN PIPE TRIGGER */
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
CREATE TRIGGER valve_insert_trigger
	BEFORE INSERT ON qwat_od.valve
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_valve_insert();
COMMENT ON TRIGGER valve_insert_trigger ON qwat_od.valve IS 'Trigger: when inserting a valve, get a pipe if not given. Do a BEFORE trigger, valve will be update.';




CREATE OR REPLACE FUNCTION qwat_od.ft_valve_node_update() RETURNS TRIGGER AS
$BODY$
	DECLARE
		_old_pipe integer;
	BEGIN
		-- this will be fired for every node, although not every node is valve
		UPDATE qwat_od.vw_element_valve SET fk_pipe = qwat_od.fn_pipe_get_id(geometry) WHERE id = NEW.id; -- TODO prompt user to move it or not
		-- this will be calling the trigger ft_valve_update
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_node_update() IS 'Trigger: when moving a valve, update the corresponding pipe. Do an AFTER trigger since it will update valve after updating the node.';

CREATE TRIGGER valve_pipe_update_trigger
	AFTER UPDATE OF geometry ON qwat_od.node
	FOR EACH ROW
	WHEN ( ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry) )
	EXECUTE PROCEDURE qwat_od.ft_valve_node_update();
COMMENT ON TRIGGER valve_pipe_update_trigger ON qwat_od.node IS 'Trigger: when moving a valve, update the corresponding pipe. Do an AFTER trigger since it will update valve after updating the node.';




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
CREATE TRIGGER valve_update_trigger
	AFTER UPDATE ON qwat_od.valve
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_valve_update();
COMMENT ON TRIGGER valve_update_trigger ON qwat_od.valve IS 'Trigger: when updating a valve, reevaluate old and new pipes.';

