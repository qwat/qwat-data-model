/*
	qWat - QGIS Water Module

	SQL file :: pressure zones
*/

/* CREATE TABLE */
DROP VIEW IF EXISTS qwat_od.vw_consumptionzone CASCADE;
CREATE VIEW qwat_od.vw_consumptionzone AS
	SELECT
		co.id AS id,
		co.name AS name,
		co.population AS population,
		co.colorcode AS colorcode,
		_sum_population,
		geometry
	FROM qwat_od.consumptionzone co,
		( SELECT
			fk_consumptionzone,
			SUM(population) AS _sum_population,
			ST_Multi(ST_CollectionHomogenize(ST_Union(geometry)))::geometry(MultiPolygon,21781) AS geometry
		FROM qwat_od.pressurezone pr
		GROUP BY fk_consumptionzone ) AS pr
	WHERE pr.fk_consumptionzone = co.id;
	
	
CREATE OR REPLACE RULE rl_consumptionzone_insert AS
	ON INSERT TO qwat_od.vw_consumptionzone DO INSTEAD
		INSERT INTO qwat_od.consumptionzone 
			(name, population, colorcode)
			VALUES
			(NEW.name, NEW.population, NEW.colorcode);
	
CREATE OR REPLACE RULE rl_consumptionzone_update AS
	ON UPDATE TO qwat_od.vw_consumptionzone DO INSTEAD
		UPDATE qwat_od.consumptionzone SET
			name = NEW.name,
			population = NEW.population,
			colorcode = NEW.colorcode
		WHERE id = NEW.id;
	
CREATE OR REPLACE RULE rl_consumptionzone_delete AS
	ON DELETE TO qwat_od.vw_consumptionzone DO INSTEAD
		DELETE FROM qwat_od.consumptionzone WHERE id = OLD.id;	

