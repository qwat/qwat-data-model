/*
	qWat - QGIS Water Module
	
	SQL file :: valve-pipe functions and rules
*/

/* number of valves on a pipe and determination of the opening of a pipe is updated in pipe table automatically */


/* count pipes for a valve */
CREATE OR REPLACE FUNCTION qwat_od.fn_pipe_count_valve(_pipe_id integer) RETURNS integer AS
$BODY$
	DECLARE
		valve_count integer;
	BEGIN
		SELECT COUNT(id) FROM qwat_od.valve WHERE id_pipe = _pipe_id INTO valve_count;
		RETURN valve_count ;
	END
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_pipe_count_valve(integer) IS 'Count the number of valves related to a given pipe.';


/* is a pipe closed */
CREATE OR REPLACE FUNCTION qwat_od.fn_pipe_is_closed(_pipe_id integer) RETURNS boolean AS
$BODY$
	DECLARE
		isClosed boolean := false;
	BEGIN
		SELECT bool_or(closed) FROM qwat_od.valve WHERE id_pipe = _pipe_id INTO isClosed;
		RETURN isClosed ;
	END
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_pipe_is_closed(integer) IS 'Determine if the given pipe is closed by a valve or not.';


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
				_pipe_ids := array_append(pipe_ids, NEW.id_pipe);
			END IF;
		END IF;
		
		FOREACH _pipe_id IN ARRAY _pipe_ids LOOP
			UPDATE qwat_od.pipe 
				SET 
					_valve_count  = qwat_od.fn_pipe_count_valve(_pipe_id),
					_valve_closed = qwat_od.fn_pipe_is_closed(_pipe_id) 
				WHERE id = _pipe_id;
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

