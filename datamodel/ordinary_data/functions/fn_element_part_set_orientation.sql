CREATE OR REPLACE FUNCTION qwat_od.fn_element_part_set_orientation(_element_id integer)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    DECLARE
        _pipeitem     record;
        _pipe_id      integer;
        _node_id	  integer;
        _grouped      record;
        _diameter     smallint;
        _looppos      integer          := 0;
        _orientation  double precision := 0;
        _orientation2 double precision := 0;
        _node_geom    geometry;
        _pipe_geom    geometry;
        _sub_geom     geometry;
        _start_geom   geometry;
        _end_geom     geometry;
        _lin_ref      float;
        _type         qwat_od.pipe_connection;
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

               
        raise notice 'Number of pipes associated with node %, %', _element_id, _grouped.count;
        -- if not connected to any pipe, set type to NULL
        IF _grouped.count = 0 THEN
            _type := NULL::qwat_od.pipe_connection;
        -- if 1 or 2 pipes associated
        ELSEIF _grouped.count <= 2 THEN
            -- search for node on pipe that will be replaced by element part
            SELECT id FROM qwat_od.node WHERE ST_Equals(ST_Force2d(_node_geom), ST_Force2d(node.geometry)) IS true and id<>_element_id LIMIT 1 INTO _node_id;
            IF _node_id IS not NULL then
				SELECT ST_StartPoint(geometry) into _start_geom FROM qwat_od.pipe WHERE fk_node_a = _node_id;
				SELECT ST_EndPoint(geometry) into _end_geom FROM qwat_od.pipe WHERE fk_node_b = _node_id;
				IF _start_geom IS NOT NULL then
					RAISE NOTICE 'Delete node % at the start of pipe and replace with element part %', _node_id, _element_id;
				    -- update fk_node_a with new node (element_part)
				    UPDATE qwat_od.pipe SET fk_node_a = _element_id WHERE fk_node_a = _node_id;
				END IF;
				IF _end_geom IS NOT NULL then
					RAISE NOTICE 'Delete node % at the end of pipe and replace with element part %', _node_id, _element_id;
				    -- update fk_node_b with new node (element part)
				    UPDATE qwat_od.pipe SET fk_node_b = _element_id WHERE fk_node_b = _node_id;
				END IF;
                -- then delete node that is not used anymore
	            IF _node_id NOT IN (SELECT fk_node_a FROM qwat_od.pipe UNION SELECT fk_node_b FROM qwat_od.pipe) THEN
	                -- if it is not something else
	                IF ( SELECT node_type = 'node'::qwat_od.node_type FROM qwat_od.vw_qwat_node WHERE id = _node_id) THEN
	                    -- delete it
	                    RAISE NOTICE 'Delete node %' , _node_id;
	                    DELETE FROM qwat_od.node WHERE id = _node_id; -- delete on table level for safety (do not delete on the merge view)
	                END IF;
	            END IF;
	        END IF;
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
                    _type := 'pipe_end'::qwat_od.pipe_connection;
                    _diameter := _pipeitem.diameter;
                    _pipe_id   := _pipeitem.id;
                    _looppos   := 1;
                    _orientation := pi()/2 - ST_Azimuth(_pipeitem.point_2,_pipeitem.point_1);
                    -- RAISE NOTICE 'pipe %, orientation : %', _pipe_id, degrees( _orientation );
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
        END IF;

        -- update network_element and node tables
        UPDATE qwat_od.network_element SET
            orientation    = round(degrees(_orientation))
            --_pipe_schema_visible = _grouped.schema_visible
            WHERE id = _element_id;
		UPDATE qwat_od.node SET
                _pipe_node_type = _type,
				_pipe_orientation = round(degrees(_orientation))
			WHERE id = _element_id;
	END;
$function$
;
