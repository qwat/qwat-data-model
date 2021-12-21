CREATE OR REPLACE FUNCTION qwat_od.fn_element_part_set_orientation(_element_id integer)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
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
        _node_geom := geometry FROM qwat_od.vw_element_part WHERE id = _element_id;

        -- count the active pipes associated to this element
        SELECT
                COUNT(*) AS count,
                bool_or(coalesce(schema_force_visible,pipe_function.schema_visible)) AS schema_visible
            INTO _grouped
            FROM qwat_od.pipe
                INNER JOIN qwat_vl.status ON pipe.fk_status = status.id
                INNER JOIN qwat_vl.pipe_function ON pipe.fk_function = pipe_function.id
            WHERE (pipe.id = (SELECT fk_pipe FROM qwat_od.vw_element_part WHERE id = _element_id))
                AND status.active IS TRUE;

               
        raise notice 'Pipes associés à %, %', _element_id, _grouped;
        -- if not connected to any pipe, do nothing
        IF _grouped.count <= 2 THEN
            /* loop over them, and take the 2 first/last vertices
             of the pipe to determine orientation (used for symbology) */
            FOR _pipeitem IN (
                SELECT  pipe.id, pipe.year, pipe_material.value_fr AS material, pipe_material.diameter_nominal AS diameter,
                    -- take the first and second nodes of the pipe to have the right orientation
                	case 
                        when ST_Intersects(_node_geom,
                                            (select node.geometry from qwat_od.node
                                            join qwat_od.pipe on pipe.id = (
                                                SELECT fk_pipe 
                                                FROM qwat_od.part 
                                                WHERE id = _element_id)
                                            where node.id = pipe.fk_node_a                                                
                                            )
                        ) THEN
                        	ST_StartPoint(geometry)
                        else 
                        	ST_EndPoint(geometry)                        	
                    end AS point_1,
                    -- or the last and second to last nodes of the pipe to have the right orientation
                	case 
                        when ST_Intersects(_node_geom,
                                            (select node.geometry from qwat_od.node
                                            join qwat_od.pipe on pipe.id = (
                                                SELECT fk_pipe 
                                                FROM qwat_od.part 
                                                WHERE id = _element_id)
                                            where node.id = pipe.fk_node_a                                                
                                            )
                        ) THEN
                            ST_PointN(geometry,2)
                        else 
                        	ST_PointN(geometry,ST_NPoints(geometry)-1)                        	
                    end AS point_2                                        
                        FROM qwat_od.pipe
                        INNER JOIN qwat_vl.pipe_material ON pipe.fk_material = pipe_material.id
                        INNER JOIN qwat_vl.status        ON pipe.fk_status = status.id
                        WHERE pipe.id = (SELECT fk_pipe FROM qwat_od.part WHERE id = _element_id)  AND status.active IS true
            ) LOOP
                IF _looppos=0 THEN
                    -- first pipe
                    _diameter := _pipeitem.diameter;
                    _pipe_id   := _pipeitem.id;
                    _looppos   := 1;
                    _orientation := pi()/2 - ST_Azimuth(_pipeitem.point_2,_pipeitem.point_1);
                    -- RAISE NOTICE 'pipe %, orientation : %', _pipe_id, degrees( _orientation );
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

        -- update network_element and node tables
        UPDATE qwat_od.network_element SET
            orientation    = degrees(_orientation)
            --_pipe_schema_visible = _grouped.schema_visible
            WHERE id = _element_id;
		UPDATE qwat_od.node SET
				_pipe_orientation = degrees(_orientation)
			WHERE id = _element_id;
	END;
$function$
;
