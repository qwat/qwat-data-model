/* --------------------------- */
/* -------- COLUMNS ---------- */
ALTER TABLE qwat_od.pipe ADD COLUMN fk_node_a       integer    not null;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_node_b       integer    not null;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_district     integer;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_pressurezone integer;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_printmap     integer[];
ALTER TABLE qwat_od.pipe ADD COLUMN _length2d       decimal(8,2);
ALTER TABLE qwat_od.pipe ADD COLUMN _length3d       decimal(8,2);
ALTER TABLE qwat_od.pipe ADD COLUMN _diff_elevation decimal(8,2);
ALTER TABLE qwat_od.pipe ADD COLUMN _printmaps      varchar(100);
ALTER TABLE qwat_od.pipe ADD COLUMN _geometry_alt1_used boolean;
ALTER TABLE qwat_od.pipe ADD COLUMN _geometry_alt2_used boolean;
ALTER TABLE qwat_od.pipe ADD COLUMN update_geometry_alt1 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated
ALTER TABLE qwat_od.pipe ADD COLUMN update_geometry_alt2 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated


/* ---------------------------- */
/* -------- ADD GEOM ---------- */
ALTER TABLE qwat_od.pipe ADD COLUMN geometry      geometry('LINESTRINGZ',:SRID) NOT NULL;
ALTER TABLE qwat_od.pipe ADD COLUMN geometry_alt1 geometry('LINESTRINGZ',:SRID);
ALTER TABLE qwat_od.pipe ADD COLUMN geometry_alt2 geometry('LINESTRINGZ',:SRID);

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
		IF TG_OP = 'INSERT' OR ST_Equals(ST_StartPoint(NEW.geometry), ST_StartPoint(OLD.geometry)) IS FALSE THEN
			NEW.fk_node_a       := qwat_od.fn_node_create(ST_StartPoint(NEW.geometry), /* deactivate_node_add_pipe_vertex */ true, status => new.fk_status, distributors => array[new.fk_distributor]);
            perform qwat_od.fn_node_set_status(new.fk_node_a, new.fk_status);
           	perform qwat_od.fn_node_set_distributors(new.fk_node_a);
		END IF;
		IF TG_OP = 'INSERT' OR ST_Equals(ST_EndPoint(NEW.geometry), ST_EndPoint(OLD.geometry)) IS FALSE THEN
			NEW.fk_node_b       := qwat_od.fn_node_create(ST_EndPoint(NEW.geometry), /* deactivate_node_add_pipe_vertex */ true, status => new.fk_status, distributors => array[new.fk_distributor]);
            perform qwat_od.fn_node_set_status(new.fk_node_b, new.fk_status);
           	perform qwat_od.fn_node_set_distributors(new.fk_node_b);		
		END IF;
		NEW.fk_district         := qwat_od.fn_get_district(NEW.geometry);
		NEW.fk_pressurezone     := qwat_od.fn_get_pressurezone(NEW.geometry);
		NEW.fk_printmap         := qwat_od.fn_get_printmap_id(NEW.geometry);
		NEW._printmaps          := qwat_od.fn_get_printmaps(NEW.geometry);
		NEW._length2d           := ST_Length(NEW.geometry);
		NEW._length3d           := ST_3DLength(NEW.geometry);
		NEW._diff_elevation     := @(ST_Z(ST_StartPoint(NEW.geometry))-ST_Z(ST_EndPoint(NEW.geometry)));
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
	WHEN  ( ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
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
			-- delete or update (OLD exists)
			node_ids := ARRAY[OLD.fk_node_a, OLD.fk_node_b];
		END IF;
		IF TG_OP = 'UPDATE' THEN
			IF NEW.fk_node_a <> OLD.fk_node_a THEN
				node_ids := array_append(node_ids, NEW.fk_node_a);
			END IF;
			IF NEW.fk_node_b <> OLD.fk_node_b THEN
				node_ids := array_append(node_ids, NEW.fk_node_b);
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

CREATE TRIGGER tr_pipe_altgeom_insert
	BEFORE INSERT ON qwat_od.pipe
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_main();
COMMENT ON TRIGGER tr_pipe_altgeom_insert ON qwat_od.pipe IS 'Trigger: handle alternative geometries on insert';

CREATE TRIGGER tr_pipe_altgeom_update
	BEFORE UPDATE OF geometry ON qwat_od.pipe
	FOR EACH ROW
	WHEN  ( ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_main();
COMMENT ON TRIGGER tr_pipe_altgeom_update ON qwat_od.pipe IS 'Trigger: handle alternative geometries on update';

CREATE TRIGGER tr_pipe_altgeom_alt
	BEFORE UPDATE OF geometry_alt1, geometry_alt2 ON qwat_od.pipe
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_aux();
COMMENT ON TRIGGER tr_pipe_altgeom_alt ON qwat_od.pipe IS 'Trigger: when updating, check if alternative geometries are different to fill the boolean fields.';

/* --------------------------------------------*/
/* -------- NODE STATUS TRIGGER ----------*/
CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_node_status()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
	DECLARE
		node_ids integer[];
	BEGIN
		IF TG_OP = 'INSERT' THEN
			node_ids := ARRAY[NEW.fk_node_a, NEW.fk_node_b];
		ELSE
			-- delete or update (OLD exists)
			node_ids := ARRAY[OLD.fk_node_a, OLD.fk_node_b];
		END IF;
		IF TG_OP = 'UPDATE' THEN
			IF NEW.fk_node_a <> OLD.fk_node_a THEN
				node_ids := array_append(node_ids, NEW.fk_node_a);
			END IF;
			IF NEW.fk_node_b <> OLD.fk_node_b THEN
				node_ids := array_append(node_ids, NEW.fk_node_b);
			END IF;
		END IF;
		PERFORM qwat_od.fn_node_set_status( node_ids );
		RETURN NEW;
	END;
	$function$
;

CREATE TRIGGER tr_pipe_node_status_insert
    AFTER INSERT
    ON qwat_od.pipe
    FOR EACH ROW
    EXECUTE FUNCTION qwat_od.ft_pipe_node_status();
COMMENT ON TRIGGER tr_pipe_node_status_insert ON qwat_od.pipe IS 'Trigger: after insert of a pipe, set the status of nodes.';

CREATE TRIGGER tr_pipe_node_status_update
    AFTER update of fk_status
    ON qwat_od.pipe
    FOR EACH ROW
    EXECUTE FUNCTION qwat_od.ft_pipe_node_status();
COMMENT ON TRIGGER tr_pipe_node_status_update ON qwat_od.pipe IS 'Trigger: after updating status of a pipe, set the status of nodes.';

/* --------------------------------------------*/
/* -------- NODE DISTRIBUTOR TRIGGER ----------*/
CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_node_distributor()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
	DECLARE
		node_ids integer[];
	BEGIN
		IF TG_OP = 'INSERT' THEN
			node_ids := ARRAY[NEW.fk_node_a, NEW.fk_node_b];
		ELSE
			-- delete or update (OLD exists)
			node_ids := ARRAY[OLD.fk_node_a, OLD.fk_node_b];
		END IF;
		IF TG_OP = 'UPDATE' THEN
			IF NEW.fk_node_a <> OLD.fk_node_a THEN
				node_ids := array_append(node_ids, NEW.fk_node_a);
			END IF;
			IF NEW.fk_node_b <> OLD.fk_node_b THEN
				node_ids := array_append(node_ids, NEW.fk_node_b);
			END IF;
		END IF;
		PERFORM qwat_od.fn_node_set_distributors( node_ids );
		RETURN NEW;
	END;
	$function$
;

CREATE TRIGGER tr_pipe_node_distributor_insert
    AFTER INSERT
    ON qwat_od.pipe
    FOR EACH ROW
    EXECUTE FUNCTION qwat_od.ft_pipe_node_distributor();
COMMENT ON TRIGGER tr_pipe_node_distributor_insert ON qwat_od.pipe IS 'Trigger: after insert of a pipe, set distributor(s) of nodes.';

CREATE TRIGGER tr_pipe_node_distributor_update
    AFTER update of fk_distributor
    ON qwat_od.pipe
    FOR EACH ROW
    EXECUTE FUNCTION qwat_od.ft_pipe_node_distributor();
COMMENT ON TRIGGER tr_pipe_node_distributor_update ON qwat_od.pipe IS 'Trigger: after updating distributor of a pipe, set distributor(s) of nodes.';
