/*
	qWat - QGIS Water Module

	SQL file :: node
*/

CREATE TYPE qwat_od.pipe_connection AS ENUM (
	'pipe_end', -- at the end of a single pipe
	'couple_same', -- connects two pipes with the same material/diameter/year
	'couple_year', -- connects two pipe with the same material/diameter but not the same year
	'couple_diameter', -- connects two pipes with same material but different diameter
	'couple_material', -- connects two pipes with same diameter but different material
	'couple_other', -- connects two different pipes
	'T' -- connects three or more pipes
	);

/* CREATE TABLE */
CREATE TABLE qwat_od.node (id serial PRIMARY KEY);

COMMENT ON TABLE qwat_od.node IS 'Tables for network nodes.
Every element of the network (hydrants, valves, element, installations, etc.) inherit from element which itself inherits from node.';

/* COLUMNS */
ALTER TABLE qwat_od.node ADD COLUMN fk_district         integer;
ALTER TABLE qwat_od.node ADD COLUMN fk_pressurezone     integer;
ALTER TABLE qwat_od.node ADD COLUMN fk_printmap         integer[];
ALTER TABLE qwat_od.node ADD COLUMN fk_precision        integer;
ALTER TABLE qwat_od.node ADD COLUMN fk_precisionalti    integer;
ALTER TABLE qwat_od.node ADD COLUMN fk_object_reference integer CHECK (fk_object_reference IS NOT NULL OR altitude IS NULL);
ALTER TABLE qwat_od.node ADD COLUMN altitude            decimal(10,3);
ALTER TABLE qwat_od.node ADD COLUMN _printmaps          text; -- list of printmap where it is included
ALTER TABLE qwat_od.node ADD COLUMN _geometry_alt1_used boolean;
ALTER TABLE qwat_od.node ADD COLUMN _geometry_alt2_used boolean;
-- fields calculated depending on connected pipes
ALTER TABLE qwat_od.node ADD COLUMN _pipe_node_type      qwat_od.pipe_connection default null;
ALTER TABLE qwat_od.node ADD COLUMN _pipe_orientation    float       default 0;
ALTER TABLE qwat_od.node ADD COLUMN _pipe_schema_visible boolean     default false;
ALTER TABLE qwat_od.node ADD COLUMN _pipe_status_active  boolean     default false;



/* GEOMETRY */
ALTER TABLE qwat_od.node ADD COLUMN geometry geometry('POINTZ',:SRID);
ALTER TABLE qwat_od.node ADD COLUMN geometry_alt1 geometry('POINTZ',:SRID);
ALTER TABLE qwat_od.node ADD COLUMN geometry_alt2 geometry('POINTZ',:SRID);
CREATE INDEX node_geoidx ON qwat_od.node USING GIST ( geometry );
CREATE INDEX node_geoidx_alt1 ON qwat_od.node USING GIST ( geometry_alt1 );
CREATE INDEX node_geoidx_alt2 ON qwat_od.node USING GIST ( geometry_alt2 );


/* CONSTRAINTS */
ALTER TABLE qwat_od.node ADD CONSTRAINT element_fk_district      FOREIGN KEY (fk_district)      REFERENCES qwat_od.district(id)      MATCH FULL; CREATE INDEX fki_node_fk_district      ON qwat_od.node(fk_district);
ALTER TABLE qwat_od.node ADD CONSTRAINT element_fk_pressurezone  FOREIGN KEY (fk_pressurezone)  REFERENCES qwat_od.pressurezone(id)  MATCH FULL; CREATE INDEX fki_node_fk_pressurezone  ON qwat_od.node(fk_pressurezone);
ALTER TABLE qwat_od.node ADD CONSTRAINT element_fk_precision     FOREIGN KEY (fk_precision)     REFERENCES qwat_vl.precision(id)     MATCH FULL; CREATE INDEX fki_node_fk_precision     ON qwat_od.node(fk_precision);
ALTER TABLE qwat_od.node ADD CONSTRAINT element_fk_precisionalti FOREIGN KEY (fk_precisionalti) REFERENCES qwat_vl.precisionalti(id) MATCH FULL; CREATE INDEX fki_node_fk_precisionalti ON qwat_od.node(fk_precisionalti);
ALTER TABLE qwat_od.node ADD CONSTRAINT node_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL; CREATE INDEX fki_node_fk_object_reference ON qwat_od.node(fk_object_reference);

/* GEOMETRY TRIGGERS */
CREATE OR REPLACE FUNCTION qwat_od.ft_node_geom()
  RETURNS trigger AS
$BODY$
	BEGIN
		NEW.fk_district         := qwat_od.fn_get_district(NEW.geometry);
		NEW.fk_pressurezone     := qwat_od.fn_get_pressurezone(NEW.geometry);
		NEW.fk_printmap         := qwat_od.fn_get_printmap_id(NEW.geometry);
		NEW.geometry_alt1       := NEW.geometry; --TODO PROMT USER
		NEW.geometry_alt2       := NEW.geometry;
		NEW._geometry_alt1_used := false;
		NEW._geometry_alt2_used := false;
		NEW._printmaps          := qwat_od.fn_get_printmaps(NEW.geometry);
		IF TG_OP = 'UPDATE' THEN
			-- reassign nodes to pipes if a node moved
			UPDATE qwat_od.pipe SET pipe.fk_node_a = qwat_od.fn_node_create(pipe.geometry) WHERE pipe.fk_node_a = OLD.id;
			UPDATE qwat_od.pipe SET pipe.fk_node_b = qwat_od.fn_node_create(pipe.geometry) WHERE pipe.fk_node_a = OLD.id;
		END IF;
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER tr_node_geom_insert
  BEFORE INSERT
  ON qwat_od.node
  FOR EACH ROW
  EXECUTE PROCEDURE qwat_od.ft_node_geom();
COMMENT ON TRIGGER tr_node_geom_insert ON qwat_od.node IS 'Trigger: updates auto fields after insert.';

CREATE TRIGGER tr_node_geom_update
  BEFORE UPDATE OF geometry
  ON qwat_od.node
  FOR EACH ROW
  WHEN ((ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry)))
  EXECUTE PROCEDURE qwat_od.ft_node_geom();
COMMENT ON TRIGGER tr_node_geom_update ON qwat_od.node IS 'Trigger: updates auto fields after geom update.';


/* ALTITUDE TRIGGER */
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





