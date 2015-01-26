/*
	qWat - QGIS Water Module
	
	SQL file :: leak view
*/

DROP VIEW IF EXISTS qwat_od.vw_leak CASCADE;
CREATE VIEW qwat_od.vw_leak AS 
	SELECT  
		leak_type.value_fr   AS type,  
		leak_cause.value_fr  AS cause,
		leak_damage.value_fr AS damage,
		detection_date  ,
		repair_date     ,
		_repaired       ,
		address         ,
		pipe_replaced   ,
		description     ,
		repair          ,
		geometry::geometry(Point,21781)
	FROM qwat_od.leak
	INNER      JOIN qwat_vl.leak_type   ON leak.id_type   = leak_type.id
	LEFT OUTER JOIN qwat_vl.leak_cause  ON leak.id_cause  = leak_cause.id
	INNER      JOIN qwat_vl.leak_damage ON leak.id_damage = leak_damage.id;



