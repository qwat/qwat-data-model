
/*
	qWat - QGIS Water Module
	
	SQL file :: valves_lines view
*/


DROP VIEW IF EXISTS qwat_od.vw_valve_lines;
CREATE OR REPLACE VIEW qwat_od.vw_valve_lines AS 
 SELECT valve.id,
    ST_SetSRID(ST_MakeLine(valve.geometry_handle, valve.geometry), 21781) AS geometry
   FROM qwat_od.valve
  WHERE valve.geometry_handle IS NOT NULL AND valve.geometry IS NOT NULL;

COMMENT ON VIEW qwat_od.vw_valve_lines IS 
'Valves represented as lines. Each line is made from two points, the handle as starting point and the location on the pipe as ending point.';

