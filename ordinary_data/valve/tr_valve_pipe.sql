/*
	qWat - QGIS Water Module

	SQL file :: valve-pipe functions and triggers
*/

/* UPDATES NUMBER OF VALVES AND CLOSED/OPEN FOR PIPES */
CREATE OR REPLACE FUNCTION qwat_od.fn_pipe_delete_valve(_valve_id integer)
  RETURNS void AS
$BODY$
BEGIN

IF (SELECT _valve_count > 1 FROM qwat_od.pipe WHERE id = (
					SELECT fk_pipe
					FROM qwat_od.valve
					WHERE id = _valve_id))
THEN
			UPDATE qwat_od.pipe
			SET
				_valve_count  = valve_group.vcount,
				_valve_closed = valve_group.vclosed
			FROM qwat_od.pipe pipe_dupp
			INNER JOIN (
			SELECT fk_pipe, count(id) AS vcount, bool_or(closed) AS vclosed
				FROM qwat_od.valve
				WHERE fk_pipe = (
					SELECT fk_pipe
					FROM qwat_od.valve
					WHERE id = _valve_id) and id != _valve_id
				group by fk_pipe
				) AS valve_group
			ON pipe_dupp.id = valve_group.fk_pipe
			WHERE pipe.id = (
				SELECT fk_pipe
				FROM qwat_od.valve
				WHERE id = _valve_id);
ELSE
			UPDATE qwat_od.pipe 
			SET
				_valve_count  = 0,
				_valve_closed = false
			WHERE pipe.id = (
				SELECT fk_pipe
				FROM qwat_od.valve
				WHERE id = _valve_id);

END IF;

END

$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION qwat_od.fn_pipe_update_valve(_valve_id integer)
  RETURNS void AS
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
				WHERE fk_pipe = (
					SELECT fk_pipe
					FROM qwat_od.valve
					WHERE id = _valve_id)
				group by fk_pipe
				) AS valve_group
			ON pipe_dupp.id = valve_group.fk_pipe
			WHERE pipe.id = (
				SELECT fk_pipe
				FROM qwat_od.valve
				WHERE id = _valve_id);
	END;
$BODY$
LANGUAGE plpgsql;


/* REASSIGN THE PIPE OF A VALVE WHEN THE PIPE MOVES OR IS DELETED, AND RECALCULATE VALVE ORIENTATION */
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_pipe_update() RETURNS TRIGGER AS
$BODY$
    DECLARE
        r record;
    BEGIN
        UPDATE qwat_od.valve SET fk_pipe = qwat_od.fn_pipe_get_id(geometry) WHERE fk_pipe = OLD.id OR ST_Distance(geometry, OLD.geometry) < 1e-4;

        -- Il faudrait un trigger sur un changement de géom sur les conduites qui appellent valve_set_orientation pour toutes les vannes avec fk_pipe = id.
        FOR r IN SELECT id FROM qwat_od.valve WHERE fk_pipe = OLD.id
        LOOP
            PERFORM qwat_od.fn_valve_set_orientation(r.id);
        END LOOP;

        RETURN NULL;
    END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_pipe_update() IS 'Trigger: when moving or deleting a pipe, reassign the pipe to all valves connected to the old pipe and recalculate valve orientation. Do an AFTER trigger since it will update valve after updating the node.';
/* WHEN THE PIPE MOVES */
CREATE TRIGGER tr_valve_pipe_update
    -- this will be fired for every node, although not every node is valve
	AFTER UPDATE OF geometry ON qwat_od.pipe
	FOR EACH ROW
	WHEN ( ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
	EXECUTE PROCEDURE qwat_od.ft_valve_pipe_update();
COMMENT ON TRIGGER tr_valve_pipe_update ON qwat_od.pipe IS 'Trigger: when moving a pipe, reassign the pipe to all valves connected to the old pipe and recalculate valve orientation. Do an AFTER trigger since it will update valve after updating the node.';
/* WHEN THE PIPE IS DELETED */
CREATE TRIGGER tr_valve_pipe_delete
    -- this will be fired for every node, although not every node is valve
	AFTER DELETE ON qwat_od.pipe
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_valve_pipe_update();
COMMENT ON TRIGGER tr_valve_pipe_delete ON qwat_od.pipe IS 'Trigger: when deleting a pipe, reassign the pipe to all valves connected to the old pipe and recalculate valve orientation. Do an AFTER trigger since it will update valve after updating the node.';





/* AFTER UPDATE OF A VALVE: REEVALUATE OLD AND NEW PIPES */
CREATE FUNCTION qwat_od.ft_valve() RETURNS TRIGGER AS
$BODY$
	BEGIN
		PERFORM qwat_od.fn_pipe_update_valve(NEW.id);
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_od.ft_valve() IS 'Trigger: when updating a valve, reevaluate old and new pipes for number of valves on them.';

CREATE TRIGGER tr_valve_trigger
	AFTER INSERT
	ON qwat_od.valve
	FOR EACH ROW
		EXECUTE PROCEDURE qwat_od.ft_valve();

COMMENT ON TRIGGER tr_valve_trigger ON qwat_od.valve 
IS 'Trigger: when inserting or updating a valve, reevaluate new pipes for number of valves on them.';

CREATE OR REPLACE FUNCTION qwat_od.ft_before_valve()
  RETURNS trigger AS
$BODY$
	BEGIN
		IF TG_OP = 'DELETE' THEN
			PERFORM qwat_od.fn_pipe_delete_valve(OLD.id);
		END IF;
		
		RETURN OLD;
	END;
$BODY$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_od.ft_before_valve() IS 'Trigger: when deleting a valve, reevaluate pipes for number of valves on them.';

CREATE TRIGGER tr_valve_delete_trigger
  BEFORE DELETE
  ON qwat_od.valve
  FOR EACH ROW
  EXECUTE PROCEDURE qwat_od.ft_before_valve();

COMMENT ON TRIGGER tr_valve_trigger ON qwat_od.valve 
IS 'Trigger: when deleting a valve, reevaluate old pipes for number of valves on them.';


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

