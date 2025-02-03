CREATE OR REPLACE FUNCTION qwat_od.ft_valve_main_altitude() RETURNS TRIGGER AS
$BODY$
	DECLARE
	BEGIN
	-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
	IF TG_OP = 'INSERT' THEN
		IF NEW.altitude IS NOT NULL THEN
			NEW.geometry := ST_SetSRID(ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), NEW.altitude ), ST_SRID(NEW.geometry));
		ELSIF ST_Z(NEW.geometry) IS NOT NULL THEN
			NEW.altitude := ST_Z(NEW.geometry);
		END IF;
	ELSIF TG_OP = 'UPDATE' THEN
		IF NEW.altitude <> OLD.altitude THEN
			NEW.geometry := ST_SetSRID(ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), NEW.altitude ), ST_SRID(NEW.geometry));
		ELSIF ST_Z(NEW.geometry) <> ST_Z(OLD.geometry) THEN
			NEW.altitude := ST_Z(NEW.geometry);
		END IF;
	END IF;
	RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
