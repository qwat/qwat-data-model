/*
	qWat - QGIS Water Module

	SQL file :: node functions
*/


/* define node type */
/* node type: end, intersection, year, material, diameter */
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

		-- get the geoemetry
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
				-- otherwise this means the node is node at the end of a pipe, it must be on a vertex
				ELSE
					-- calculate the orientation on that vertex
					_pipe_geom := geometry 
									FROM qwat_od.pipe 
									WHERE ST_Intersects(pipe.geometry, _node_geom) 
									ORDER BY (
										_node_geom IN (
											ST_StartPoint(pipe.geometry),
											ST_EndPoint(pipe.geometry))
										)::integer ASC -- prefer a pipe which doesn't end on the valve
									LIMIT 1;
					
					IF _pipe_geom IS NULL THEN
						RAISE NOTICE 'Network element of type % with ID % is not located on a pipe!'
							, element_type FROM qwat_od.vw_qwat_network_element WHERE id = _node_id
							, _node_id ;
					ELSE
						_lin_ref := ST_LineLocatePoint(_pipe_geom,_node_geom); -- shouldn't be 0 or 1 as it would mean that the node is a pipe end

						_sub_geom := ST_LineSubstring( _pipe_geom, 0, _lin_ref);
						_orientation  := pi()/2 - ST_Azimuth( 	ST_EndPoint(_pipe_geom),
																ST_PointN(_pipe_geom, ST_NumPoints(_pipe_geom)-1) );
						_sub_geom := ST_LineSubstring( _pipe_geom, _lin_ref, 1);
						_orientation2 := pi()/2 - ST_Azimuth( 	ST_StartPoint(_pipe_geom),
																ST_PointN(_pipe_geom, 2) );
						--RAISE NOTICE 'pipe 1 %', degrees( _orientation );
						--RAISE NOTICE 'pipe 2 %', degrees( _orientation2 );
						_orientation := ATAN2( (COS(_orientation)+COS(_orientation))/2 , (-SIN(_orientation)+SIN(_orientation2))/2 );
						--RAISE NOTICE 'mean %', degrees( _orientation );
					END IF;
				END IF;
			ELSE
				_type := NULL::qwat_od.pipe_connection;
			END IF;
		-- if 1 or 2 pipes associated
		ELSEIF _grouped.count <= 2 THEN
			/* loop over them, and take the 2 first/last vertices
			 of the pipe to determine orientation (used for symbology) */
			FOR _pipeitem IN (
				SELECT 	pipe.id, pipe.year, pipe_material.value_fr AS material, pipe_material.diameter_nominal AS diameter,
						ST_StartPoint(geometry) AS point_1,
						ST_PointN(geometry,2)   AS point_2
						FROM qwat_od.pipe
						INNER JOIN qwat_vl.pipe_material ON pipe.fk_material = pipe_material.id
						INNER JOIN qwat_vl.status        ON pipe.fk_status = status.id
						WHERE fk_node_a = _node_id AND status.active IS TRUE
				UNION ALL
				SELECT	pipe.id, pipe.year, pipe_material.value_fr AS material, pipe_material.diameter_nominal AS diameter,
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
					_orientation := pi()/2 - ST_Azimuth(_pipeitem.point_1,_pipeitem.point_2);
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
					_orientation2 := pi()/2 - ST_Azimuth(_pipeitem.point_1,_pipeitem.point_2);
					--RAISE NOTICE 'pipe % %', _pipe_id, degrees( _orientation );
					--RAISE NOTICE 'pipe % %', _pipeitem.id, degrees( _orientation2 );
					_orientation := ATAN2( (COS(_orientation)+COS(_orientation2))/2 , (SIN(_orientation)+SIN(_orientation2))/2 );
					--RAISE NOTICE 'mean:  %', degrees(_orientation  );
					-- reverse arrow according to diameter reduction
					IF _pipeitem.diameter < _diameter THEN
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





/* reset all node type */
CREATE OR REPLACE FUNCTION qwat_od.fn_node_set_type( _node_ids integer[] DEFAULT NULL ) RETURNS void AS
$BODY$
	DECLARE
		node record;
		_node_id integer;
	BEGIN
		IF _node_ids IS NULL THEN
			FOR node IN (SELECT id FROM qwat_od.node ORDER BY id) LOOP
				PERFORM qwat_od.fn_node_set_type(node.id);
			END LOOP;
		ELSE
			FOREACH _node_id IN ARRAY _node_ids LOOP
				PERFORM qwat_od.fn_node_set_type(_node_id);
			END LOOP;
		END IF;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_node_set_type( _node_ids integer[] ) IS 'Set the type and orientation for node. If three pipe arrives at the node: intersection. If one pipe: end. If two: depends on characteristics of pipe: year (is different), material (and year), diameter(and material/year)';
