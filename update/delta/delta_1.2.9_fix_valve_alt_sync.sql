

-- restore synchronization within altitude field and geometry



BEGIN;

CREATE OR REPLACE FUNCTION qwat_od.ft_valve_main_altitude() RETURNS TRIGGER AS
$BODY$
	DECLARE
	BEGIN
	-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
	IF TG_OP = 'INSERT' THEN
		IF NEW.altitude IS NULL THEN
			NEW.altitude := ST_Z(NEW.geometry);
		END IF;
		IF ST_Z(NEW.geometry) IS NULL THEN
			NEW.geometry := ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), altitude );
		END IF;
	ELSIF TG_OP = 'UPDATE' THEN
		IF NEW.altitue <> OLD.altitude THEN
			NEW.geometry := ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), altitude );
		ELSIF ST_Z(NEW.geometry) <> ST_Z(OLD.geometry) THEN
			NEW.altitude := ST_Z(NEW.geometry);
		END IF;
	END IF;
	RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_main_altitude() IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';

CREATE TRIGGER valve_main_altitude_update_trigger
	BEFORE UPDATE OF altitude, geometry ON qwat_od.valve
	FOR EACH ROW
	WHEN (NEW.altitude <> OLD.altitude OR ST_Z(NEW.geometry) <> ST_Z(OLD.geometry))
	EXECUTE PROCEDURE qwat_od.ft_valve_main_altitude();
COMMENT ON TRIGGER valve_main_altitude_update_trigger ON qwat_od.valve IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';

CREATE TRIGGER valve_main_altitude_insert_trigger
	BEFORE INSERT ON qwat_od.valve
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_valve_main_altitude();
COMMENT ON TRIGGER valve_main_altitude_insert_trigger ON qwat_od.valve IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';


UPDATE qwat_sys.versions SET version = '1.2.8';

COMMIT;
