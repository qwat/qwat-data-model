ALTER TABLE qwat_od.valve ADD COLUMN fk_district integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_district FOREIGN KEY (fk_district) REFERENCES qwat_od.district(id) MATCH FULL;
CREATE INDEX fki_valve_fk_district ON qwat_od.valve(fk_district);

ALTER TABLE qwat_od.valve ADD COLUMN fk_pressurezone         integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_pressurezone  FOREIGN KEY (fk_pressurezone)  REFERENCES qwat_od.pressurezone(id)  MATCH FULL;
CREATE INDEX fki_valve_fk_pressurezone  ON qwat_od.valve(fk_pressurezone);

ALTER TABLE qwat_od.valve ADD COLUMN fk_distributor           integer not null;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_distributor    FOREIGN KEY (fk_distributor)    REFERENCES qwat_od.distributor(id)        MATCH FULL;
CREATE INDEX fki_valve_fk_distributor   ON qwat_od.valve(fk_distributor);

ALTER TABLE qwat_od.valve ADD COLUMN fk_precision            integer not null;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_precision      FOREIGN KEY (fk_precision)      REFERENCES qwat_vl.precision(id)          MATCH FULL;
CREATE INDEX fki_valve_fk_precision     ON qwat_od.valve(fk_precision);

ALTER TABLE qwat_od.valve ADD COLUMN fk_status               integer not null;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_status         FOREIGN KEY (fk_status)         REFERENCES qwat_vl.status(id)             MATCH FULL;
CREATE INDEX fki_valve_fk_status        ON qwat_od.valve(fk_status);

ALTER TABLE qwat_od.valve ADD COLUMN fk_object_reference     integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL;
CREATE INDEX fki_valve_fk_object_reference ON qwat_od.valve(fk_object_reference);

ALTER TABLE qwat_od.valve ADD COLUMN fk_folder               integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_folder           FOREIGN KEY (fk_folder)           REFERENCES qwat_od.folder(id)           MATCH FULL;
CREATE INDEX fki_valve_fk_folder           ON qwat_od.valve(fk_folder);

ALTER TABLE qwat_od.valve ADD COLUMN fk_precisionalti        integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_precisionalti    FOREIGN KEY (fk_precisionalti)    REFERENCES qwat_vl.precisionalti(id)    MATCH FULL;
CREATE INDEX fki_valve_fk_precisionalti    ON qwat_od.valve(fk_precisionalti);

ALTER TABLE qwat_od.valve ADD COLUMN geometry geometry('POINTZ',21781) NOT NULL;
ALTER TABLE qwat_od.valve ADD COLUMN geometry_alt1 geometry('POINTZ',21781);
ALTER TABLE qwat_od.valve ADD COLUMN geometry_alt2 geometry('POINTZ',21781);
ALTER TABLE qwat_od.valve ADD COLUMN update_geometry_alt1 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated
ALTER TABLE qwat_od.valve ADD COLUMN update_geometry_alt2 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated

CREATE INDEX valve_geoidx ON qwat_od.valve USING GIST ( geometry );
CREATE INDEX valve_geoidx_alt1 ON qwat_od.valve USING GIST ( geometry_alt1 );
CREATE INDEX valve_geoidx_alt2 ON qwat_od.valve USING GIST ( geometry_alt2 );

-- ALTER TABLE qwat_od.valve ALTER COLUMN id serial;
-- integer NOT NULL REFERENCES qwat_od.network_element(id) PRIMARY KEY;

ALTER TABLE qwat_od.valve ADD COLUMN year          smallint CHECK (year     IS NULL OR year     > 1800 AND year     < 2100);
ALTER TABLE qwat_od.valve ADD COLUMN altitude                decimal(10,3) default null;
ALTER TABLE qwat_od.valve ADD COLUMN orientation             float default null;

SELECT qwat_sys.fn_enable_schemaview( 'valve' );

-- Valve orientation
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_set_orientation() RETURNS TRIGGER AS
$BODY$
    BEGIN
        PERFORM qwat_od.fn_valve_set_orientation(NEW.id);
    RETURN NEW;
    END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_set_orientation() IS 'Trigger: set orientation after inserting a valve.';

CREATE TRIGGER valve_set_orientation
    AFTER INSERT ON qwat_od.valve
    FOR EACH ROW
    EXECUTE PROCEDURE qwat_od.ft_valve_set_orientation();
COMMENT ON TRIGGER valve_set_orientation ON qwat_od.valve IS 'Trigger: set orientation after inserting a valve.';


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


CREATE OR REPLACE FUNCTION qwat_od.ft_valve_geom() RETURNS TRIGGER AS
$BODY$
    BEGIN
        NEW.fk_pipe             := qwat_od.fn_pipe_get_id(NEW.geometry);
        NEW.fk_district         := qwat_od.fn_get_district(NEW.geometry);
        NEW.fk_pressurezone     := qwat_od.fn_get_pressurezone(NEW.geometry);
        RETURN NEW;
    END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_geom() IS 'Trigger: when inserting or updating a valve, assign pipe and geom infos.';

CREATE TRIGGER tr_valve_infos_insert_trigger
    BEFORE INSERT ON qwat_od.valve
    FOR EACH ROW
    EXECUTE PROCEDURE qwat_od.ft_valve_geom();
COMMENT ON TRIGGER tr_valve_infos_insert_trigger ON qwat_od.valve IS 'Trigger: when inserting a valve, assign pipe.';


CREATE TRIGGER tr_valve_infos_update_trigger
    BEFORE UPDATE ON qwat_od.valve
    FOR EACH ROW
     WHEN (NOT ST_Equals(OLD.geometry, NEW.geometry))
    EXECUTE PROCEDURE qwat_od.ft_valve_geom();
COMMENT ON TRIGGER tr_valve_infos_update_trigger ON qwat_od.valve IS 'Trigger: when updating a valve, assign pipe.';


-- ===================================================
CREATE OR REPLACE VIEW qwat_od.vw_search_view AS
    /* ouvrages */SELECT
        'Ouvrages' as layer_name,
        CASE 
            WHEN installation_type = 'source'::qwat_od.installation_type THEN   'Source ' || identification || ' ' || name
            WHEN installation_type = 'treatment'::qwat_od.installation_type THEN    'Traitement ' || identification || ' ' || name
            WHEN installation_type = 'tank'::qwat_od.installation_type THEN 'Réservoir ' || identification || ' ' || name
            WHEN installation_type = 'pressurecontrol'::qwat_od.installation_type THEN  'Régulation de pression ' || identification || ' ' || name
            WHEN installation_type = 'pump'::qwat_od.installation_type THEN 'Pompage ' || identification || ' ' || name
            WHEN installation_type = 'chamber'::qwat_od.installation_type THEN  'Chambre ' || identification || ' ' || name
        END AS search_text,
        ST_Force2d(geometry) AS geometry
        FROM qwat_od.vw_export_installation
        WHERE status_active IS TRUE
    UNION SELECT
        'Hydrantes' as layer_name,
        district_name || ' '|| identification as search_text,
        ST_Force2d(geometry) AS geometry
        FROM qwat_od.vw_export_hydrant WHERE status_active IS TRUE

    UNION SELECT
        'Abonnés' as layer_name,
        subscriber_type_value_fr || ' ' || coalesce(district_prefix||'_','') || identification || ' ' || district_name as search_text,
        ST_Force2d(geometry) AS geometry
        FROM qwat_od.vw_export_subscriber

    UNION SELECT
        'Compteur' as layer_name,
        COALESCE(district_prefix||'_')||meter.identification AS search_text,
        ST_Force2d(meter.geometry) AS geometry
        FROM qwat_od.vw_export_meter meter;


CREATE OR REPLACE VIEW qwat_od.vw_valve_lines AS 
 SELECT valve.id,
    ST_MakeLine(ST_Force2D(valve.handle_geometry), valve.geometry)::geometry(LineString, 21781) AS geometry
   FROM qwat_od.valve
  WHERE valve.handle_geometry IS NOT NULL AND valve.geometry IS NOT NULL;

COMMENT ON VIEW qwat_od.vw_valve_lines IS 
'Valves represented as lines. Each line is made from two points, the handle as starting point and the location on the pipe as ending point.';


DROP VIEW qwat_od.vw_export_valve;
DROP VIEW qwat_od.vw_element_valve;


