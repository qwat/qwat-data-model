/*
	qWat - QGIS Water Module

	SQL file :: valve table
*/

/* create */
CREATE TABLE qwat_od.valve (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.valve IS 'Table for valve.';

/* columns */
ALTER TABLE qwat_od.valve ADD COLUMN fk_valve_type     		 integer not null;
ALTER TABLE qwat_od.valve ADD COLUMN fk_valve_function       integer not null;
ALTER TABLE qwat_od.valve ADD COLUMN fk_valve_actuation      		 integer not null;
ALTER TABLE qwat_od.valve ADD COLUMN fk_pipe                 integer ;
ALTER TABLE qwat_od.valve ADD COLUMN fk_handle_precision     integer;
ALTER TABLE qwat_od.valve ADD COLUMN fk_handle_precisionalti integer;
ALTER TABLE qwat_od.valve ADD COLUMN fk_maintenance    		 integer[]; --TODO should use n:m relations!
ALTER TABLE qwat_od.valve ADD COLUMN diameter_nominal        varchar(10);
ALTER TABLE qwat_od.valve ADD COLUMN closed                  boolean default false;
ALTER TABLE qwat_od.valve ADD COLUMN networkseparation       boolean default false;
ALTER TABLE qwat_od.valve ADD COLUMN handle_altitude         decimal(10,3);
ALTER TABLE qwat_od.valve ADD COLUMN handle_geometry         geometry(PointZ,:SRID);
ALTER TABLE qwat_od.valve ADD COLUMN fk_district             integer;
ALTER TABLE qwat_od.valve ADD COLUMN fk_pressurezone         integer;
ALTER TABLE qwat_od.valve ADD COLUMN fk_distributor          integer not null;
ALTER TABLE qwat_od.valve ADD COLUMN fk_precision            integer not null;
ALTER TABLE qwat_od.valve ADD COLUMN fk_precisionalti        integer;
ALTER TABLE qwat_od.valve ADD COLUMN fk_status               integer not null;
ALTER TABLE qwat_od.valve ADD COLUMN fk_object_reference     integer;
ALTER TABLE qwat_od.valve ADD COLUMN fk_folder               integer;
ALTER TABLE qwat_od.valve ADD COLUMN year                    smallint CHECK (year     IS NULL OR year     > 1800 AND year     < 2100);
ALTER TABLE qwat_od.valve ADD COLUMN year_end            smallint CHECK (year_end IS NULL OR year_end > 1800 AND year_end < 2100);
ALTER TABLE qwat_od.valve ADD COLUMN altitude                decimal(10,3) default null;
ALTER TABLE qwat_od.valve ADD COLUMN orientation             float default null;
ALTER TABLE qwat_od.valve ADD COLUMN fk_locationtype     integer[];
ALTER TABLE qwat_od.valve ADD COLUMN identification      varchar(50);
ALTER TABLE qwat_od.valve ADD COLUMN remark              text;
ALTER TABLE qwat_od.valve ADD COLUMN fk_printmap         integer[];
ALTER TABLE qwat_od.valve ADD COLUMN _geometry_alt1_used boolean;
ALTER TABLE qwat_od.valve ADD COLUMN _geometry_alt2_used boolean;
ALTER TABLE qwat_od.valve ADD COLUMN _pipe_node_type      qwat_od.pipe_connection default null;
ALTER TABLE qwat_od.valve ADD COLUMN _pipe_orientation    float   default 0;
ALTER TABLE qwat_od.valve ADD COLUMN _pipe_schema_visible boolean default false;
ALTER TABLE qwat_od.valve ADD COLUMN _printmaps          text; -- list of printmap where it is included


/* constraints */
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_type      FOREIGN KEY (fk_valve_type)     REFERENCES qwat_vl.valve_type(id)      MATCH FULL; CREATE INDEX fki_valve_fk_type      ON qwat_od.valve(fk_valve_type);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_function  FOREIGN KEY (fk_valve_function) REFERENCES qwat_vl.valve_function(id)  MATCH FULL; CREATE INDEX fki_valve_fk_function  ON qwat_od.valve(fk_valve_function);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_valve_actuation FOREIGN KEY (fk_valve_actuation)      REFERENCES qwat_vl.valve_actuation(id) MATCH FULL; CREATE INDEX fki_valve_fk_valve_actuation ON qwat_od.valve(fk_valve_actuation);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_pipe      FOREIGN KEY (fk_pipe)           REFERENCES qwat_od.pipe(id)            MATCH FULL; CREATE INDEX fki_valve_fk_pipe      ON qwat_od.valve(fk_pipe);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_handle_precision     FOREIGN KEY (fk_handle_precision)     REFERENCES qwat_vl.precision(id)     MATCH FULL; CREATE INDEX fki_valve_fk_handle_precision     ON qwat_od.valve(fk_handle_precision);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_handle_precisionalti FOREIGN KEY (fk_handle_precisionalti) REFERENCES qwat_vl.precisionalti(id) MATCH FULL; CREATE INDEX fki_valve_fk_handle_precisionalti ON qwat_od.valve(fk_handle_precisionalti);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_district      FOREIGN KEY (fk_district)      REFERENCES qwat_od.district(id)      MATCH FULL; CREATE INDEX fki_valve_fk_district      ON qwat_od.valve(fk_district);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_pressurezone  FOREIGN KEY (fk_pressurezone)  REFERENCES qwat_od.pressurezone(id)  MATCH FULL; CREATE INDEX fki_valve_fk_pressurezone  ON qwat_od.valve(fk_pressurezone);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_distributor    FOREIGN KEY (fk_distributor)    REFERENCES qwat_od.distributor(id)        MATCH FULL; CREATE INDEX fki_valve_fk_distributor   ON qwat_od.valve(fk_distributor);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_precision      FOREIGN KEY (fk_precision)      REFERENCES qwat_vl.precision(id)          MATCH FULL; CREATE INDEX fki_valve_fk_precision     ON qwat_od.valve(fk_precision);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_status         FOREIGN KEY (fk_status)         REFERENCES qwat_vl.status(id)             MATCH FULL; CREATE INDEX fki_valve_fk_status        ON qwat_od.valve(fk_status);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL; CREATE INDEX fki_valve_fk_object_reference ON qwat_od.valve(fk_object_reference);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_folder           FOREIGN KEY (fk_folder)           REFERENCES qwat_od.folder(id)           MATCH FULL; CREATE INDEX fki_valve_fk_folder           ON qwat_od.valve(fk_folder);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_precisionalti    FOREIGN KEY (fk_precisionalti)    REFERENCES qwat_vl.precisionalti(id)    MATCH FULL; CREATE INDEX fki_valve_fk_precisionalti    ON qwat_od.valve(fk_precisionalti);

/* cannot create constraint on arrays yet
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_maintenance FOREIGN KEY (fk_maintenance) REFERENCES qwat_vl.valve_maintenance(id) MATCH FULL; CREATE INDEX fki_valve_fk_maintenance ON qwat_od.valve(fk_maintenance);
*/

/* altitude - fk_object_reference, fk_altitude_precision constraints */
ALTER TABLE qwat_od.valve ADD CONSTRAINT chk_valve_altitude_obj_ref CHECK (fk_object_reference IS NOT NULL OR altitude IS NULL );
ALTER TABLE qwat_od.valve ADD CONSTRAINT chk_valve_altitude_precisionalti CHECK (fk_precisionalti IS NOT NULL OR altitude IS NULL );

/* GEOMETRY */
ALTER TABLE qwat_od.valve ADD COLUMN geometry geometry('POINTZ',:SRID) NOT NULL;
ALTER TABLE qwat_od.valve ADD COLUMN geometry_alt1 geometry('POINTZ',:SRID);
ALTER TABLE qwat_od.valve ADD COLUMN geometry_alt2 geometry('POINTZ',:SRID);
ALTER TABLE qwat_od.valve ADD COLUMN update_geometry_alt1 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated
ALTER TABLE qwat_od.valve ADD COLUMN update_geometry_alt2 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated


/* Schema view */
SELECT qwat_sys.fn_enable_schemaview( 'valve' );


/* GEOM INDEXES */
CREATE INDEX valve_geoidx ON qwat_od.valve USING GIST ( geometry );
CREATE INDEX valve_geoidx_alt1 ON qwat_od.valve USING GIST ( geometry_alt1 );
CREATE INDEX valve_geoidx_alt2 ON qwat_od.valve USING GIST ( geometry_alt2 );

/* NODE TRIGGER */
/*
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_node_set_type() RETURNS TRIGGER AS
$BODY$
	BEGIN
		PERFORM qwat_od.fn_node_set_type(NEW.id);
	RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_node_set_type() IS 'Trigger: set-type of node after inserting a valve (to get orientation).';

CREATE TRIGGER valve_node_set_type
	AFTER INSERT ON qwat_od.valve
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_valve_node_set_type();
COMMENT ON TRIGGER valve_node_set_type ON qwat_od.valve IS 'Trigger: set-type of node after inserting a valve (to get orientation).';
*/
/*
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_set_orientation() RETURNS TRIGGER AS
$BODY$
    BEGIN
        PERFORM qwat_od.fn_valve_set_orientation(NEW.id);
    RETURN NEW;
    END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_set_orientation() IS 'Trigger: set orientation after inserting a valve.';
*/
/*
CREATE TRIGGER valve_set_orientation
    AFTER INSERT ON qwat_od.valve
    FOR EACH ROW
    EXECUTE PROCEDURE qwat_od.ft_valve_set_orientation();
COMMENT ON TRIGGER valve_set_orientation ON qwat_od.valve IS 'Trigger: set orientation after inserting a valve.';
*/
/*
CREATE TRIGGER valve_update_orientation
    AFTER UPDATE OF geometry ON qwat_od.valve
    FOR EACH ROW
    WHEN ST_NotEquals(OLD.geometry, NEW.geometry)
    EXECUTE PROCEDURE qwat_od.ft_valve_set_orientation();
COMMENT ON TRIGGER valve_update_orientation ON qwat_od.valve IS 'Trigger: set orientation after inserting a valve.';
*/


/* HANDLE ALTITUDE TRIGGER */
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_handle_altitude() RETURNS TRIGGER AS
$BODY$
	DECLARE
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.handle_altitude IS NULL THEN
			NEW.handle_altitude := NULLIF( ST_Z(NEW.handle_geometry), 0.0); -- 0 is the NULL value
		END IF;
		IF 	NEW.handle_altitude IS NULL     AND ST_Z(NEW.handle_geometry) <> 0.0 OR
			NEW.handle_altitude IS NOT NULL AND ( ST_Z(NEW.handle_geometry) IS NULL OR ST_Z(NEW.handle_geometry) <> NEW.handle_altitude ) THEN
				NEW.handle_geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.handle_geometry), ST_Y(NEW.handle_geometry), COALESCE(NEW.handle_altitude,0) ), ST_SRID(NEW.handle_geometry) );
		END IF;
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_handle_altitude() IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';

CREATE TRIGGER valve_handle_altitude_update_trigger
	BEFORE UPDATE OF handle_altitude, handle_geometry ON qwat_od.valve
	FOR EACH ROW
	WHEN (NEW.handle_altitude <> OLD.handle_altitude OR ST_Z(NEW.handle_geometry) <> ST_Z(OLD.handle_geometry))
	EXECUTE PROCEDURE qwat_od.ft_valve_handle_altitude();
COMMENT ON TRIGGER valve_handle_altitude_update_trigger ON qwat_od.valve IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';

CREATE TRIGGER valve_handle_altitude_insert_trigger
	BEFORE INSERT ON qwat_od.valve
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_valve_handle_altitude();
COMMENT ON TRIGGER valve_handle_altitude_insert_trigger ON qwat_od.valve IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';



/* --------------------------------------------*/
/* --- ADD VERTEX TO PIPE AT VALVE LOCATION ----*/
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_add_pipe_vertex()
  RETURNS trigger AS
$BODY$
    DECLARE
        pipe_id integer;
    BEGIN
            -- add a vertex to the corresponding pipe if it intersects
            -- when the valve is close enough to the pipe (< 1 micrometer) the valve is considered to intersect the pipe
            -- it allows to deal with intersections that cannot be represented by floating point numbers
            UPDATE qwat_od.pipe SET geometry = ST_Snap(geometry, NEW.geometry, 1e-6) WHERE ST_Distance(geometry, NEW.geometry) < 1e-6;
            PERFORM qwat_od.fn_valve_set_orientation(NEW.id);
        RETURN NEW;
    END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER tr_valve_add_pipe_vertex_insert
  AFTER INSERT
  ON qwat_od.valve
  FOR EACH ROW
  EXECUTE PROCEDURE qwat_od.ft_valve_add_pipe_vertex();
COMMENT ON TRIGGER tr_valve_add_pipe_vertex_insert ON qwat_od.valve IS 'Trigger: updates auto fields after insert.';

CREATE TRIGGER tr_valve_add_pipe_vertex_update
  AFTER UPDATE OF geometry
  ON qwat_od.valve
  FOR EACH ROW
  WHEN (ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
  EXECUTE PROCEDURE qwat_od.ft_valve_add_pipe_vertex();
COMMENT ON TRIGGER tr_valve_add_pipe_vertex_update ON qwat_od.valve IS 'Trigger: updates auto fields after geom update.';

