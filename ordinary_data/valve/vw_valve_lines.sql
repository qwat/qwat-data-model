
/*
	qWat - QGIS Water Module
	
	SQL file :: valves_lines view
*/

CREATE OR REPLACE VIEW qwat_od.vw_valve_lines AS 
 SELECT valve.id,
    ST_MakeLine(valve.handle_geometry, valve.geometry)::geometry(LineString, :SRID) AS geometry
   FROM qwat_od.vw_node_valve valve
  WHERE valve.handle_geometry IS NOT NULL AND valve.geometry IS NOT NULL;

COMMENT ON VIEW qwat_od.vw_valve_lines IS 
'Valves represented as lines. Each line is made from two points, the handle as starting point and the location on the pipe as ending point.';

