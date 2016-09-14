ALTER TABLE qwat_od.valve ADD COLUMN fk_district integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_district FOREIGN KEY (fk_district) REFERENCES qwat_od.district(id) MATCH FULL;
CREATE INDEX fki_valve_fk_district ON qwat_od.valve(fk_district);

ALTER TABLE qwat_od.valve ADD COLUMN fk_pressurezone         integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_pressurezone  FOREIGN KEY (fk_pressurezone)  REFERENCES qwat_od.pressurezone(id)  MATCH FULL;
CREATE INDEX fki_valve_fk_pressurezone  ON qwat_od.valve(fk_pressurezone);

ALTER TABLE qwat_od.valve ADD COLUMN fk_distributor           integer not null;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_distributor    FOREIGN KEY (fk_distributor)    REFERENCES qwat_od.distributor(id)        MATCH FULL;
CREATE INDEX fki_valve_fk_distributor   ON qwat_od.valve(fk_distributor);

ALTER TABLE qwat_od.valve ADD COLUMN fk_precision            integer not null;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_precision      FOREIGN KEY (fk_precision)      REFERENCES qwat_vl.precision(id)          MATCH FULL;
CREATE INDEX fki_valve_fk_precision     ON qwat_od.valve(fk_precision);

ALTER TABLE qwat_od.valve ADD COLUMN fk_status               integer not null;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_status         FOREIGN KEY (fk_status)         REFERENCES qwat_vl.status(id)             MATCH FULL;
CREATE INDEX fki_valve_fk_status        ON qwat_od.valve(fk_status);

ALTER TABLE qwat_od.valve ADD COLUMN fk_object_reference     integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL;
CREATE INDEX fki_valve_fk_object_reference ON qwat_od.valve(fk_object_reference);

ALTER TABLE qwat_od.valve ADD COLUMN fk_folder               integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_folder           FOREIGN KEY (fk_folder)           REFERENCES qwat_od.folder(id)           MATCH FULL;
CREATE INDEX fki_valve_fk_folder           ON qwat_od.valve(fk_folder);

ALTER TABLE qwat_od.valve ADD COLUMN fk_precisionalti        integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_precisionalti    FOREIGN KEY (fk_precisionalti)    REFERENCES qwat_vl.precisionalti(id)    MATCH FULL;
CREATE INDEX fki_valve_fk_precisionalti    ON qwat_od.valve(fk_precisionalti);

ALTER TABLE qwat_od.valve ADD COLUMN geometry geometry('POINTZ',:SRID) NOT NULL;
ALTER TABLE qwat_od.valve ADD COLUMN geometry_alt1 geometry('POINTZ',:SRID);
ALTER TABLE qwat_od.valve ADD COLUMN geometry_alt2 geometry('POINTZ',:SRID);
ALTER TABLE qwat_od.valve ADD COLUMN update_geometry_alt1 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated
ALTER TABLE qwat_od.valve ADD COLUMN update_geometry_alt2 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated

CREATE INDEX valve_geoidx ON qwat_od.valve USING GIST ( geometry );
CREATE INDEX valve_geoidx_alt1 ON qwat_od.valve USING GIST ( geometry_alt1 );
CREATE INDEX valve_geoidx_alt2 ON qwat_od.valve USING GIST ( geometry_alt2 );

ALTER TABLE qwat_od.valve ALTER COLUMN id serial;
-- integer NOT NULL REFERENCES qwat_od.network_element(id) PRIMARY KEY;

ALTER TABLE qwat_od.valve ADD COLUMN year          smallint CHECK (year     IS NULL OR year     > 1800 AND year     < 2100);
ALTER TABLE qwat_od.valve ADD COLUMN altitude                decimal(10,3) default null;
ALTER TABLE qwat_od.valve ADD COLUMN orientation             float default null;

SELECT qwat_sys.fn_enable_schemaview( 'valve' );

-- Valve orientation
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_set_orientation() RETURNS TRIGGER AS
$BODY$
    BEGIN
        PERFORM qwat_od.fn_valve_set_orientation(NEW.id);
    RETURN NEW;
    END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_set_orientation() IS 'Trigger: set orientation after inserting a valve.';

CREATE TRIGGER valve_set_orientation
    AFTER INSERT ON qwat_od.valve
    FOR EACH ROW
    EXECUTE PROCEDURE qwat_od.ft_valve_set_orientation();
COMMENT ON TRIGGER valve_set_orientation ON qwat_od.valve IS 'Trigger: set orientation after inserting a valve.';

