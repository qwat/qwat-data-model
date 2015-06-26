

/* (table_name, is_node, create_node, _create_alt_geom, get_pipe, _auto_district, _auto_pressurezone) */
CREATE OR REPLACE FUNCTION qwat_od.fn_geom_tool_point(
			_table_name text,
			_is_node boolean,
			_create_node boolean,
			_create_alt_geom boolean,
			_get_pipe boolean,
			_auto_district boolean,
			_auto_pressurezone boolean)
	RETURNS void AS
$func$
	DECLARE
		sql_trigger varchar;
		match_mode varchar;
	BEGIN
		/* Creates columns */
		IF _is_node IS TRUE THEN
			IF _create_node IS TRUE THEN
				EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN fk_node         integer not null  ;', _table_name);
			ELSE
				EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN fk_node         integer   ;', _table_name);
			END IF;
		END IF;
		EXECUTE format('ALTER TABLE qwat_od.%I
							ADD COLUMN fk_district     integer,
							ADD COLUMN fk_pressurezone integer,
							ADD COLUMN fk_printmap     integer[] ;', _table_name);
		IF _get_pipe IS TRUE THEN
			EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN fk_pipe         integer   ;', _table_name);
		END IF;
		IF _auto_district IS TRUE THEN
			EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN _district       varchar(255)  ;', _table_name);
		END IF;
		IF _auto_pressurezone IS TRUE THEN
			EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN _pressurezone   varchar(255)  ;', _table_name);
		END IF;
		EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN _printmaps      varchar(100)  ;', _table_name);

		/* Enables geometry */
		PERFORM addGeometryColumn('qwat_od', _table_name, 'geometry', 21781, 'POINT', 2);
		EXECUTE format('CREATE INDEX %1$I ON qwat_od.%2$I USING GIST ( geometry );', _table_name||'_geoidx', _table_name);
		IF _create_alt_geom IS TRUE THEN
			PERFORM addGeometryColumn('qwat_od', _table_name, 'geometry_alt1', 21781, 'POINT', 2);
			PERFORM addGeometryColumn('qwat_od', _table_name, 'geometry_alt2', 21781, 'POINT', 2);
			EXECUTE format('CREATE INDEX %1$I ON qwat_od.%2$I USING GIST ( geometry_alt1 );
							CREATE INDEX %3$I ON qwat_od.%2$I USING GIST ( geometry_alt2 );
							ALTER TABLE qwat_od.%2$I  ADD COLUMN _geometry_alt1_used boolean,
													  ADD COLUMN _geometry_alt2_used boolean;',
							_table_name||'_geoidx_alt1', _table_name, _table_name||'_geoidx_alt2');
		END IF;

		/* Add constraints and indexes */
		IF _is_node IS TRUE THEN
			IF _create_node IS TRUE THEN
				match_mode := 'FULL';
			ELSE
				match_mode := 'SIMPLE';
			END IF;
			EXECUTE format('ALTER TABLE qwat_od.%1$I ADD CONSTRAINT %2$I FOREIGN KEY (fk_node)     REFERENCES qwat_od.node(id)         MATCH %3$s;',
								_table_name, _table_name||'_fk_node ', match_mode);
		END IF;
		EXECUTE format('ALTER TABLE qwat_od.%1$I ADD CONSTRAINT %2$I FOREIGN KEY (fk_district)     REFERENCES qwat_od.district(id)     MATCH FULL;
						ALTER TABLE qwat_od.%1$I ADD CONSTRAINT %3$I FOREIGN KEY (fk_pressurezone) REFERENCES qwat_od.pressurezone(id) MATCH FULL;',
						_table_name, _table_name||'_fk_district', _table_name||'_fk_pressurezone');
		IF _get_pipe IS TRUE THEN
			EXECUTE format('ALTER TABLE qwat_od.%1$I ADD CONSTRAINT %2$I FOREIGN KEY (fk_pipe) REFERENCES qwat_od.pipe(id) MATCH FULL;', _table_name, _table_name||'_fk_pipe');
		END IF;
		IF _is_node IS TRUE THEN
			EXECUTE format('CREATE INDEX %1$I ON qwat_od.%2$I(fk_node);', 'fki_'||_table_name||'_fk_node', _table_name);
		END IF;
		EXECUTE format('CREATE INDEX %1$I ON qwat_od.%2$I(fk_district);
						CREATE INDEX %3$I ON qwat_od.%2$I(fk_pressurezone);',
						'fki_'||_table_name||'_fk_district', _table_name, 'fki_'||_table_name||'_fk_pressurezone');
		IF _get_pipe IS TRUE THEN
			EXECUTE format('CREATE INDEX %1$I ON qwat_od.%2$I(fk_pipe);', 'fki_'||_table_name||'_fk_pipe', _table_name);
		END IF;

		/* Geometric trigger function */
		sql_trigger := format('CREATE OR REPLACE FUNCTION qwat_od.%I() RETURNS TRIGGER AS
				''
				BEGIN', 'ft_'||_table_name||'_geom');
		IF _is_node IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW.fk_node            := qwat_od.fn_node_get_id(NEW.geometry, '||_create_node||');';
		END IF;
		IF _auto_district IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW._district          := qwat_od.fn_get_districts(NEW.geometry);';
		END IF;
		sql_trigger := sql_trigger || '
						NEW.fk_district        := qwat_od.fn_get_district_id(NEW.geometry);';
		IF _auto_pressurezone IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW._pressurezone      := qwat_od.fn_get_pressurezone(NEW.geometry);';
		END IF;
		sql_trigger := sql_trigger || '
						NEW.fk_pressurezone    := qwat_od.fn_get_pressurezone_id(NEW.geometry);';
		sql_trigger := sql_trigger || '
						NEW.fk_printmap        := qwat_od.fn_get_printmap_id(NEW.geometry);';
		IF _get_pipe IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW.fk_pipe            := qwat_od.fn_pipe_get_id(NEW.geometry);';
		END IF;		IF _create_alt_geom IS TRUE THEN
			sql_trigger := sql_trigger || '
						NEW.geometry_alt1       := NEW.geometry;
						NEW.geometry_alt2       := NEW.geometry;
						NEW._geometry_alt1_used := false;
						NEW._geometry_alt2_used := false;';
		END IF;
		sql_trigger := sql_trigger || '
						NEW._printmaps         := qwat_od.fn_get_printmaps(NEW.geometry);
					RETURN NEW;
				END;
				''
				LANGUAGE plpgsql;
		';
		EXECUTE sql_trigger;

		/* create triggers */
		EXECUTE format('CREATE TRIGGER %1$I
						BEFORE INSERT ON qwat_od.%2$I
						FOR EACH ROW
						EXECUTE PROCEDURE qwat_od.%3$I();',
				'tr_'||_table_name||'_geom_insert', _table_name, 'ft_'||_table_name||'_geom');

		EXECUTE format('COMMENT ON TRIGGER %1$I ON qwat_od.%2$I IS ''Trigger: updates auto fields after insert.'';', 'tr_'||_table_name||'_geom_insert', _table_name);

		EXECUTE format('CREATE TRIGGER %1$I
						BEFORE UPDATE OF geometry ON qwat_od.%2$I
						FOR EACH ROW
						WHEN (ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry))
						EXECUTE PROCEDURE qwat_od.%3$I();',
				'tr_'||_table_name||'_geom_update', _table_name, 'ft_'||_table_name||'_geom');

		EXECUTE format('COMMENT ON TRIGGER %1$I ON qwat_od.%2$I IS ''Trigger: updates auto fields after geom update.'';', 'tr_'||_table_name||'_geom_update', _table_name);

		/* detect if alternatve geom is used */
		IF _create_alt_geom IS TRUE THEN
			EXECUTE format('
				CREATE OR REPLACE FUNCTION qwat_od.%I() RETURNS TRIGGER AS
					''
					BEGIN
						NEW._geometry_alt1_used := NEW.geometry_alt1 IS NULL OR ST_AsBinary(NEW.geometry_alt1) <> ST_AsBinary(NEW.geometry);
						NEW._geometry_alt2_used := NEW.geometry_alt2 IS NULL OR ST_AsBinary(NEW.geometry_alt2) <> ST_AsBinary(NEW.geometry);
						RETURN NEW;
					END;
					''
					LANGUAGE plpgsql;
			', 'ft_'||_table_name||'_alternative_geom');

			EXECUTE format('CREATE TRIGGER %1$I
							BEFORE UPDATE OF geometry_alt1, geometry_alt2  ON qwat_od.%2$I
							FOR EACH ROW
							EXECUTE PROCEDURE qwat_od.%3$I();',
					'tr_'||_table_name||'_alternative_geom', _table_name, 'ft_'||_table_name||'_alternative_geom');

			EXECUTE format('COMMENT ON TRIGGER %1$I ON qwat_od.%2$I IS ''Trigger: when updating, check if alternative geometries are different to fill the boolean fields.'';',
						'tr_'||_table_name||'_alternative_geom',_table_name);
		END IF;
	END;
$func$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_geom_tool_point(text,boolean,boolean,boolean,boolean,boolean,boolean) IS 'Create geometric columns, constraint and triggers for tables with point on node items. Second argument determines if node has to be created or not if not found.  (table_name, _is_node, _create_node, _create_alt_geom, _get_pipe, _auto_district, _auto_pressurezone)';

