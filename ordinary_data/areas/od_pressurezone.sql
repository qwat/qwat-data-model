/*
	qWat - QGIS Water Module

	SQL file :: pressure zones
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.pressurezone CASCADE;
CREATE TABLE qwat_od.pressurezone (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.pressurezone IS 'Pressure zones.';

/* COLUMNS */
ALTER TABLE qwat_od.pressurezone ADD COLUMN fk_distributor     integer not null;
ALTER TABLE qwat_od.pressurezone ADD COLUMN fk_consumptionzone integer;
ALTER TABLE qwat_od.pressurezone ADD COLUMN name               varchar(50) not null;
ALTER TABLE qwat_od.pressurezone ADD COLUMN population         integer default null;
ALTER TABLE qwat_od.pressurezone ADD COLUMN subscriber         integer default null;
ALTER TABLE qwat_od.pressurezone ADD COLUMN colorcode          smallint;

/* GEOMETRY */
ALTER qwat_od.pressurezone TABLE ADD COLUMN geometry geometry('MULTIPOLYGON',:SRID);
CREATE INDEX pressurezone_geoidx ON qwat_od.pressurezone USING GIST ( geometry );

/* LABELS */
SELECT qwat_od.fn_label_create_fields('pressurezone');

/* CONSTRAINT */
ALTER TABLE qwat_od.pressurezone ADD CONSTRAINT pressurezone_name UNIQUE (name);
ALTER TABLE qwat_od.pressurezone ADD CONSTRAINT pressurezone_fk_distributor     FOREIGN KEY (fk_distributor)     REFERENCES qwat_od.distributor(id)     MATCH FULL; CREATE INDEX fki_pressurezone_fk_distributor     ON qwat_od.pressurezone(fk_distributor) ;
ALTER TABLE qwat_od.pressurezone ADD CONSTRAINT pressurezone_fk_consumptionzone FOREIGN KEY (fk_consumptionzone) REFERENCES qwat_od.consumptionzone(id) MATCH FULL; CREATE INDEX fki_pressurezone_fk_consumptionzone ON qwat_od.pressurezone(fk_consumptionzone) ;

