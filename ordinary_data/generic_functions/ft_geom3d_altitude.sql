


/* Altitude triggers */
CREATE OR REPLACE FUNCTION qwat_od.ft_geom3d_altitude() RETURNS TRIGGER AS
$BODY$
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.altitude IS NULL THEN
			NEW.altitude := NULLIF( ST_Z(NEW.geometry), 0.0); -- 0 is the NULL value
		END IF;
		IF 	NEW.altitude IS NULL     AND ST_Z(NEW.geometry) <> 0.0 			OR
			NEW.altitude IS NOT NULL AND ST_Z(NEW.geometry) <> NEW.altitude THEN
				NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), COALESCE(NEW.altitude,0) ), ST_SRID(NEW.geometry) );
		END IF;
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
