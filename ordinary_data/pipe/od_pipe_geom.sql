/* --------------------------- */
/* -------- COLUMNS ---------- */
ALTER TABLE qwat_od.pipe ADD COLUMN fk_node_a       integer    not null;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_node_b       integer    not null;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_district     integer   ;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_pressurezone integer   ;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_printmap     integer[] ;
ALTER TABLE qwat_od.pipe ADD COLUMN _length2d       decimal(8,2) ;
ALTER TABLE qwat_od.pipe ADD COLUMN _length3d       decimal(8,2) ;
ALTER TABLE qwat_od.pipe ADD COLUMN _diff_elevation decimal(8,2) ;
ALTER TABLE qwat_od.pipe ADD COLUMN _district       varchar(255)  ;
ALTER TABLE qwat_od.pipe ADD COLUMN _pressurezone   varchar(100)  ;
ALTER TABLE qwat_od.pipe ADD COLUMN _printmaps      varchar(100)  ;
ALTER TABLE qwat_od.pipe ADD COLUMN _geometry_alt1_used boolean;
ALTER TABLE qwat_od.pipe ADD COLUMN _geometry_alt2_used boolean;


/* ---------------------------- */
/* -------- ADD GEOM ---------- */
ALTER TABLE qwat_od.pipe ADD COLUMN geometry      geometry('LINESTRING',:SRID);
ALTER TABLE qwat_od.pipe ADD COLUMN geometry_alt1 geometry('LINESTRING',:SRID);
ALTER TABLE qwat_od.pipe ADD COLUMN geometry_alt2 geometry('LINESTRING',:SRID);

CREATE INDEX pipe_geoidx      ON qwat_od.pipe USING GIST ( geometry );
CREATE INDEX pipe_geoidx_alt1 ON qwat_od.pipe USING GIST ( geometry_alt1 );
CREATE INDEX pipe_geoidx_alt2 ON qwat_od.pipe USING GIST ( geometry_alt2 );


/* ------------------------------- */
/* -------- CONSTRAINTS ---------- */
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_node_a       FOREIGN KEY (fk_node_a)       REFERENCES qwat_od.node(id)         MATCH FULL;
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_node_b       FOREIGN KEY (fk_node_b)       REFERENCES qwat_od.node(id)         MATCH FULL;
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_district     FOREIGN KEY (fk_district)     REFERENCES qwat_od.district(id)     MATCH FULL;
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_pressurezone FOREIGN KEY (fk_pressurezone) REFERENCES qwat_od.pressurezone(id) MATCH FULL;
CREATE INDEX fki_pipe_fk_node_a       ON qwat_od.pipe(fk_node_a);
CREATE INDEX fki_pipe_fk_node_b       ON qwat_od.pipe(fk_node_b);
CREATE INDEX fki_pipe_fk_district     ON qwat_od.pipe(fk_district);
CREATE INDEX fki_pipe_fk_pressurezone ON qwat_od.pipe(fk_pressurezone);


/* ------------------------------------*/
/* -------- GEOMETRY TRIGGER ----------*/
CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_geom() RETURNS TRIGGER AS
	$BODY$
	BEGIN
		NEW.fk_node_a                := qwat_od.fn_get_node(ST_StartPoint(NEW.geometry),true);
		NEW.fk_node_b                := qwat_od.fn_get_node(ST_EndPoint(  NEW.geometry),true);
		NEW.fk_district              := qwat_od.fn_get_district_id(NEW.geometry)                ;
		NEW.fk_pressurezone          := qwat_od.fn_get_pressurezone_id(NEW.geometry)            ;
		NEW.fk_printmap              := qwat_od.fn_get_printmap_id(NEW.geometry)                ;
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
	LANGUAGE plpgsql;

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
			node_ids := ARRAY[NEW.fk_node_a, NEW.fk_node_b];
		ELSE
			node_ids := ARRAY[OLD.fk_node_a, OLD.fk_node_b];
		END IF;
		IF TG_OP = 'UPDATE' THEN
			IF NEW.fk_node_a <> OLD.fk_node_a THEN
				node_ids := array_append(node_ids, OLD.fk_node_a);
			END IF;
			IF NEW.fk_node_b <> OLD.fk_node_b THEN
				node_ids := array_append(node_ids, OLD.fk_node_b);
			END IF;
		END IF;
		PERFORM qwat_od.fn_node_set_type( node_ids );
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE plpgsql;

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
		NEW._geometry_alt1_used := NEW.geometry_alt1 IS NOT NULL AND ST_AsBinary(NEW.geometry_alt1) <> ST_AsBinary(NEW.geometry);
		NEW._geometry_alt2_used := NEW.geometry_alt2 IS NOT NULL AND ST_AsBinary(NEW.geometry_alt2) <> ST_AsBinary(NEW.geometry);
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE plpgsql;

CREATE TRIGGER tr_pipe_alternative_geom
	BEFORE UPDATE OF geometry_alt1, geometry_alt2 ON qwat_od.pipe
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_pipe_alternative_geom();
COMMENT ON TRIGGER tr_pipe_alternative_geom ON qwat_od.pipe IS 'Trigger: when updating, check if alternative geometries are different to fill the boolean fields.';
