/*
	qWat - QGIS Water Module
	
	SQL file :: node
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.node (id serial PRIMARY KEY);

COMMENT ON TABLE qwat_od.node IS 'Nodes. Type:If three pipe or more arrives at the node: three. If one pipe: one. If two: depends on characteristics of pipe: two_same (everything same), two_year (year is different), two_material (and year is/are different), two_diameter (and material/year are different). Orientation is calculated if two pipe arrives to place the symbol in theright direction.';

/* columns */
ALTER TABLE qwat_od.node ADD COLUMN identification   varchar(20);
ALTER TABLE qwat_od.node ADD COLUMN fk_distributor   integer not null;
ALTER TABLE qwat_od.node ADD COLUMN fk_status        integer not null;
ALTER TABLE qwat_od.node ADD COLUMN fk_folder        integer ;
ALTER TABLE qwat_od.node ADD COLUMN fk_pipe          integer ;
ALTER TABLE qwat_od.node ADD COLUMN fk_object_reference integer;
ALTER TABLE qwat_od.node ADD COLUMN fk_precision     integer not null;
ALTER TABLE qwat_od.node ADD COLUMN fk_precisionalti integer;
ALTER TABLE qwat_od.node ADD COLUMN fk_locationtype  integer[];
ALTER TABLE qwat_od.node ADD COLUMN year             smallint CHECK (year     IS NULL OR year     > 1800 AND year     < 2100);
ALTER TABLE qwat_od.node ADD COLUMN year_end         smallint CHECK (year_end IS NULL OR year_end > 1800 AND year_end < 2100);
ALTER TABLE qwat_od.node ADD COLUMN altitude         decimal(10,3);
ALTER TABLE qwat_od.node ADD COLUMN remark           text;
-- fields calculated depending on connected pipes
ALTER TABLE qwat_od.node ADD COLUMN _pipe_node_type      varchar(40) default null;
ALTER TABLE qwat_od.node ADD COLUMN _pipe_orientation    float       default 0;
ALTER TABLE qwat_od.node ADD COLUMN _pipe_schema_visible boolean     default false;
ALTER TABLE qwat_od.node ADD COLUMN _pipe_status_active  boolean     default false;

/* schema view */
SELECT qwat_od.fn_enable_schemaview('node');

/* labels */
SELECT qwat_od.fn_label_create_fields('node');

/* geometry */
ALTER TABLE qwat_od.node ADD COLUMN geometry geometry('POINTZ',:SRID);
CREATE INDEX node_geoidx ON qwat_od.node USING GIST ( geometry );

/* constraints */
ALTER TABLE qwat_od.node ADD CONSTRAINT node_fk_distributor   FOREIGN KEY (fk_distributor)   REFERENCES qwat_od.distributor(id)   MATCH FULL; CREATE INDEX fki_node_fk_distributor   ON qwat_od.node(fk_distributor);
ALTER TABLE qwat_od.node ADD CONSTRAINT node_fk_status        FOREIGN KEY (fk_status)        REFERENCES qwat_vl.status(id)        MATCH FULL; CREATE INDEX fki_node_fk_status        ON qwat_od.node(fk_status);
ALTER TABLE qwat_od.node ADD CONSTRAINT node_fk_folder        FOREIGN KEY (fk_folder)        REFERENCES qwat_od.folder(id)        MATCH FULL; CREATE INDEX fki_node_fk_folder        ON qwat_od.node(fk_folder);
ALTER TABLE qwat_od.node ADD CONSTRAINT node_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL; CREATE INDEX fki_node_fk_object_reference ON qwat_od.node(fk_object_reference);
ALTER TABLE qwat_od.node ADD CONSTRAINT node_fk_precision     FOREIGN KEY (fk_precision)     REFERENCES qwat_vl.precision(id)     MATCH FULL; CREATE INDEX fki_node_fk_precision     ON qwat_od.node(fk_precision);
ALTER TABLE qwat_od.node ADD CONSTRAINT node_fk_precisionalti FOREIGN KEY (fk_precisionalti) REFERENCES qwat_vl.precisionalti(id) MATCH FULL; CREATE INDEX fki_node_fk_precisionalti ON qwat_od.node(fk_precisionalti);


/* Altitude triggers */
CREATE OR REPLACE FUNCTION qwat_od.ft_node_altitude() RETURNS TRIGGER AS
	$BODY$
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF TG_OP = 'INSERT' THEN
			IF NEW.altitude IS NULL THEN
				NEW.altitude := ST_Z(NEW.geometry);
			END IF;
			IF ST_Z(NEW.geometry) IS NULL THEN
				NEW.geometry := ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), altitude );
			END IF;
		ELSIF TG_OP = 'UPDATE' THEN
			IF NEW.altitue <> OLD.altitude THEN
				NEW.geometry := ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), altitude );
			ELSIF ST_Z(NEW.geometry) <> ST_Z(OLD.geometry) THEN
				NEW.altitude := ST_Z(NEW.geometry);
			END IF;
		END IF;
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE plpgsql;
	
CREATE TRIGGER node_altitude_update_trigger
	BEFORE UPDATE OF altitude, geometry ON qwat_od.node
	FOR EACH ROW
	WHEN (NEW.altitude <> OLD.altitude OR ST_Z(NEW.geometry) <> ST_Z(OLD.geometry))
	EXECUTE PROCEDURE qwat_od.ft_node_altitude();
COMMENT ON TRIGGER node_altitude_update_trigger ON qwat_od.node IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';

CREATE TRIGGER node_altitude_insert_trigger
	BEFORE INSERT ON qwat_od.node
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_node_altitude();
COMMENT ON TRIGGER node_altitude_insert_trigger ON qwat_od.node IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';



