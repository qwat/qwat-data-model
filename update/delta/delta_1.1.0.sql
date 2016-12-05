ALTER TABLE qwat_od.valve ADD COLUMN fk_district integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_district FOREIGN KEY (fk_district) REFERENCES qwat_od.district(id) MATCH FULL;
CREATE INDEX fki_valve_fk_district ON qwat_od.valve(fk_district);

ALTER TABLE qwat_od.valve ADD COLUMN fk_pressurezone         integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_pressurezone  FOREIGN KEY (fk_pressurezone)  REFERENCES qwat_od.pressurezone(id)  MATCH FULL;
CREATE INDEX fki_valve_fk_pressurezone  ON qwat_od.valve(fk_pressurezone);

ALTER TABLE qwat_od.valve ADD COLUMN fk_distributor           integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_distributor    FOREIGN KEY (fk_distributor)    REFERENCES qwat_od.distributor(id)        MATCH FULL;
CREATE INDEX fki_valve_fk_distributor   ON qwat_od.valve(fk_distributor);

ALTER TABLE qwat_od.valve ADD COLUMN fk_precision            integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_precision      FOREIGN KEY (fk_precision)      REFERENCES qwat_vl.precision(id)          MATCH FULL;
CREATE INDEX fki_valve_fk_precision     ON qwat_od.valve(fk_precision);

ALTER TABLE qwat_od.valve ADD COLUMN fk_precisionalti        integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_precisionalti    FOREIGN KEY (fk_precisionalti)    REFERENCES qwat_vl.precisionalti(id)    MATCH FULL;
CREATE INDEX fki_valve_fk_precisionalti    ON qwat_od.valve(fk_precisionalti);

ALTER TABLE qwat_od.valve ADD COLUMN fk_status               integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_status         FOREIGN KEY (fk_status)         REFERENCES qwat_vl.status(id)             MATCH FULL;
CREATE INDEX fki_valve_fk_status        ON qwat_od.valve(fk_status);

ALTER TABLE qwat_od.valve ADD COLUMN fk_object_reference     integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL;
CREATE INDEX fki_valve_fk_object_reference ON qwat_od.valve(fk_object_reference);

ALTER TABLE qwat_od.valve ADD COLUMN fk_folder               integer;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_folder           FOREIGN KEY (fk_folder)           REFERENCES qwat_od.folder(id)           MATCH FULL;
CREATE INDEX fki_valve_fk_folder           ON qwat_od.valve(fk_folder);

ALTER TABLE qwat_od.valve ADD COLUMN year          smallint CHECK (year     IS NULL OR year     > 1800 AND year     < 2100);
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

ALTER TABLE qwat_od.valve ADD COLUMN geometry geometry('POINTZ',21781);
ALTER TABLE qwat_od.valve ADD COLUMN geometry_alt1 geometry('POINTZ',21781);
ALTER TABLE qwat_od.valve ADD COLUMN geometry_alt2 geometry('POINTZ',21781);
ALTER TABLE qwat_od.valve ADD COLUMN update_geometry_alt1 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated
ALTER TABLE qwat_od.valve ADD COLUMN update_geometry_alt2 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated



CREATE INDEX valve_geoidx ON qwat_od.valve USING GIST ( geometry );
CREATE INDEX valve_geoidx_alt1 ON qwat_od.valve USING GIST ( geometry_alt1 );
CREATE INDEX valve_geoidx_alt2 ON qwat_od.valve USING GIST ( geometry_alt2 );

-- ALTER TABLE qwat_od.valve ALTER COLUMN id serial;
-- integer NOT NULL REFERENCES qwat_od.network_element(id) PRIMARY KEY;
CREATE SEQUENCE qwat_od.valve_id_seq START 1;
-- SELECT setval('qwat_od.valve_id_seq', (select COALESCE(max(id), '0')+1 from qwat_od.valve));
DO $$ BEGIN PERFORM setval('qwat_od.valve_id_seq', (select COALESCE(max(id), '0')+1 from qwat_od.valve)); END $$;
ALTER TABLE qwat_od.valve ALTER COLUMN id SET default nextval('qwat_od.valve_id_seq');


DO $$ BEGIN PERFORM qwat_sys.fn_enable_schemaview('valve'); END $$;
DO $$ BEGIN PERFORM qwat_sys.fn_label_create_fields('valve'); END $$;

-- We need to tranfert all the column data from node to valve
UPDATE qwat_od.valve SET fk_district          = (SELECT fk_district          FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_pressurezone      = (SELECT fk_pressurezone      FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_distributor       = (SELECT fk_distributor       FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_precision         = (SELECT fk_precision         FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_status            = (SELECT fk_status            FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_object_reference  = (SELECT fk_object_reference  FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_folder            = (SELECT fk_folder            FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_precisionalti     = (SELECT fk_precisionalti     FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET geometry             = (SELECT geometry             FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET geometry_alt1        = (SELECT geometry_alt1        FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET geometry_alt2        = (SELECT geometry_alt2        FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET update_geometry_alt1 = (SELECT update_geometry_alt1 FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET update_geometry_alt2 = (SELECT update_geometry_alt2 FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET year                 = (SELECT year                 FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET altitude             = (SELECT altitude             FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET orientation          = (SELECT orientation          FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_locationtype      = (SELECT fk_locationtype      FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET identification       = (SELECT identification       FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET remark               = (SELECT remark               FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET year_end             = (SELECT year_end             FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_printmap          = (SELECT fk_printmap          FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET _geometry_alt1_used  = (SELECT _geometry_alt1_used  FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET _geometry_alt2_used  = (SELECT _geometry_alt2_used  FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET _pipe_node_type      = (SELECT _pipe_node_type      FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET _pipe_orientation    = (SELECT _pipe_orientation    FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET _pipe_schema_visible = (SELECT _pipe_schema_visible FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET _printmaps           = (SELECT _printmaps           FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET schema_force_visible = (SELECT schema_force_visible FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET label_1_visible      = (SELECT label_1_visible      FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET label_1_x            = (SELECT label_1_x            FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET label_1_y            = (SELECT label_1_y            FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET label_1_rotation     = (SELECT label_1_rotation     FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET label_1_text         = (SELECT label_1_text         FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET label_2_visible      = (SELECT label_2_visible      FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET label_2_x            = (SELECT label_2_x            FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET label_2_y            = (SELECT label_2_y            FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET label_2_rotation     = (SELECT label_2_rotation     FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET label_2_text         = (SELECT label_2_text         FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);


ALTER TABLE qwat_od.valve ALTER COLUMN fk_distributor SET NOT NULL;
ALTER TABLE qwat_od.valve ALTER COLUMN fk_precision SET NOT NULL;
ALTER TABLE qwat_od.valve ALTER COLUMN fk_status SET NOT NULL;
ALTER TABLE qwat_od.valve ALTER COLUMN geometry SET NOT NULL;

ALTER TABLE qwat_od.valve DROP CONSTRAINT valve_id_fkey;

/* --------------------------------------------*/
/* -------- ALTERNATIVE GEOM TRIGGER ----------*/
CREATE TRIGGER tr_valve_altgeom_insert
	BEFORE INSERT ON qwat_od.valve
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_main();
COMMENT ON TRIGGER tr_valve_altgeom_insert ON qwat_od.valve IS 'Trigger: handle alternative geometries on insert';

CREATE TRIGGER tr_valve_altgeom_update
	BEFORE UPDATE OF geometry ON qwat_od.valve
	FOR EACH ROW
	WHEN  ( ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_main();
COMMENT ON TRIGGER tr_valve_altgeom_update ON qwat_od.valve IS 'Trigger: handle alternative geometries on update';

CREATE TRIGGER tr_valve_altgeom_alt
	BEFORE UPDATE OF geometry_alt1, geometry_alt2 ON qwat_od.valve
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_aux();
COMMENT ON TRIGGER tr_valve_altgeom_alt ON qwat_od.valve IS 'Trigger: when updating, check if alternative geometries are different to fill the boolean fields.';



CREATE OR REPLACE FUNCTION qwat_od.fn_node_create( _point geometry, deactivate_node_add_pipe_vertex boolean = FALSE ) RETURNS integer AS
$BODY$
    DECLARE
        _node_id integer;
    BEGIN
        SELECT id FROM qwat_od.node WHERE ST_Equals(ST_Force2d(_point), ST_Force2d(node.geometry)) IS TRUE LIMIT 1 INTO _node_id;
        IF _node_id IS NULL THEN

            INSERT INTO qwat_od.node (geometry) VALUES (ST_Force3D(_point)) RETURNING id INTO _node_id;

            IF _node_id IS NULL THEN
                RAISE EXCEPTION 'Node is null although it should have been created';
            END IF;
        END IF;
        RETURN _node_id;
    END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_node_create(geometry, boolean) IS 'Returns the node for a given geometry (point). If node does not exist, create it.';


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


/* REASSIGN THE PIPE OF A VALVE WHEN THE PIPE MOVES OR IS DELETED, AND RECALCULATE VALVE ORIENTATION */
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_pipe_update() RETURNS TRIGGER AS
$BODY$
    DECLARE
        r record;
    BEGIN
        UPDATE qwat_od.valve SET fk_pipe = qwat_od.fn_pipe_get_id(geometry) WHERE fk_pipe = OLD.id OR ST_Distance(geometry, OLD.geometry) < 1e-4;

        -- Il faudrait un trigger sur un changement de géom sur les conduites qui appellent valve_set_orientation pour toutes les vannes avec fk_pipe = id.
        FOR r IN SELECT id FROM qwat_od.valve WHERE fk_pipe = OLD.id
        LOOP
            PERFORM qwat_od.fn_valve_set_orientation(r.id);
        END LOOP;

        RETURN NULL;
    END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_pipe_update() IS 'Trigger: when moving or deleting a pipe, reassign the pipe to all valves connected to the old pipe and recalculate valve orientation. Do an AFTER trigger since it will update valve after updating the node.';
/* WHEN THE PIPE MOVES */
DROP TRIGGER tr_valve_pipe_update ON qwat_od.pipe;
CREATE TRIGGER tr_valve_pipe_update
    -- this will be fired for every node, although not every node is valve
    AFTER UPDATE OF geometry ON qwat_od.pipe
    FOR EACH ROW
    WHEN ( ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
    EXECUTE PROCEDURE qwat_od.ft_valve_pipe_update();
COMMENT ON TRIGGER tr_valve_pipe_update ON qwat_od.pipe IS 'Trigger: when moving a pipe, reassign the pipe to all valves connected to the old pipe and recalculate valve orientation. Do an AFTER trigger since it will update valve after updating the node.';
/* WHEN THE PIPE IS DELETED */
DROP TRIGGER tr_valve_pipe_delete ON qwat_od.pipe;
CREATE TRIGGER tr_valve_pipe_delete
    -- this will be fired for every node, although not every node is valve
    AFTER DELETE ON qwat_od.pipe
    FOR EACH ROW
    EXECUTE PROCEDURE qwat_od.ft_valve_pipe_update();
COMMENT ON TRIGGER tr_valve_pipe_delete ON qwat_od.pipe IS 'Trigger: when deleting a pipe, reassign the pipe to all valves connected to the old pipe and recalculate valve orientation. Do an AFTER trigger since it will update valve after updating the node.';


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


DROP TRIGGER tr_node_add_pipe_vertex_insert ON qwat_od.node;
DROP TRIGGER tr_node_add_pipe_vertex_update ON qwat_od.node;
DROP FUNCTION qwat_od.ft_node_add_pipe_vertex();

DROP TRIGGER valve_node_set_type ON qwat_od.valve;
DROP FUNCTION qwat_od.ft_valve_node_set_type();

-- We need to manually remove those 3 triggers functions, as they cannot be removed automatically by the rewrite views process
DROP VIEW qwat_od.vw_search_view;
DROP VIEW qwat_od.vw_export_valve;
DROp VIEW qwat_od.vw_valve_lines;
DROP VIEW qwat_od.vw_element_valve;
DROP FUNCTION qwat_od.ft_element_valve_delete();
DROP FUNCTION qwat_od.ft_element_valve_insert();
DROP FUNCTION qwat_od.ft_element_valve_update();


UPDATE qwat_sys.versions SET version = '1.1.0';
