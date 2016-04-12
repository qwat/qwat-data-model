
/*
	qWat - QGIS Water Module

	SQL file :: alternative geometry function trigger
*/



CREATE OR REPLACE FUNCTION qwat_od.ft_geometry_alternative_main() RETURNS TRIGGER AS
	$BODY$
	BEGIN
        RAISE NOTICE 'ft_geometry_alternative_main';
		IF NEW.geometry_alt1 IS NULL OR NEW.update_geometry_alt1 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt1 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt1) ) THEN
			NEW.geometry_alt1 := NEW.geometry;
		END IF;
		IF NEW.geometry_alt2 IS NULL OR NEW.update_geometry_alt2 IS TRUE OR ( TG_OP = 'UPDATE' AND NEW.update_geometry_alt2 IS NULL AND ST_Equals(OLD.geometry, OLD.geometry_alt2) ) THEN
			NEW.geometry_alt2 := NEW.geometry;
		END IF;
		NEW._geometry_alt1_used := ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW.update_geometry_alt1 := NULL; -- used to determine if alternative geometry 1 should be updated when main geometry is updated
		NEW.update_geometry_alt2 := NULL; -- used to determine if alternative geometry 2 should be updated when main geometry is updated
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE plpgsql;
	
	
CREATE OR REPLACE FUNCTION qwat_od.ft_geometry_alternative_aux() RETURNS TRIGGER AS
	$BODY$
	BEGIN
		NEW._geometry_alt1_used := NEW.geometry_alt1 IS NOT NULL AND ST_Equals(ST_Force2d(NEW.geometry_alt1), ST_Force2d(NEW.geometry)) IS FALSE;
		NEW._geometry_alt2_used := NEW.geometry_alt2 IS NOT NULL AND ST_Equals(ST_Force2d(NEW.geometry_alt2), ST_Force2d(NEW.geometry)) IS FALSE;
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE plpgsql;
