/*
	qWat - QGIS Water Module
	
	SQL file :: consumption zones
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.consumptionzone CASCADE;
CREATE TABLE qwat_od.consumptionzone (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.consumptionzone IS 'consumption zones.';

/* COLUMNS */
ALTER TABLE qwat_od.consumptionzone ADD COLUMN name       varchar(50) ;
ALTER TABLE qwat_od.consumptionzone ADD COLUMN population integer default 0;
ALTER TABLE qwat_od.consumptionzone ADD COLUMN colorcode  smallint;

/* CONSTRAINT */
ALTER TABLE qwat_od.consumptionzone ADD CONSTRAINT consumptionzone_name UNIQUE (name);

