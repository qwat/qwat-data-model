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

/* GEOMETRY */
ALTER TABLE qwat_od.node ADD COLUMN geometry geometry('POINTZ',:SRID) NOT NULL;
ALTER TABLE qwat_od.node ADD COLUMN geometry_alt1 geometry('POINTZ',:SRID);
ALTER TABLE qwat_od.node ADD COLUMN geometry_alt2 geometry('POINTZ',:SRID);
ALTER TABLE qwat_od.node ADD COLUMN update_geometry_alt1 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated
ALTER TABLE qwat_od.node ADD COLUMN update_geometry_alt2 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated

/* GEOM INDEXES */
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
	    RAISE NOTICE 'ft_node_geom';
		NEW.geometry            := ST_Force3D(NEW.geometry);
		NEW.fk_district         := qwat_od.fn_get_district(NEW.geometry);
		NEW.fk_pressurezone     := qwat_od.fn_get_pressurezone(NEW.geometry);
		NEW.fk_printmap         := qwat_od.fn_get_printmap_id(NEW.geometry);
		NEW._printmaps          := qwat_od.fn_get_printmaps(NEW.geometry);
		RAISE NOTICE 'ft_node_geom >> END';
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
/* --- ADD VERTEX TO PIPE AT NODE LOCATION ----*/
CREATE OR REPLACE FUNCTION qwat_od.ft_node_add_pipe_vertex()
  RETURNS trigger AS
$BODY$
	BEGIN
        RAISE NOTICE 'ft_node_add_pipe_vertex';
			-- add a vertex to the corresponding pipe if it intersects
			-- when the node is close enough to the pipe (< 1 micrometer) the node is considered to intersect the pipe
			-- it allows to deal with intersections that cannot be represented by floating point numbers
			UPDATE qwat_od.pipe SET geometry = ST_Snap(geometry, NEW.geometry, 1e-6) WHERE ST_Distance(geometry, NEW.geometry) < 1e-6;
        RAISE NOTICE 'ft_node_add_pipe_vertex >> END';
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER tr_node_add_pipe_vertex_insert
  AFTER INSERT
  ON qwat_od.node
  FOR EACH ROW
  EXECUTE PROCEDURE qwat_od.ft_node_add_pipe_vertex();
COMMENT ON TRIGGER tr_node_add_pipe_vertex_insert ON qwat_od.node IS 'Trigger: updates auto fields after insert.';

CREATE TRIGGER tr_node_add_pipe_vertex_update
  AFTER UPDATE OF geometry
  ON qwat_od.node
  FOR EACH ROW
  WHEN (ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
  EXECUTE PROCEDURE qwat_od.ft_node_add_pipe_vertex();
COMMENT ON TRIGGER tr_node_add_pipe_vertex_update ON qwat_od.node IS 'Trigger: updates auto fields after geom update.';




/* --------------------------------------------*/
/* -------- MOVED NODE TRIGGER ----------------*/
CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_node_moved() RETURNS TRIGGER AS
	$BODY$
	DECLARE
		node_ids integer[];
	BEGIN
	    RAISE NOTICE 'ft_pipe_node_moved';
		UPDATE qwat_od.pipe SET	fk_node_a = qwat_od.fn_node_create(ST_StartPoint(geometry)) WHERE fk_node_a = OLD.id;
		UPDATE qwat_od.pipe SET	fk_node_b = qwat_od.fn_node_create(ST_EndPoint(  geometry)) WHERE fk_node_b = OLD.id;
		RAISE NOTICE 'ft_pipe_node_moved >> END';
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



/* --------------------------------------------*/
/* -------- ALTERNATIVE GEOM TRIGGER ----------*/
CREATE TRIGGER tr_node_altgeom_insert
	BEFORE INSERT ON qwat_od.node
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_main();
COMMENT ON TRIGGER tr_node_altgeom_insert ON qwat_od.node IS 'Trigger: handle alternative geometries on insert';

CREATE TRIGGER tr_node_altgeom_update
	BEFORE UPDATE OF geometry ON qwat_od.node
	FOR EACH ROW
	WHEN  ( ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_main();
COMMENT ON TRIGGER tr_node_altgeom_update ON qwat_od.node IS 'Trigger: handle alternative geometries on update';

CREATE TRIGGER tr_node_altgeom_alt
	BEFORE UPDATE OF geometry_alt1, geometry_alt2 ON qwat_od.node
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_aux();
COMMENT ON TRIGGER tr_node_altgeom_alt ON qwat_od.node IS 'Trigger: when updating, check if alternative geometries are different to fill the boolean fields.';


