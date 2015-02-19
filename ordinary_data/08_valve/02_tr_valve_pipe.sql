/*
	qWat - QGIS Water Module
	
	SQL file :: valve-pipe functions and rules
*/

/* number of valves on a pipe and determination of the opening of a pipe is updated in pipe table automatically */

/* Trigger function to update valve count and opening for pipe */
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_update_pipe() RETURNS TRIGGER AS
	$BODY$
	DECLARE
		_pipe_ids integer[];
		_pipe_id integer;
	BEGIN
   		IF TG_OP = 'INSERT' THEN
			_pipe_ids := ARRAY[NEW.id_pipe];
		ELSE
			_pipe_ids := ARRAY[OLD.id_pipe];
		END IF;

		IF TG_OP = 'UPDATE' THEN
			IF NEW.id_pipe <> OLD.id_pipe THEN
				_pipe_ids := array_append(_pipe_ids, NEW.id_pipe);
			END IF;
		END IF;
		
		FOREACH _pipe_id IN ARRAY _pipe_ids LOOP
			UPDATE qwat_od.pipe 
				SET 
					_valve_count  = valve_group.vcount,
					_valve_closed = valve_group.vclosed
				FROM qwat_od.pipe pipe_dupp
				INNER JOIN (
					SELECT id_pipe, count(id) AS vcount, bool_or(closed) AS vclosed
					FROM qwat_od.valve
					WHERE id_pipe = _pipe_id
					GROUP BY id_pipe 
					) AS valve_group
				ON pipe_dupp.id = valve_group.id_pipe
				WHERE pipe.id = _pipe_id;
		END LOOP;
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE plpgsql;

CREATE TRIGGER tr_valve_update_pipe_insdel
	AFTER INSERT OR DELETE ON qwat_od.valve
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_valve_update_pipe();
COMMENT ON TRIGGER tr_valve_update_pipe_insdel ON qwat_od.valve IS 'Trigger: after insert or delete of a valve, update valve count and pipe opening of the associated pipe.';

CREATE TRIGGER tr_valve_update_pipe_update
	AFTER UPDATE ON qwat_od.valve
	FOR EACH ROW
	WHEN (NEW.id_pipe <> OLD.id_pipe OR NEW.closed <> OLD.closed)
	EXECUTE PROCEDURE qwat_od.ft_valve_update_pipe();
COMMENT ON TRIGGER tr_valve_update_pipe_update ON qwat_od.valve IS 'Trigger: after updating of a valve, update valve count and pipe opening of the associated pipe.';

