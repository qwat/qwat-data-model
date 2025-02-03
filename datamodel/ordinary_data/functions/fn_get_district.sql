/*
	qWat - QGIS Water Module
	
	SQL file :: district functions
*/



/*----------------!!!---!!!----------------*/

/* get district id function */
CREATE OR REPLACE FUNCTION qwat_od.fn_get_district(geometry) RETURNS integer AS
$BODY$
	DECLARE
		geom ALIAS FOR $1;
		fk_district integer;
	BEGIN
		SELECT district.id INTO fk_district
			FROM  qwat_od.district
			WHERE ST_Intersects(geom,district.geometry) IS TRUE
			LIMIT 1;
		RETURN fk_district;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_get_district(geometry) IS 'Returns the id of the first overlapping district.';


