CREATE OR REPLACE FUNCTION qwat_od.fn_update_pipe_crossing(update_existing boolean default true, delete_unused boolean default true)
  RETURNS void AS
$BODY$
	DECLARE
		_crossing record;
		_pipe1 record;
		_pipe2 record;
		_crossing_id integer;
		_updated_crossing integer[] := ARRAY[]::integer[];
		_inserted_crossing_count integer := 0;
		_updated_crossing_count integer := 0;
		_deleted_crossing_count integer := 0;
	BEGIN
/* * * * * * * * * * * * * * * * * * * * * * * * */
		/* compute all crossing points */
		FOR _crossing IN
			SELECT pipe1_id, pipe2_id,
				pipe1_geometry, pipe2_geometry,
				(dp).geom AS cross_geometry
			FROM
			(
				/* dump mulitpoints to points */
				SELECT pipe1_id, pipe2_id,
					pipe1_geometry, pipe2_geometry,
					ST_DumpPoints(cross_geometry) AS dp FROM
				(
					/* compute the crossing points only for active pipes and different ids */
					SELECT p1.id AS pipe1_id,
						p2.id AS pipe2_id,
						p1.geometry AS pipe1_geometry,
						p2.geometry AS pipe2_geometry,
						ST_Intersection(p1.geometry,p2.geometry) AS cross_geometry
					FROM qwat_od.pipe p1, qwat_od.pipe p2
					WHERE p1.id < p2.id
					AND p1.fk_status = 1301
					AND p2.fk_status = 1301
					AND ST_Crosses(p1.geometry,p2.geometry)
				) AS foo
			 ) AS foo2
		LOOP
/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* SKIP INTERSECTION AT ENDS OF PIPE (occurs if the two pipes cross at another point) */
			IF _crossing.cross_geometry IN (ST_StartPoint(_crossing.pipe1_geometry), ST_EndPoint(_crossing.pipe1_geometry),
						ST_StartPoint(_crossing.pipe2_geometry), ST_EndPoint(_crossing.pipe2_geometry)) THEN
				CONTINUE;
			END IF;
/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* !!!! PIPE 1 !!!! */
			/* perform azimuth for all segments of the pipes with the corresponding linear referencing */
			WITH azimuth AS
			(
				SELECT 	id AS pipe_id,
					n AS pt_index,
					ST_LineLocatePoint( geometry, ST_PointN( geometry, n) ) AS pt_locat,
					( 90 + degrees( ST_Azimuth( ST_PointN( geometry, n), ST_PointN( geometry, n+1 ) ) ) )::integer % 360 AS azimuth
				FROM qwat_od.pipe, generate_series(1, ST_NumPoints(geometry)-1) n
				WHERE pipe.id = _crossing.pipe1_id
			),
			/* find the correct segment according to linear referencing of the crossing point */
			pt_locat AS
			(
				SELECT MAX(pt_locat) AS pt_locat
				FROM azimuth
				WHERE pt_locat < ST_LineLocatePoint( _crossing.pipe1_geometry, _crossing.cross_geometry )
			)
			/* get the corresponding azimuth according to segment id (pt_locat) */
			SELECT azimuth
			INTO _pipe1
			FROM azimuth
			JOIN pt_locat USING (pt_locat);

/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* !!!! PIPE 2 !!!! */
			/* perform azimuth for all segments of the pipes with the corresponding linear referencing */
			WITH azimuth AS
			(
				SELECT 	id AS pipe_id,
					n AS pt_index,
					ST_LineLocatePoint( geometry, ST_PointN( geometry, n) ) AS pt_locat,
					( 90 + degrees( ST_Azimuth( ST_PointN( geometry, n), ST_PointN( geometry, n+1 ) ) ) )::integer % 360 AS azimuth
				FROM qwat_od.pipe, generate_series(1, ST_NumPoints(geometry)-1) n
				WHERE pipe.id = _crossing.pipe2_id
			),
			/* find the correct segment according to linear referencing of the crossing point */
			pt_locat AS
			(
				SELECT MAX(pt_locat) AS pt_locat
				FROM azimuth
				WHERE pt_locat < ST_LineLocatePoint( _crossing.pipe2_geometry, _crossing.cross_geometry )
			)
			/* get the corresponding azimuth according to segment id (pt_locat) */
			SELECT azimuth
			INTO _pipe2
			FROM azimuth
			JOIN pt_locat USING (pt_locat);

/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* ERROR REPORTING */
			IF _pipe1.azimuth IS NULL THEN
				RAISE NOTICE '*******';
				RAISE NOTICE 'POINT: %', ST_AsText(_crossing.cross_geometry);
				RAISE NOTICE 'PIPE: %', _crossing.pipe1_id;
				RAISE NOTICE 'LINE: %', ST_AsText(_crossing.pipe1_geometry);
			END IF;
			IF _pipe2.azimuth IS NULL THEN
				RAISE NOTICE '*******';
				RAISE NOTICE 'POINT: %', ST_AsText(_crossing.cross_geometry);
				RAISE NOTICE 'PIPE: %', _crossing.pipe2_id;
				RAISE NOTICE 'LINE: %', ST_AsText(_crossing.pipe2_geometry);
			END IF;
/* * * * * * * * * * * * * * * * * * * * * * * * */
			/* UPDATE OR INSERT NEW CROSSING */
			SELECT id FROM qwat_od.crossing WHERE ST_Equals(_crossing.cross_geometry,geometry) IS TRUE LIMIT 1 INTO _crossing_id;
			IF _crossing_id IS NULL THEN
				INSERT INTO qwat_od.crossing
						(         _pipe1_id,          _pipe2_id, _pipe1_angle,     _pipe2_angle,                 geometry )
					VALUES
						(_crossing.pipe1_id, _crossing.pipe2_id, _pipe1.azimuth, _pipe2.azimuth, ST_Force2d(_crossing.cross_geometry) )
					RETURNING id INTO _crossing_id;
				_inserted_crossing_count := _inserted_crossing_count + 1;
			ELSIF update_existing IS TRUE THEN
				UPDATE qwat_od.crossing
				SET
					_pipe1_id     = _crossing.pipe1_id,
					_pipe1_angle  = _pipe1.azimuth,
					_pipe2_id     = _crossing.pipe2_id,
					_pipe2_angle  = _pipe2.azimuth,
					geometry      = ST_Force2d(_crossing.cross_geometry)
				WHERE crossing.id = _crossing_id;
				_updated_crossing_count := _updated_crossing_count + 1;
			END IF;
			_updated_crossing := array_append(_updated_crossing, _crossing_id);
		END LOOP;
/* * * * * * * * * * * * * * * * * * * * * * * * */
		/* DELETE OLD CROSSINGS */
		IF delete_unused IS TRUE THEN
			DELETE FROM qwat_od.crossing WHERE NOT ( id = ANY(_updated_crossing) );
			GET DIAGNOSTICS _deleted_crossing_count = ROW_COUNT;
		END IF;
		RAISE NOTICE '';
		RAISE NOTICE '* * * * * * * * * * * * * * * * *';
		RAISE NOTICE '';
		RAISE NOTICE 'Added % new crossing.', _inserted_crossing_count;
		RAISE NOTICE 'Updated % existing crossing.', _updated_crossing_count;
		RAISE NOTICE 'Deleted % unused crossing.', _deleted_crossing_count;
		RAISE NOTICE '';
		RAISE NOTICE '* * * * * * * * * * * * * * * * *';
		RAISE NOTICE '';
	END;
$BODY$
  LANGUAGE plpgsql;
