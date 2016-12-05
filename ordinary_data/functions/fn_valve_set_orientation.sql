/*
    qWat - QGIS Water Module

    SQL file :: valve functions
*/


/* define valve orientation type */
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