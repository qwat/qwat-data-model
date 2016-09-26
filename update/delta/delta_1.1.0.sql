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

ALTER TABLE qwat_od.valve ADD COLUMN fk_status               integer;
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

ALTER TABLE qwat_od.valve ADD COLUMN geometry geometry('POINTZ',21781);
ALTER TABLE qwat_od.valve ADD COLUMN geometry_alt1 geometry('POINTZ',21781);
ALTER TABLE qwat_od.valve ADD COLUMN geometry_alt2 geometry('POINTZ',21781);
ALTER TABLE qwat_od.valve ADD COLUMN update_geometry_alt1 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated
ALTER TABLE qwat_od.valve ADD COLUMN update_geometry_alt2 boolean default null; -- used to determine if alternative geometries should be updated when main geometry is updated

ALTER TABLE qwat_od.valve ADD COLUMN fk_locationtype     integer[];
ALTER TABLE qwat_od.valve ADD COLUMN identification      varchar(50);
ALTER TABLE qwat_od.valve ADD COLUMN remark              text;
ALTER TABLE qwat_od.valve ADD COLUMN year_end            smallint CHECK (year_end IS NULL OR year_end > 1800 AND year_end < 2100);
ALTER TABLE qwat_od.valve ADD COLUMN fk_printmap         integer[];
ALTER TABLE qwat_od.valve ADD COLUMN _geometry_alt1_used boolean;
ALTER TABLE qwat_od.valve ADD COLUMN _geometry_alt2_used boolean;
ALTER TABLE qwat_od.valve ADD COLUMN _pipe_node_type      qwat_od.pipe_connection default null;
ALTER TABLE qwat_od.valve ADD COLUMN _pipe_orientation    float   default 0;
ALTER TABLE qwat_od.valve ADD COLUMN _pipe_schema_visible boolean default false;
ALTER TABLE qwat_od.valve ADD COLUMN _printmaps          text; -- list of printmap where it is included


CREATE INDEX valve_geoidx ON qwat_od.valve USING GIST ( geometry );
CREATE INDEX valve_geoidx_alt1 ON qwat_od.valve USING GIST ( geometry_alt1 );
CREATE INDEX valve_geoidx_alt2 ON qwat_od.valve USING GIST ( geometry_alt2 );

-- ALTER TABLE qwat_od.valve ALTER COLUMN id serial;
-- integer NOT NULL REFERENCES qwat_od.network_element(id) PRIMARY KEY;
CREATE SEQUENCE qwat_od.valve_id_seq START 1;
SELECT setval('qwat_od.valve_id_seq', (select COALESCE(max(id), '0')+1 from qwat_od.valve));
ALTER TABLE qwat_od.valve ALTER COLUMN id SET default nextval('qwat_od.valve_id_seq');

ALTER TABLE qwat_od.valve ADD COLUMN year          smallint CHECK (year     IS NULL OR year     > 1800 AND year     < 2100);
ALTER TABLE qwat_od.valve ADD COLUMN altitude                decimal(10,3) default null;
ALTER TABLE qwat_od.valve ADD COLUMN orientation             float default null;

SELECT qwat_sys.fn_enable_schemaview( 'valve' );

-- TODO We need to tranfert all the column data from node to valve
UPDATE qwat_od.valve SET fk_district = (SELECT fk_district FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_pressurezone = (SELECT fk_pressurezone FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_distributor = (SELECT fk_distributor FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_precision = (SELECT fk_precision FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_status = (SELECT fk_status FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_object_reference = (SELECT fk_object_reference FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_folder = (SELECT fk_folder FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_precisionalti = (SELECT fk_precisionalti FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET geometry = (SELECT geometry FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET geometry_alt1 = (SELECT geometry_alt1 FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET geometry_alt2 = (SELECT geometry_alt2 FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET update_geometry_alt1 = (SELECT update_geometry_alt1 FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET update_geometry_alt2 = (SELECT update_geometry_alt2 FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET year = (SELECT year FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET altitude = (SELECT altitude FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET orientation = (SELECT orientation FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_locationtype = (SELECT fk_locationtype FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET identification = (SELECT identification FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET remark = (SELECT remark FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET year_end = (SELECT year_end FROM qwat_od.network_element WHERE qwat_od.network_element.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET fk_printmap = (SELECT fk_printmap FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET _geometry_alt1_used = (SELECT _geometry_alt1_used FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET _geometry_alt2_used = (SELECT _geometry_alt2_used FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET _pipe_node_type = (SELECT _pipe_node_type FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET _pipe_orientation = (SELECT _pipe_orientation FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET _pipe_schema_visible = (SELECT _pipe_schema_visible FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);
UPDATE qwat_od.valve SET _printmaps = (SELECT _printmaps FROM qwat_od.node WHERE qwat_od.node.id = qwat_od.valve.id);


ALTER TABLE qwat_od.valve ALTER COLUMN fk_distributor SET NOT NULL;
ALTER TABLE qwat_od.valve ALTER COLUMN fk_precision SET NOT NULL;
ALTER TABLE qwat_od.valve ALTER COLUMN fk_status SET NOT NULL;
ALTER TABLE qwat_od.valve ALTER COLUMN geometry SET NOT NULL;


-- Valve orientation
CREATE OR REPLACE FUNCTION qwat_od.fn_valve_set_orientation(_valve_id integer) RETURNS void AS
$BODY$
    DECLARE
        _pipeitem     record;
        _pipe_id      integer;
        _grouped      record;
        _diameter     smallint;
        _looppos      integer          := 0;
        _orientation  double precision := 0;
        _orientation2 double precision := 0;
        _node_geom    geometry;
        _pipe_geom    geometry;
        _sub_geom     geometry;
        _lin_ref      float;
    BEGIN

        -- get the geometry
        _node_geom := geometry FROM qwat_od.valve WHERE id = _valve_id;

        -- count the active pipes associated to this valve
        SELECT
                COUNT(*) AS count,
                bool_or(coalesce(schema_force_visible,pipe_function.schema_visible)) AS schema_visible
            INTO _grouped
            FROM qwat_od.pipe
                INNER JOIN qwat_vl.status ON pipe.fk_status = status.id
                INNER JOIN qwat_vl.pipe_function ON pipe.fk_function = pipe_function.id
            WHERE (pipe.id = (SELECT fk_pipe FROM qwat_od.valve WHERE id = _valve_id))
                AND status.active IS TRUE;

        -- if not connected to any pipe, do nothing
        IF _grouped.count <= 2 THEN
            /* loop over them, and take the 2 first/last vertices
             of the pipe to determine orientation (used for symbology) */
            FOR _pipeitem IN (
                SELECT  pipe.id, pipe.year, pipe_material.value_fr AS material, pipe_material.diameter_nominal AS diameter,
                        ST_StartPoint(geometry) AS point_1,
                        ST_PointN(geometry,2)   AS point_2
                        FROM qwat_od.pipe
                        INNER JOIN qwat_vl.pipe_material ON pipe.fk_material = pipe_material.id
                        INNER JOIN qwat_vl.status        ON pipe.fk_status = status.id
                        WHERE pipe.id = (SELECT fk_pipe FROM qwat_od.valve WHERE id = _valve_id)  AND status.active IS TRUE
            ) LOOP
                IF _looppos=0 THEN
                    -- first pipe
                    _diameter := _pipeitem.diameter;
                    _pipe_id   := _pipeitem.id;
                    _looppos   := 1;
                    _orientation := pi()/2 - ST_Azimuth(_pipeitem.point_2,_pipeitem.point_1);
                    -- RAISE NOTICE 'pipe % %', _pipe_id, degrees( _orientation );
                ELSE
                    -- second pipe if exists
                    _orientation2 := pi()/2 - ST_Azimuth(_pipeitem.point_2,_pipeitem.point_1);
                    _orientation2 := pi() + _orientation2; -- reverse angle
                    -- RAISE NOTICE 'pipe % %', _pipeitem.id, degrees( _orientation2 );
                    _orientation := ATAN2( (SIN(_orientation)+SIN(_orientation2))/2 , (COS(_orientation)+COS(_orientation2))/2 );
                    -- RAISE NOTICE 'mean:  %', degrees(_orientation  );
                    -- reverse arrow according to diameter reduction
                    IF _pipeitem.diameter > _diameter THEN
                        _orientation := _orientation + pi();
                    END IF;
                END IF;
            END LOOP;
        END IF;

        -- update the valve table
        UPDATE qwat_od.valve SET
            orientation    = degrees(_orientation)
            --_pipe_schema_visible = _grouped.schema_visible
            WHERE id = _valve_id;
    END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_node_set_type(integer) IS 'Set the orientation for a valve.';


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




CREATE OR REPLACE FUNCTION qwat_od.fn_node_set_type(_node_id integer) RETURNS void AS
$BODY$
    DECLARE
        _pipeitem     record;
        _pipe_id      integer;
        _grouped      record;
        _year         integer;
        _material     varchar(50);
        _diameter     smallint;
        _looppos      integer          := 0;
        _type         qwat_od.pipe_connection;
        _orientation  double precision := 0;
        _orientation2 double precision := 0;
        _node_geom    geometry;
        _pipe_geom    geometry;
        _sub_geom     geometry;
        _lin_ref      float;
    BEGIN

        -- get the geometry
        _node_geom := geometry FROM qwat_od.node WHERE id = _node_id;

        -- count the active pipes associated to this node
        SELECT
                COUNT(pipe.id) AS count,
                bool_or(coalesce(schema_force_visible,pipe_function.schema_visible)) AS schema_visible
            INTO _grouped
            FROM qwat_od.pipe
                INNER JOIN qwat_vl.status ON pipe.fk_status = status.id
                INNER JOIN qwat_vl.pipe_function ON pipe.fk_function = pipe_function.id
            WHERE (fk_node_a = _node_id OR fk_node_b = _node_id)
                AND status.active IS TRUE;

        -- if not connected to any pipe, delete the node if it is not something else (i.e. is not inherited)
        IF _grouped.count = 0 THEN
            -- check it is not associated to any pipe (including inactive ones)
            IF _node_id NOT IN (SELECT fk_node_a FROM qwat_od.pipe UNION SELECT fk_node_b FROM qwat_od.pipe) THEN
                -- if it is not something else
                IF ( SELECT node_type = 'node'::qwat_od.node_type FROM qwat_od.vw_qwat_node WHERE id = _node_id) THEN
                    -- delete it
                    RAISE NOTICE 'Delete node %' , _node_id;
                    DELETE FROM qwat_od.node WHERE id = _node_id; -- delete on table level for safety (do not delete on the merge view)
                    RETURN;
                END IF;
            ELSE
                _type := NULL::qwat_od.pipe_connection;
            END IF;
        -- if 1 or 2 pipes associated
        ELSEIF _grouped.count <= 2 THEN
            /* loop over them, and take the 2 first/last vertices
             of the pipe to determine orientation (used for symbology) */
            FOR _pipeitem IN (
                SELECT  pipe.id, pipe.year, pipe_material.value_fr AS material, pipe_material.diameter_nominal AS diameter,
                        ST_StartPoint(geometry) AS point_1,
                        ST_PointN(geometry,2)   AS point_2
                        FROM qwat_od.pipe
                        INNER JOIN qwat_vl.pipe_material ON pipe.fk_material = pipe_material.id
                        INNER JOIN qwat_vl.status        ON pipe.fk_status = status.id
                        WHERE fk_node_a = _node_id AND status.active IS TRUE
                UNION ALL
                SELECT  pipe.id, pipe.year, pipe_material.value_fr AS material, pipe_material.diameter_nominal AS diameter,
                        ST_EndPoint(geometry)                      AS point_1,
                        ST_PointN(geometry,ST_NPoints(geometry)-1) AS point_2
                        FROM qwat_od.pipe
                        INNER JOIN qwat_vl.pipe_material ON pipe.fk_material = pipe_material.id
                        INNER JOIN qwat_vl.status        ON pipe.fk_status = status.id
                        WHERE fk_node_b = _node_id AND status.active IS TRUE
            ) LOOP
                IF _looppos=0 THEN
                    -- first pipe
                    _type := 'pipe_end'::qwat_od.pipe_connection;
                    _year     := _pipeitem.year;
                    _material := _pipeitem.material;
                    _diameter := _pipeitem.diameter;
                    _pipe_id   := _pipeitem.id;
                    _looppos   := 1;
                    _orientation := pi()/2 - ST_Azimuth(_pipeitem.point_2,_pipeitem.point_1);
                    -- RAISE NOTICE 'pipe % %', _pipe_id, degrees( _orientation );
                ELSE
                    -- second pipe if exists
                    IF _material = _pipeitem.material AND _diameter = _pipeitem.diameter AND _year = _pipeitem.year THEN
                        _type := 'couple_same'::qwat_od.pipe_connection;
                    ELSIF _material = _pipeitem.material AND _diameter = _pipeitem.diameter THEN
                        _type := 'couple_year'::qwat_od.pipe_connection;
                    ELSIF _material = _pipeitem.material THEN
                        _type := 'couple_diameter'::qwat_od.pipe_connection;
                    ELSIF _diameter = _pipeitem.diameter THEN
                        _type := 'couple_material'::qwat_od.pipe_connection;
                    ELSE
                        _type := 'couple_other';
                    END IF;
                    _orientation2 := pi()/2 - ST_Azimuth(_pipeitem.point_2,_pipeitem.point_1);
                    _orientation2 := pi() + _orientation2; -- reverse angle
                    -- RAISE NOTICE 'pipe % %', _pipeitem.id, degrees( _orientation2 );
                    _orientation := ATAN2( (SIN(_orientation)+SIN(_orientation2))/2 , (COS(_orientation)+COS(_orientation2))/2 );
                    -- RAISE NOTICE 'mean:  %', degrees(_orientation  );
                    -- reverse arrow according to diameter reduction
                    IF _pipeitem.diameter > _diameter THEN
                        _orientation := _orientation + pi();
                    END IF;
                END IF;
            END LOOP;
        -- more than 2 pipes connected, nothing to calculate
        ELSEIF _grouped.count > 2 THEN
            _type := 'T'::qwat_od.pipe_connection;
        END IF;

        -- update the node table
        UPDATE qwat_od.node SET
            _pipe_node_type      = _type,
            _pipe_orientation    = degrees(_orientation),
            _pipe_schema_visible = _grouped.schema_visible
            WHERE id = _node_id;
        --RAISE NOTICE '% %' , _node_id , degrees(_orientation);
    END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_node_set_type(integer) IS 'Set the orientation and type for a node. If three pipe arrives at the node: intersection. If one pipe: end. If two: depends on characteristics of pipe: year (is different), material (and year), diameter(and material/year)';


--DROP VIEW qwat_od.vw_element_valve;


