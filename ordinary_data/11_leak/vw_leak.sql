/*
	qWat - QGIS Water Module
	
	SQL file :: leak view
*/

DROP VIEW IF EXISTS qwat_od.vw_leak CASCADE;
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
		geometry::geometry(Point,21781)
	FROM qwat_od.leak
	INNER JOIN qwat_vl.leak_cause  ON leak.fk_cause  = leak_cause.id;



