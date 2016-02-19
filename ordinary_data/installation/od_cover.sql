/*
	qWat - QGIS Water Module

	SQL file :: cover table
*/


CREATE TABLE qwat_od.cover ();
COMMENT ON TABLE qwat_od.cover IS 'Table for installation covers.  Inherits from node.';

/* COLUMNS */
ALTER TABLE qwat_od.cover ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE qwat_od.cover ADD COLUMN identification  varchar(50);
ALTER TABLE qwat_od.cover ADD COLUMN fk_distributor  integer;
ALTER TABLE qwat_od.cover ADD COLUMN fk_status       integer;
ALTER TABLE qwat_od.cover ADD COLUMN fk_cover_type   integer;
ALTER TABLE qwat_od.cover ADD COLUMN fk_installation integer;
ALTER TABLE qwat_od.cover ADD COLUMN year smallint   CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.cover ADD COLUMN altitude        numeric(8,3);
ALTER TABLE qwat_od.cover ADD COLUMN circular        boolean default true;
ALTER TABLE qwat_od.cover ADD COLUMN form_dimension  decimal(10,3)       ; COMMENT ON COLUMN qwat_od.cover.form_dimension  IS 'depending on the cover form, it represents either the diameter of circle or the length of a square side';
ALTER TABLE qwat_od.cover ADD COLUMN remark          text                ;
ALTER TABLE qwat_od.cover ADD COLUMN geometry         geometry('PointZ', :SRID);
ALTER TABLE qwat_od.cover ADD COLUMN geometry_polygon geometry('Polygon', :SRID);


/* LABELS */
SELECT qwat_sys.fn_label_create_fields('cover');

/* CONSTRAINTS */
ALTER TABLE qwat_od.cover ADD CONSTRAINT cover_fk_type         FOREIGN KEY (fk_cover_type)   REFERENCES qwat_vl.cover_type(id)   MATCH FULL; CREATE INDEX fki_cover_fk_type         ON qwat_od.cover(fk_cover_type)  ;
ALTER TABLE qwat_od.cover ADD CONSTRAINT cover_fk_installation FOREIGN KEY (fk_installation) REFERENCES qwat_od.installation(id) MATCH FULL; CREATE INDEX fki_cover_fk_installation ON qwat_od.cover(fk_installation);


CREATE TRIGGER cover_altitude_update_trigger
	BEFORE UPDATE OF altitude, geometry ON qwat_od.cover
	FOR EACH ROW
	WHEN (NEW.altitude <> OLD.altitude OR ST_Z(NEW.geometry) <> ST_Z(OLD.geometry))
	EXECUTE PROCEDURE qwat_od.ft_geom3d_altitude();
COMMENT ON TRIGGER cover_altitude_update_trigger ON qwat_od.cover IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';

CREATE TRIGGER cover_altitude_insert_trigger
	BEFORE INSERT ON qwat_od.cover
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_geom3d_altitude();
COMMENT ON TRIGGER cover_altitude_insert_trigger ON qwat_od.cover IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';

