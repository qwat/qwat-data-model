/*
	qWat - QGIS Water Module
	
	SQL file :: protection zones
*/

/* CREATE TABLE */
DROP VIEW IF EXISTS qwat_od.vw_printmap CASCADE;
CREATE VIEW qwat_od.vw_printmap AS 
	SELECT 
		printmap.*, 
		district.name || ' ' || printmap.name AS _longname,
		district.name AS _district,
		district.shortname AS _district_short
	FROM qwat_od.printmap
	INNER JOIN qwat_od.district ON printmap.fk_district = district.id ;

