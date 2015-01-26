/* --------------------------- */
/* -------- COLUMNS ---------- */
ALTER TABLE qwat_od.pipe ADD COLUMN id_node_a       integer    not null;
ALTER TABLE qwat_od.pipe ADD COLUMN id_node_b       integer    not null;
ALTER TABLE qwat_od.pipe ADD COLUMN id_district     integer   ;
ALTER TABLE qwat_od.pipe ADD COLUMN id_pressurezone integer   ;
ALTER TABLE qwat_od.pipe ADD COLUMN id_printmap     integer[] ;
ALTER TABLE qwat_od.pipe ADD COLUMN _length2d       decimal(8,2) ;
ALTER TABLE qwat_od.pipe ADD COLUMN _length3d       decimal(8,2) ;
ALTER TABLE qwat_od.pipe ADD COLUMN _diff_elevation decimal(8,2) ;
ALTER TABLE qwat_od.pipe ADD COLUMN _district       varchar(255) default '' ;
ALTER TABLE qwat_od.pipe ADD COLUMN _pressurezone   varchar(100) default '' ;
ALTER TABLE qwat_od.pipe ADD COLUMN _printmaps      varchar(100) default '' ;
ALTER TABLE qwat_od.pipe ADD COLUMN _geometry_alt1_used boolean;
ALTER TABLE qwat_od.pipe ADD COLUMN _geometry_alt2_used boolean;


/* ---------------------------- */
/* -------- ADD GEOM ---------- */
SELECT addGeometryColumn('qwat_od', 'pipe', 'geometry', 21781, 'LINESTRING', 2);
SELECT addGeometryColumn('qwat_od', 'pipe', 'geometry_alt1', 21781, 'LINESTRING', 2);
SELECT addGeometryColumn('qwat_od', 'pipe', 'geometry_alt2', 21781, 'LINESTRING', 2);

CREATE INDEX pipe_geoidx      ON qwat_od.pipe USING GIST ( geometry );
CREATE INDEX pipe_geoidx_alt1 ON qwat_od.pipe USING GIST ( geometry_alt1 );
CREATE INDEX pipe_geoidx_alt2 ON qwat_od.pipe USING GIST ( geometry_alt2 );


/* ------------------------------- */
/* -------- CONSTRAINTS ---------- */
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_node_a       FOREIGN KEY (id_node_a)       REFERENCES qwat_od.node(id)         MATCH FULL;
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_node_b       FOREIGN KEY (id_node_b)       REFERENCES qwat_od.node(id)         MATCH FULL;
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_district     FOREIGN KEY (id_district)     REFERENCES qwat_od.district(id)     MATCH SIMPLE;
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_pressurezone FOREIGN KEY (id_pressurezone) REFERENCES qwat_od.pressurezone(id) MATCH SIMPLE;
CREATE INDEX fki_pipe_id_node_a       ON qwat_od.pipe(id_node_a);
CREATE INDEX fki_pipe_id_node_b       ON qwat_od.pipe(id_node_b);
CREATE INDEX fki_pipe_id_district     ON qwat_od.pipe(id_district);
CREATE INDEX fki_pipe_id_pressurezone ON qwat_od.pipe(id_pressurezone);


/* ------------------------------------*/
/* -------- GEOMETRY TRIGGER ----------*/
CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_geom() RETURNS TRIGGER AS
	$BODY$
	BEGIN
		NEW.id_node_a                := qwat_od.fn_node_get_id(ST_StartPoint(NEW.geometry),true);
		NEW.id_node_b                := qwat_od.fn_node_get_id(ST_EndPoint(  NEW.geometry),true);
		NEW.id_district              := qwat_od.fn_get_district_id(NEW.geometry)                ;
		NEW.id_pressurezone          := qwat_od.fn_get_pressurezone_id(NEW.geometry)            ;
		NEW.id_printmap              := qwat_od.fn_get_printmap_id(NEW.geometry)                ;
		NEW.geometry_alt1            := NEW.geometry                                         ;
		NEW.geometry_alt2            := NEW.geometry                                         ;
		NEW._geometry_alt1_used      := false                                                ;
		NEW._geometry_alt2_used      := false                                                ;
		NEW._district                := qwat_od.fn_get_districts(NEW.geometry)                  ;
		NEW._pressurezone            := qwat_od.fn_get_pressurezone(NEW.geometry)               ;
		NEW._printmaps               := qwat_od.fn_get_printmaps(NEW.geometry)                  ;
		NEW._length2d                := ST_Length(NEW.geometry)                      		 ;
		NEW._length3d                := NULL                                         		 ;
		NEW._diff_elevation          := NULL                                         		 ;
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE 'plpgsql';

/* create triggers */
CREATE TRIGGER tr_pipe_geom_insert
	BEFORE INSERT ON qwat_od.pipe
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_pipe_geom();
COMMENT ON TRIGGER tr_pipe_geom_insert ON qwat_od.pipe IS 'Trigger: updates auto fields of the pipe after insert.';

CREATE TRIGGER tr_pipe_geom_update
	BEFORE UPDATE OF geometry ON qwat_od.pipe
	FOR EACH ROW
	WHEN (ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry))
	EXECUTE PROCEDURE qwat_od.ft_pipe_geom();
COMMENT ON TRIGGER tr_pipe_geom_update ON qwat_od.pipe IS 'Trigger: updates auto fields of the pipe after geom update.';

/* --------------------------------------------*/
/* -------- NODE TYPE TRIGGER ----------*/
CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_node_type() RETURNS TRIGGER AS
	$BODY$
	DECLARE
		node_ids integer[];
	BEGIN
		IF TG_OP = 'INSERT' THEN
			node_ids := ARRAY[NEW.id_node_a, NEW.id_node_b];
		ELSE
			node_ids := ARRAY[OLD.id_node_a, OLD.id_node_b];
		END IF;
		IF TG_OP = 'UPDATE' THEN
			IF NEW.id_node_a <> OLD.id_node_a THEN
				node_ids := array_append(node_ids, OLD.id_node_a);
			END IF;
			IF NEW.id_node_b <> OLD.id_node_b THEN
				node_ids := array_append(node_ids, OLD.id_node_b);
			END IF;
		END IF;
		PERFORM qwat_od.fn_node_set_type( node_ids );
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE 'plpgsql';

CREATE TRIGGER tr_pipe_node_type_insdel
	AFTER INSERT OR DELETE ON qwat_od.pipe
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_pipe_node_type();
COMMENT ON TRIGGER tr_pipe_node_type_insdel ON qwat_od.pipe IS 'Trigger: after insert or delete of a pipe, set the type of nodes / clean the nodes.';

CREATE TRIGGER tr_pipe_node_type_update
	AFTER UPDATE OF geometry ON qwat_od.pipe
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_pipe_node_type();
COMMENT ON TRIGGER tr_pipe_node_type_update ON qwat_od.pipe IS 'Trigger: after updating of a pipe geometry, set the type of nodes / clean the nodes.';


/* --------------------------------------------*/
/* -------- ALTERNATIVE GEOM TRIGGER ----------*/
CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_alternative_geom() RETURNS TRIGGER AS
	$BODY$
	BEGIN
		NEW._geometry_alt1_used := NEW.geometry_alt1 IS NULL OR ST_AsBinary(NEW.geometry_alt1) <> ST_AsBinary(NEW.geometry);
		NEW._geometry_alt2_used := NEW.geometry_alt2 IS NULL OR ST_AsBinary(NEW.geometry_alt2) <> ST_AsBinary(NEW.geometry);
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE 'plpgsql';

CREATE TRIGGER tr_pipe_alternative_geom
	BEFORE UPDATE OF geometry_alt1, geometry_alt2 ON qwat_od.pipe
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_pipe_alternative_geom();
COMMENT ON TRIGGER tr_pipe_alternative_geom ON qwat_od.pipe IS 'Trigger: when updating, check if alternative geometries are different to fill the boolean fields.';
