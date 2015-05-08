/*
	qWat - QGIS Water Module
	
	SQL file :: district functions
*/



/*----------------!!!---!!!----------------*/
/* get districts name function */
CREATE OR REPLACE FUNCTION qwat_od.fn_get_districts(geometry) RETURNS text AS
$BODY$
	DECLARE
		geom ALIAS FOR $1;
		result text;
	BEGIN
		SELECT string_agg(district.name , ', ') INTO result
			FROM  qwat_od.district
			WHERE ST_Intersects(geom,district.geometry) IS TRUE;
		RETURN result;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_get_districts(geometry) IS 'Returns a coma separeted list of the districts overlapping the given geometry.';

/* get district id function */
CREATE OR REPLACE FUNCTION qwat_od.fn_get_district_id(geometry) RETURNS integer AS
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
COMMENT ON FUNCTION qwat_od.fn_get_district_id(geometry) IS 'Returns the id of the first overlapping district.';


