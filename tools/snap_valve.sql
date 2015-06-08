
-- snap valves to pipe vertices with a defined tolerance

update qwat_od.valve va set geometry = st_snap(va.geometry,pi.geometry,0.02)
from qwat_od.pipe pi 
where st_dwithin(va.geometry,pi.geometry, 0.02)
and va.fk_pipe is null ;


-- create vertices to snap valves to
update qwat_od.pipe pi
 set geometry = ST_LineMerge(
           ST_Union(
             ST_Line_Substring(pi.geometry, 0, ST_Line_Locate_Point(pi.geometry, st_ClosestPoint(va.geometry,pi.geometry))),
             ST_Line_Substring(pi.geometry, ST_Line_Locate_Point(pi.geometry, st_ClosestPoint(va.geometry,pi.geometry)), 1)
       ))
from qwat_od.valve va
where va.fk_pipe is null
and st_dwithin(pi.geometry,va.geometry, 0.05);


