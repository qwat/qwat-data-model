

/* (table_name, srid, is_node, create_node, _create_alt_geom, get_pipe, _auto_district, _auto_pressurezone) */
CREATE OR REPLACE FUNCTION qwat_od.fn_geom_tool_point(
			_table_name text,
			_srid integer,
			_is_node boolean,
			_create_node boolean,
			_create_alt_geom boolean,
			_get_pipe boolean,
			_auto_district boolean,
			_auto_pressurezone boolean)
	RETURNS void AS
$func$
	DECLARE
		_sql_cmd varchar;
	BEGIN
		RAISE NOTICE 'add point geometry for %s', _table_name;

		/* ----------------------------------- */
		/* Add columns and constraint to table */
		IF _is_node IS TRUE THEN
			EXECUTE format('
			ALTER TABLE qwat_od.%I ADD COLUMN fk_node         integer %2$s  ;'
			, _table_name --1
			, CASE WHEN _create_node IS TRUE THEN 'not null' ELSE '' END --2
		);
		END IF;
		EXECUTE format('
			ALTER TABLE qwat_od.%1$I
				ADD COLUMN fk_district     integer,
				ADD COLUMN fk_pressurezone integer,
				ADD COLUMN fk_printmap     integer[],
				ADD COLUMN altitude        double precision ; -- this field is synchronized with Z value of main geometry
			ALTER TABLE qwat_od.%1$I ADD COLUMN _printmaps varchar(100)  ;
			ALTER TABLE qwat_od.%1$I ADD COLUMN geometry geometry(''POINTZ'',%2$I);
				CREATE INDEX %3$I ON qwat_od.%1$I USING GIST ( geometry );'
			, _table_name --1
			, _srid --2
			, _table_name||'_geoidx' --3
		);
		IF _get_pipe IS TRUE THEN
			EXECUTE format('
			ALTER TABLE qwat_od.%1$I ADD COLUMN fk_pipe         integer   ;'
			, _table_name
		);
		END IF;
		IF _create_alt_geom IS TRUE THEN
			EXECUTE format('
				ALTER TABLE qwat_od.%1$I ADD COLUMN geometry_alt1 geometry(''POINTZ'',%2$I);
				ALTER TABLE qwat_od.%1$I ADD COLUMN geometry_alt2 geometry(''POINTZ'',%2$I);
				CREATE INDEX %3$I ON qwat_od.%1$I USING GIST ( geometry_alt1 );
				CREATE INDEX %4$I ON qwat_od.%1$I USING GIST ( geometry_alt2 );
				ALTER TABLE qwat_od.%1$I
					ADD COLUMN _geometry_alt1_used boolean,
					ADD COLUMN _geometry_alt2_used boolean,
					ADD COLUMN _update_geometry_alt boolean;' -- column used to determine if alternative geometries should be updated when modifying main geometry
				, _table_name --1
				, _srid --2
				, _table_name||'_geoidx_alt1' --3
				, _table_name||'_geoidx_alt2' --4
			);
		END IF;

		IF _is_node IS TRUE THEN
			EXECUTE format('
				-- FK to node
				ALTER TABLE qwat_od.%1$I
					ADD CONSTRAINT %2$I FOREIGN KEY (fk_node)
					REFERENCES qwat_od.node(id) MATCH FULL;
				CREATE INDEX %3$I ON qwat_od.%1$I(fk_node);'
				, _table_name
				, _table_name||'_fk_node'
				, 'fki_'||_table_name||'_fk_node', _table_name
			);
		END IF;
		EXECUTE format('
				-- FK to pressurezone/district
				ALTER TABLE qwat_od.%1$I
					ADD CONSTRAINT %2$I FOREIGN KEY (fk_district)
					REFERENCES qwat_od.district(id) MATCH FULL;
				ALTER TABLE qwat_od.%1$I
					ADD CONSTRAINT %3$I FOREIGN KEY (fk_pressurezone)
					REFERENCES qwat_od.pressurezone(id) MATCH FULL;
				CREATE INDEX %4$I ON qwat_od.%1$I(fk_district);
				CREATE INDEX %5$I ON qwat_od.%1$I(fk_pressurezone);'
				, _table_name --1
				, _table_name||'_fk_district' --2
				, _table_name||'_fk_pressurezone' --3
				, 'fki_'||_table_name||'_fk_district' --4
				, 'fki_'||_table_name||'_fk_pressurezone' --5
			);
		IF _get_pipe IS TRUE THEN
			EXECUTE format('
				-- FK to pipe
				ALTER TABLE qwat_od.%1$I
					ADD CONSTRAINT %2$I FOREIGN KEY (fk_pipe)
					REFERENCES qwat_od.pipe(id) MATCH FULL;
				CREATE INDEX %3$I ON qwat_od.%1$I(fk_pipe);'
				, _table_name --1
				, _table_name||'_fk_pipe' --2
				, 'fki_'||_table_name||'_fk_pipe' --3
			);
		END IF;



		/* ------------------------------------------- */
		/* Insert/update trigger function for geometry */
		_sql_cmd := format('CREATE OR REPLACE FUNCTION qwat_od.%1$I() RETURNS TRIGGER AS
				''
				BEGIN
						NEW.fk_printmap        := qwat_od.fn_get_printmap_id(NEW.geometry);'
			, 'ft_'||_table_name||'_geom'
		);
		IF _auto_pressurezone IS TRUE THEN
			_sql_cmd := _sql_cmd || '
						NEW.fk_pressurezone    := qwat_od.fn_get_pressurezone(NEW.geometry);';
		ELSE
			_sql_cmd := _sql_cmd || '
						IF TG_OP = ''''INSERT'''' AND NEW.fk_pressurezone IS NULL THEN
							NEW.fk_pressurezone    := qwat_od.fn_get_pressurezone(NEW.geometry);
						END IF;';
		END IF;
		IF _auto_district IS TRUE THEN
			_sql_cmd := _sql_cmd || '
						NEW.fk_district    := qwat_od.fn_get_district(NEW.geometry);';
		ELSE
			_sql_cmd := _sql_cmd || '
						IF TG_OP = ''''INSERT'''' AND NEW.fk_district IS NULL THEN
							NEW.fk_district    := qwat_od.fn_get_district(NEW.geometry);
						END IF;';
		END IF;
		IF _is_node IS TRUE THEN
			_sql_cmd := _sql_cmd || format('
						NEW.fk_node            := qwat_od.fn_get_node(NEW.geometry, %s);'
				, _create_node::text
			);
		END IF;
		IF _get_pipe IS TRUE THEN
			_sql_cmd := _sql_cmd || '
						NEW.fk_pipe            := qwat_od.fn_pipe_get_id(NEW.geometry);';
		END IF;
		IF _create_alt_geom IS TRUE THEN
			_sql_cmd := _sql_cmd || '
						NEW.geometry_alt1       := NEW.geometry;
						NEW.geometry_alt2       := NEW.geometry;
						NEW._geometry_alt1_used := false;
						NEW._geometry_alt2_used := false;';
		END IF;
		_sql_cmd := _sql_cmd || '
						NEW._printmaps         := qwat_od.fn_get_printmaps(NEW.geometry);
						-- on insert initialize altitudes
						IF TG_OP = ''''INSERT'''' THEN
							IF NEW.altitude IS NULL THEN
								NEW.altitude := ST_Z(NEW.geometry);
							END IF;
							IF ST_Z(NEW.geometry) IS NULL THEN
								NEW.geometry := ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), altitude );
							END IF;
						END IF;
					RETURN NEW;
				END;
				''
				LANGUAGE plpgsql;
		';
		RAISE NOTICE '%', _sql_cmd;
		EXECUTE _sql_cmd;


		/* create triggers on main geometry */
		EXECUTE format('CREATE TRIGGER %1$I
						BEFORE INSERT ON qwat_od.%2$I
						FOR EACH ROW
						EXECUTE PROCEDURE qwat_od.%3$I();'
			, 'tr_'||_table_name||'_geom_insert'
			, _table_name
			, 'ft_'||_table_name||'_geom'
		);

		EXECUTE format('COMMENT ON TRIGGER %1$I ON qwat_od.%2$I IS ''Trigger: updates auto fields after insert.'';'
			, 'tr_'||_table_name||'_geom_insert'
			, _table_name
		);

		EXECUTE format('CREATE TRIGGER %1$I
						BEFORE UPDATE OF geometry ON qwat_od.%2$I
						FOR EACH ROW
						WHEN (ST_AsBinary(ST_Force_2D(NEW.geometry)) <> ST_AsBinary(ST_Force_2D(OLD.geometry))) -- do not trigger when a change occurs in Z to avoid infinite loop
						EXECUTE PROCEDURE qwat_od.%3$I();'
			, 'tr_'||_table_name||'_geom_update'
			, _table_name
			, 'ft_'||_table_name||'_geom'
		);

		EXECUTE format('COMMENT ON TRIGGER %1$I ON qwat_od.%2$I IS ''Trigger: updates auto fields after geom update.'';'
			, 'tr_'||_table_name||'_geom_update'
			, _table_name
		);



		/* ----------------- */
		/* Altitude triggers */
		EXECUTE FORMAT(
			$$
				CREATE OR REPLACE FUNCTION qwat_od.%1$I() RETURNS TRIGGER AS
					'
					BEGIN
						-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
						IF NEW.altitue <> OLD.altitude THEN
							NEW.geometry := ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), altitude );
						ELSIF ST_Z(NEW.geometry) <> ST_Z(OLD.geometry) THEN
							NEW.altitude := ST_Z(NEW.geometry);
						END IF;
					END;
					'
					LANGUAGE plpgsql;
				CREATE TRIGGER %1$I
					BEFORE UPDATE OF altitude, geometry ON qwat_od.%2$I
					FOR EACH ROW
					WHEN (NEW.altitude <> OLD.altitude OR ST_Z(NEW.geometry) <> ST_Z(OLD.geometry))
					EXECUTE PROCEDURE qwat_od.%1$I();
				COMMENT ON TRIGGER %1$I ON qwat_od.%2$I IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';
			$$
			, 'ft_'||_table_name||'_altitude_geom'
			, _table_name
		);




		/* ------------------------------ */
		/* Alternative geometies triggers */
		IF _create_alt_geom IS TRUE THEN
			EXECUTE format(
				$$
					CREATE OR REPLACE FUNCTION qwat_od.%1$I() RETURNS TRIGGER AS
						'
						BEGIN
							NEW._geometry_alt1_used := NEW.geometry_alt1 IS NULL OR ST_AsBinary(NEW.geometry_alt1) <> ST_AsBinary(NEW.geometry);
							NEW._geometry_alt2_used := NEW.geometry_alt2 IS NULL OR ST_AsBinary(NEW.geometry_alt2) <> ST_AsBinary(NEW.geometry);
							RETURN NEW;
						END;
						'
						LANGUAGE plpgsql;
					CREATE TRIGGER %1$I
						BEFORE UPDATE OF geometry_alt1, geometry_alt2  ON qwat_od.%2$I
						FOR EACH ROW
						EXECUTE PROCEDURE qwat_od.%1$I();
					COMMENT ON TRIGGER %1$I ON qwat_od.%2$I IS 'Trigger: when updating, check if alternative geometries are different to fill the boolean fields.';
				$$
				, 'ft_'||_table_name||'_alternative_geom'
				, _table_name
			);
		END IF;
	END;
$func$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_geom_tool_point(text,integer,boolean,boolean,boolean,boolean,boolean,boolean) IS 'Create geometric columns, constraint and triggers for tables with point on node items. Second argument determines if node has to be created or not if not found.  (table_name, _is_node, _create_node, _create_alt_geom, _get_pipe, _auto_district, _auto_pressurezone)';

