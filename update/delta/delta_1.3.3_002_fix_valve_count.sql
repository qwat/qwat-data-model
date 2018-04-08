DROP TRIGGER tr_valve_update_trigger ON qwat_od.valve;
DROP FUNCTION IF EXISTS qwat_od.ft_valve_update();

CREATE FUNCTION qwat_od.ft_valve() RETURNS TRIGGER AS
$BODY$
	BEGIN
		IF TG_OP <> 'INSERT' THEN
			PERFORM qwat_od.fn_pipe_update_valve(OLD.id);
		END IF;
		IF TG_OP <> 'DELETE' THEN
			PERFORM qwat_od.fn_pipe_update_valve(NEW.id);
		END IF;
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_od.ft_valve() 
IS 'Trigger: when updating a valve, reevaluate old and new pipes for number of valves on them.';

CREATE TRIGGER tr_valve_trigger
	AFTER INSERT OR UPDATE OR DELETE
	ON qwat_od.valve
	FOR EACH ROW
		EXECUTE PROCEDURE qwat_od.ft_valve();

COMMENT ON TRIGGER tr_valve_trigger ON qwat_od.valve 
IS 'Trigger: when updating a valve, reevaluate old an new pipes for number of valves on them.';
