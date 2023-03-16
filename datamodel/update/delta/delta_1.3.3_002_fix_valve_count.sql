DROP TRIGGER tr_valve_update_trigger ON qwat_od.valve;
DROP FUNCTION IF EXISTS qwat_od.ft_valve_update();
DROP FUNCTION qwat_od.fn_pipe_update_valve(integer);

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
	AFTER INSERT OR UPDATE
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

CREATE OR REPLACE FUNCTION qwat_od.ft_valve_geom() RETURNS TRIGGER AS
$BODY$
    BEGIN
        NEW.fk_pipe             := qwat_od.fn_pipe_get_id(NEW.geometry);
        NEW.fk_district         := qwat_od.fn_get_district(NEW.geometry);
        NEW.fk_pressurezone     := qwat_od.fn_get_pressurezone(NEW.geometry);
	IF TG_OP = 'UPDATE' THEN
		PERFORM qwat_od.fn_pipe_delete_valve(OLD.id);
	END IF;

        RETURN NEW;
    END;
$BODY$
LANGUAGE plpgsql;
