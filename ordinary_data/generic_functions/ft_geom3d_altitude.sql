


/* Altitude triggers */
CREATE OR REPLACE FUNCTION qwat_od.ft_geom3d_altitude() RETURNS TRIGGER AS
$BODY$
	BEGIN
		-- altitude has priority over geometry Z value (if both changed, only altitude is taken into account)
		IF TG_OP = 'INSERT' THEN
		   IF NEW.altitude IS NULL THEN
		       NEW.altitude := COALESCE(ST_Z(NEW.geometry),0);
		       NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), NEW.altitude ), ST_SRID(NEW.geometry) );
		    ELSE
		        NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), NEW.altitude ), ST_SRID(NEW.geometry) );
		    END IF;
		ELSE  					-- On UPDATE
		    IF NEW.altitude <> OLD.altitude THEN 	-- IF altitude changed
		    NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), NEW.altitude ), ST_SRID(NEW.geometry) );
		    ELSE  					-- IF Z changed
			NEW.altitude = ST_Z(NEW.geometry);
		    END IF;
		END IF;
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
