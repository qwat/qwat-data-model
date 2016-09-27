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



/* REASSIGN THE PIPE OF A VALVE WHEN THE PIPE MOVES OR IS DELETED */
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_pipe_update() RETURNS TRIGGER AS
$BODY$
    BEGIN
        UPDATE qwat_od.valve SET fk_pipe = qwat_od.fn_pipe_get_id(geometry) WHERE fk_pipe = OLD.id OR ST_Distance(geometry, OLD.geometry) < 1e-4;
        RETURN NULL;
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



/* ASSIGN PIPE TO VALVE */
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_geom() RETURNS TRIGGER AS
$BODY$
    BEGIN
        NEW.fk_pipe             := qwat_od.fn_pipe_get_id(NEW.geometry);
        NEW.fk_district         := qwat_od.fn_get_district(NEW.geometry);
        NEW.fk_pressurezone     := qwat_od.fn_get_pressurezone(NEW.geometry);
        RETURN NEW;
    END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_geom() IS 'Trigger: when inserting or updating a valve, assign pipe and geom infos.';

CREATE TRIGGER tr_valve_infos_insert_trigger
    BEFORE INSERT ON qwat_od.valve
    FOR EACH ROW
    EXECUTE PROCEDURE qwat_od.ft_valve_geom();
COMMENT ON TRIGGER tr_valve_infos_insert_trigger ON qwat_od.valve IS 'Trigger: when inserting a valve, assign pipe.';


CREATE TRIGGER tr_valve_infos_update_trigger
    BEFORE UPDATE ON qwat_od.valve
    FOR EACH ROW
     WHEN (NOT ST_Equals(OLD.geometry, NEW.geometry))
    EXECUTE PROCEDURE qwat_od.ft_valve_geom();
COMMENT ON TRIGGER tr_valve_infos_update_trigger ON qwat_od.valve IS 'Trigger: when updating a valve, assign pipe.';

