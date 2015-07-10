/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


DROP TABLE IF EXISTS qwat_od.meter CASCADE;
CREATE TABLE qwat_od.meter (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.meter IS 'Table for meters.';



/* COLUMNS */
ALTER TABLE qwat_od.meter ADD COLUMN fk_status integer not null;
ALTER TABLE qwat_od.meter ADD COLUMN fk_pipe integer;
ALTER TABLE qwat_od.meter ADD COLUMN identification varchar(12) ;
ALTER TABLE qwat_od.meter ADD COLUMN _identification_full varchar(16) ;
ALTER TABLE qwat_od.meter ADD COLUMN parcel varchar(12)  ;
ALTER TABLE qwat_od.meter ADD COLUMN remark  text ;
ALTER TABLE qwat_od.meter ADD COLUMN year smallint CHECK (year IS NULL OR year > 1800 AND year < 2100);

/* GEOMETRY                     (table_name, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('meter',    false,    false,      false,            false,    true,         true);

/* LABELS */
SELECT qwat_od.fn_label_create_fields('meter');

/* CONSTRAINTS */
ALTER TABLE qwat_od.meter ADD CONSTRAINT pipe_fk_status FOREIGN KEY (fk_status) REFERENCES qwat_vl.status(id) MATCH FULL  ; CREATE INDEX fki_fk_status ON qwat_od.meter(fk_status);
ALTER TABLE qwat_od.meter ADD CONSTRAINT meter_fk_pipe  FOREIGN KEY (fk_pipe)   REFERENCES qwat_od.pipe (id)  MATCH SIMPLE; CREATE INDEX fki_fk_pipe   ON qwat_od.meter(fk_pipe)  ;


/* TRIGGER */
CREATE OR REPLACE FUNCTION qwat_od.ft_meter_fullid() RETURNS trigger AS
$BODY$
	BEGIN
		NEW._identification_full := district.prefix||'_'||NEW.identification FROM qwat_od.district WHERE district.id = NEW.fk_district ;
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_meter_fullid() IS 'Fcn/Trigger: updates the full identification (district prefix) of the client.';

CREATE TRIGGER tr_meter_fullid
	BEFORE INSERT OR UPDATE OF fk_district,identification ON qwat_od.meter
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_meter_fullid();
COMMENT ON TRIGGER tr_meter_fullid ON qwat_od.meter IS 'Trigger: updates the full identification (district prefix) of the meter.';




