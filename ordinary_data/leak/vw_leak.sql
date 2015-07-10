/*
	qWat - QGIS Water Module
	
	SQL file :: leak view
*/

CREATE VIEW qwat_od.vw_leak AS 
	SELECT  
		leak_cause.value_fr  AS cause,
		widespread_damage,
		detection_date  ,
		repair_date     ,
		_repaired       ,
		address         ,
		pipe_replaced   ,
		description     ,
		repair          ,
		geometry::geometry(Point,:SRID)
	FROM qwat_od.leak
	INNER JOIN qwat_vl.leak_cause  ON leak.fk_cause  = leak_cause.id;



