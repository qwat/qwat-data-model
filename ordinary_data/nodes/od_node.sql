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
Every element of the network (hydrants, valves, element, installations, etc.) inherit from element which itself inherits from node.
Node should only contain geometric fields and automatic attributes (district, pressurezone, printmaps, etc).';

/* COLUMNS */
ALTER TABLE qwat_od.node ADD COLUMN fk_district         integer;
ALTER TABLE qwat_od.node ADD COLUMN fk_pressurezone     integer;
ALTER TABLE qwat_od.node ADD COLUMN fk_printmap         integer[];
ALTER TABLE qwat_od.node ADD COLUMN _printmaps          text; -- list of printmap where it is included
ALTER TABLE qwat_od.node ADD COLUMN _geometry_alt1_used boolean;
ALTER TABLE qwat_od.node ADD COLUMN _geometry_alt2_used boolean;
-- fields calculated depending on connected pipes
ALTER TABLE qwat_od.node ADD COLUMN _pipe_node_type      qwat_od.pipe_connection default null;
ALTER TABLE qwat_od.node ADD COLUMN _pipe_orientation    float   default 0;
ALTER TABLE qwat_od.node ADD COLUMN _pipe_schema_visible boolean default false;

/* altitude - fk_object_reference, fk_altitude_precision constraints */
ALTER TABLE qwat_od.node ADD CONSTRAINT chk_node_altitude_obj_ref CHECK (fk_object_reference IS NOT NULL OR altitude IS NULL );
ALTER TABLE qwat_od.node ADD CONSTRAINT chk_altitude_fk_precisionalti CHECK (fk_precisionalti IS NOT NULL OR altitude IS NULL );

/* GEOMETRY */
ALTER TABLE qwat_od.node ADD COLUMN geometry geometry('POINTZ',:SRID);
ALTER TABLE qwat_od.node ADD COLUMN geometry_alt1 geometry('POINTZ',:SRID);
ALTER TABLE qwat_od.node ADD COLUMN geometry_alt2 geometry('POINTZ',:SRID);
CREATE INDEX node_geoidx ON qwat_od.node USING GIST ( geometry );
CREATE INDEX node_geoidx_alt1 ON qwat_od.node USING GIST ( geometry_alt1 );
CREATE INDEX node_geoidx_alt2 ON qwat_od.node USING GIST ( geometry_alt2 );


/* CONSTRAINTS */
ALTER TABLE qwat_od.node ADD CONSTRAINT node_fk_district      FOREIGN KEY (fk_district)      REFERENCES qwat_od.district(id)      MATCH FULL; CREATE INDEX fki_node_fk_district      ON qwat_od.node(fk_district);
ALTER TABLE qwat_od.node ADD CONSTRAINT node_fk_pressurezone  FOREIGN KEY (fk_pressurezone)  REFERENCES qwat_od.pressurezone(id)  MATCH FULL; CREATE INDEX fki_node_fk_pressurezone  ON qwat_od.node(fk_pressurezone);


/* GEOMETRY TRIGGERS */
CREATE OR REPLACE FUNCTION qwat_od.ft_node_geom()
  RETURNS trigger AS
$BODY$
	BEGIN
		NEW.geometry            := ST_Force3D(NEW.geometry);
		NEW.fk_district         := qwat_od.fn_get_district(NEW.geometry);
		NEW.fk_pressurezone     := qwat_od.fn_get_pressurezone(NEW.geometry);
		NEW.fk_printmap         := qwat_od.fn_get_printmap_id(NEW.geometry);
		NEW.geometry_alt1       := NEW.geometry; --TODO PROMT USER
		NEW.geometry_alt2       := NEW.geometry;
		NEW._geometry_alt1_used := false;
		NEW._geometry_alt2_used := false;
		NEW._printmaps          := qwat_od.fn_get_printmaps(NEW.geometry);
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
  WHEN (ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
  EXECUTE PROCEDURE qwat_od.ft_node_geom();
COMMENT ON TRIGGER tr_node_geom_update ON qwat_od.node IS 'Trigger: updates auto fields after geom update.';


/* --------------------------------------------*/
/* -------- MOVED NODE TRIGGER ----------------*/
CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_node_moved() RETURNS TRIGGER AS
	$BODY$
	DECLARE
		node_ids integer[];
	BEGIN
		UPDATE qwat_od.pipe SET	fk_node_a = qwat_od.fn_node_create(ST_StartPoint(geometry)) WHERE fk_node_a = OLD.id;
		UPDATE qwat_od.pipe SET	fk_node_b = qwat_od.fn_node_create(ST_EndPoint(  geometry)) WHERE fk_node_b = OLD.id;
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_pipe_node_moved() IS 'Trigger: if a network element (i.e. a node) has moved, then reaasign the nodes for the pipe.';

CREATE TRIGGER tr_pipe_node_moved
	AFTER UPDATE OF geometry ON qwat_od.node
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_pipe_node_moved();
COMMENT ON TRIGGER tr_pipe_node_moved ON qwat_od.node IS 'Trigger: if a network element (i.e. a node) has moved, then reaasign the nodes for the pipe. Do it after update.';






