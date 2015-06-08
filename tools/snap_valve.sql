
-- snap valves to pipe vertices with a defined tolerance

update qwat_od.valve va set geometry = st_snap(va.geometry,pi.geometry,0.02)
from qwat_od.pipe pi 
where st_dwithin(va.geometry,pi.geometry, 0.02)
and va.fk_pipe is null ;
