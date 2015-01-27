/*
	qWat - QGIS Water Module
	
	SQL file :: pressure zones
*/

/* CREATE TABLE */
DROP VIEW IF EXISTS qwat_od.vw_consumptionzone CASCADE;
CREATE VIEW qwat_od.vw_consumptionzone AS 
	SELECT 
		consumptionzone AS name, 
		ST_Multi(ST_CollectionHomogenize(ST_Union(geometry)))::geometry(MultiPolygon,21781)
	FROM qwat_od.pressurezone
	GROUP BY consumptionzone;

