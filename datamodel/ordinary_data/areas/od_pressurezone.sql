/*
	qWat - QGIS Water Module

	SQL file :: pressure zones
*/

/* CREATE TABLE */
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
ALTER TABLE qwat_od.pressurezone ADD COLUMN geometry      geometry('MULTIPOLYGON',:SRID);
ALTER TABLE qwat_od.pressurezone ADD COLUMN geometry_alt1 geometry('MULTIPOLYGON',:SRID);
ALTER TABLE qwat_od.pressurezone ADD COLUMN geometry_alt2 geometry('MULTIPOLYGON',:SRID);
CREATE INDEX pressurezone_geoidx      ON qwat_od.pressurezone USING GIST ( geometry );
CREATE INDEX pressurezone_geoidx_alt1 ON qwat_od.pressurezone USING GIST ( geometry_alt1 );
CREATE INDEX pressurezone_geoidx_alt2 ON qwat_od.pressurezone USING GIST ( geometry_alt2 );

ALTER TABLE qwat_od.pressurezone ADD COLUMN _geometry_alt1_used boolean;
ALTER TABLE qwat_od.pressurezone ADD COLUMN _geometry_alt2_used boolean;
ALTER TABLE qwat_od.pressurezone ADD COLUMN update_geometry_alt1 boolean default null; -- used to determine if alternative geometry 1 should be updated when main geometry is updated
ALTER TABLE qwat_od.pressurezone ADD COLUMN update_geometry_alt2 boolean default null; -- used to determine if alternative geometry 2 should be updated when main geometry is updated

/* LABELS */
DO $$ BEGIN PERFORM qwat_sys.fn_label_create_fields('pressurezone'); END $$;

/* CONSTRAINT */
ALTER TABLE qwat_od.pressurezone ADD CONSTRAINT pressurezone_name UNIQUE (name);
ALTER TABLE qwat_od.pressurezone ADD CONSTRAINT pressurezone_fk_distributor     FOREIGN KEY (fk_distributor)     REFERENCES qwat_od.distributor(id)     MATCH FULL; CREATE INDEX fki_pressurezone_fk_distributor     ON qwat_od.pressurezone(fk_distributor) ;
ALTER TABLE qwat_od.pressurezone ADD CONSTRAINT pressurezone_fk_consumptionzone FOREIGN KEY (fk_consumptionzone) REFERENCES qwat_od.consumptionzone(id) MATCH FULL; CREATE INDEX fki_pressurezone_fk_consumptionzone ON qwat_od.pressurezone(fk_consumptionzone) ;



/* --------------------------------------------*/
/* -------- ALTERNATIVE GEOM TRIGGER ----------*/

CREATE TRIGGER tr_pressurezone_altgeom_insert
	BEFORE INSERT ON qwat_od.pressurezone
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_main();
COMMENT ON TRIGGER tr_pressurezone_altgeom_insert ON qwat_od.pressurezone IS 'Trigger: handle alternative geometries on insert';

CREATE TRIGGER tr_pressurezone_altgeom_update
	BEFORE UPDATE OF geometry ON qwat_od.pressurezone
	FOR EACH ROW
	WHEN  ( ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_main();
COMMENT ON TRIGGER tr_pressurezone_altgeom_update ON qwat_od.pressurezone IS 'Trigger: handle alternative geometries on update';

CREATE TRIGGER tr_pressurezone_altgeom_alt
	BEFORE UPDATE OF geometry_alt1, geometry_alt2 ON qwat_od.pressurezone
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_aux();
COMMENT ON TRIGGER tr_pressurezone_altgeom_alt ON qwat_od.pressurezone IS 'Trigger: when updating, check if alternative geometries are different to fill the boolean fields.';




