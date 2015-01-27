/*
	qWat - QGIS Water Module
	
	SQL file :: protection zones
*/

/* CREATE TABLE */
DROP VIEW IF EXISTS qwat_od.vw_protectionzone CASCADE;
CREATE VIEW qwat_od.vw_protectionzone AS 
	SELECT 
		protectionzone.*, 
		protectionzone_type.value_fr AS _type_long,
		protectionzone_type.short_fr AS _type
	FROM qwat_od.protectionzone
	INNER JOIN qwat_vl.protectionzone_type ON protectionzone.id_type = protectionzone_type.id ;

