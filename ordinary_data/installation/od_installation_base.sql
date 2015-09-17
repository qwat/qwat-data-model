/*
	qWat - QGIS Water Module

	SQL file :: print table and function
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.installation (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.installation IS 'This is the base table for all installation types.';

/* COLUMNS */
ALTER TABLE qwat_od.installation ADD COLUMN name               varchar(60)      ;
ALTER TABLE qwat_od.installation ADD COLUMN identification     varchar(25)      ;
ALTER TABLE qwat_od.installation ADD COLUMN fk_parent          integer          ;
ALTER TABLE qwat_od.installation ADD COLUMN fk_status          integer not null ;
ALTER TABLE qwat_od.installation ADD COLUMN fk_distributor     integer not null ;
ALTER TABLE qwat_od.installation ADD COLUMN fk_remote          integer          ;
ALTER TABLE qwat_od.installation ADD COLUMN fk_watertype       integer not null ;
ALTER TABLE qwat_od.installation ADD COLUMN fk_locationtype    integer[]		 ;
ALTER TABLE qwat_od.installation ADD COLUMN fk_precisionalti   integer          ;
ALTER TABLE qwat_od.installation ADD COLUMN year               smallint    CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation ADD COLUMN year_end           smallint    CHECK (year_end IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation ADD COLUMN parcel             varchar(30)  ;
ALTER TABLE qwat_od.installation ADD COLUMN eca                varchar(30)  ;
ALTER TABLE qwat_od.installation ADD COLUMN altitude           decimal(10,3);
ALTER TABLE qwat_od.installation ADD COLUMN remark             text         ;
ALTER TABLE qwat_od.installation ADD COLUMN open_water_surface boolean     default false  ;

/* GEOMETRY */
/* POINT                              ( table_name,       srid, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('installation', :SRID,true,    true,        true,             false ,    true         , false);
/* POLYGON */
ALTER TABLE qwat_od.installation ADD COLUMN geometry_polygon geometry('MULTIPOLYGON',:SRID);
CREATE INDEX installation_poly_geoidx ON qwat_od.installation USING GIST ( geometry_polygon );

/* LABELS */
SELECT qwat_od.fn_label_create_fields('installation');


/* CONSTRAINTS AND INDEXES */
ALTER TABLE qwat_od.installation ADD CONSTRAINT installation_fk_parent        FOREIGN KEY (fk_parent)        REFERENCES qwat_od.installation(id) MATCH FULL; CREATE INDEX fki_installation_fk_parent        ON qwat_od.installation(fk_parent);
ALTER TABLE qwat_od.installation ADD CONSTRAINT installation_fk_status        FOREIGN KEY (fk_status)        REFERENCES qwat_vl.status(id)            MATCH FULL; CREATE INDEX fki_installation_fk_status        ON qwat_od.installation(fk_status);
ALTER TABLE qwat_od.installation ADD CONSTRAINT installation_fk_distributor   FOREIGN KEY (fk_distributor)   REFERENCES qwat_od.distributor(id)       MATCH FULL; CREATE INDEX fki_installation_fk_distributor   ON qwat_od.installation(fk_distributor) ;
ALTER TABLE qwat_od.installation ADD CONSTRAINT installation_fk_remote        FOREIGN KEY (fk_remote)        REFERENCES qwat_vl.remote_type(id)       MATCH FULL; CREATE INDEX fki_installation_fk_remote        ON qwat_od.installation(fk_remote)      ;
ALTER TABLE qwat_od.installation ADD CONSTRAINT installation_fk_watertype     FOREIGN KEY (fk_watertype)     REFERENCES qwat_vl.watertype(id)         MATCH FULL; CREATE INDEX fki_installation_watertype        ON qwat_od.installation(fk_watertype)   ;
ALTER TABLE qwat_od.installation ADD CONSTRAINT installation_fk_precisionalti FOREIGN KEY (fk_precisionalti) REFERENCES qwat_vl.precisionalti(id)     MATCH FULL; CREATE INDEX fki_installation_fk_precisionalti ON qwat_od.installation(fk_precisionalti);




/* FUNCTION TO CREATE VIEWS */
CREATE OR REPLACE FUNCTION qwat_sys.fn_installation_view_create(_parent_table json, _children_tables json[], _destination_schema text) RETURNS void AS
$BODY$
	DECLARE 
		_parent_field_array text[];
		_child_field_array text[];
		_parent_field_list text;
		_child_field_list text;
		_view_rootname text;
		_view_name text;
		_function_trigger text;
		_child_table json;
		_merge_view_cmd_1 text;
		_merge_view_cmd_2 text;
		_count integer := 0;
		_tname text;
	BEGIN
		-- get array of fields for parent table
		EXECUTE format(	$$ SELECT ARRAY( SELECT attname FROM pg_attribute WHERE attrelid = %1$L::regclass AND attnum > 0 ORDER BY attnum ASC ) $$, _parent_table->>'table_name') INTO _parent_field_array;
		_parent_field_array := array_remove(_parent_field_array, 'id'); -- remove pkey from field list
		
		-- create command of update rule for parent fiels
		SELECT array_to_string(f, ', ') 
			FROM ( SELECT array_agg(f||' = NEW.'||f) AS f
			FROM unnest(_parent_field_array) AS f ) foo
			INTO _parent_field_list;
			
		-- init merged views (all children tables)
		_merge_view_cmd_1 := format('CREATE OR REPLACE VIEW %1$s AS SELECT %2$s ',
									_destination_schema||'.vw_'||(_parent_table->>'shortname')||'_merge',
									't0.id, t0.' || array_to_string(_parent_field_array, ', t0.')
								);
		_merge_view_cmd_2 := format(' FROM %s t0', (_parent_table->>'table_name')::regclass);
			
  		-- create view and triggers/rules for 1:1 joined view
  		FOREACH _child_table IN ARRAY _children_tables LOOP
			_count = _count + 1;
			RAISE NOTICE 'edit view for %', _child_table->>'shortname';	
  		
			-- define view name
			_view_rootname := 'vw_'||(_parent_table->>'shortname')||'_'||(_child_table->>'shortname');
			_view_name := _destination_schema||'.'||_view_rootname;
			_function_trigger := _destination_schema||'.ft_'||(_parent_table->>'shortname')||'_'||(_child_table->>'shortname')||'_insert';
  		
			-- get array of fields for child table
			EXECUTE format(	$$ SELECT ARRAY( SELECT attname FROM pg_attribute WHERE attrelid = %1$L::regclass AND attnum > 0 ORDER BY attnum ASC ) $$, _child_table->>'table_name') INTO _child_field_array;
			_child_field_array := array_remove(_child_field_array, 'id'); -- remove pkey from field list
  				
			-- view
			EXECUTE format(' 
				CREATE OR REPLACE VIEW %1$s AS
					SELECT %2$s, %3$s
				FROM %4$s t2 INNER JOIN %5$s t1 ON t1.id = t2.id;'
				, _view_name --1
				, 't1.id, t1.' || array_to_string(_parent_field_array, ', t1.') --2
				,        't2.' || array_to_string(_child_field_array,  ', t2.') --3
				, (_child_table->>'table_name')::regclass --4
				, (_parent_table->>'table_name')::regclass --5
			);
			
			-- update rule
			RAISE NOTICE '  update rule';
			SELECT array_to_string(f, ', ') -- create command of update rule for parent fiels
				FROM ( SELECT array_agg(f||' = NEW.'||f) AS f
				FROM unnest(_child_field_array)     AS f ) foo
				INTO _child_field_list;
			EXECUTE format('
				CREATE OR REPLACE RULE %1$I AS ON UPDATE TO %2$s DO INSTEAD
				(
				UPDATE %3$s SET %4$s WHERE id = NEW.id;
				UPDATE %5$s SET %6$s WHERE id = NEW.id;
				)',			
				_view_rootname||'_update', --1
				_view_name::regclass, --2
				(_parent_table->>'table_name')::regclass, --3
				_parent_field_list, --4
				(_child_table->>'table_name')::regclass, --5
				_child_field_list --6
			);
		
			-- delete rule
			RAISE NOTICE '  delete rule';
			EXECUTE format('
				CREATE OR REPLACE RULE %1$I AS ON UPDATE TO %2$s DO INSTEAD
				(
				DELETE FROM %3$s WHERE id = NEW.id;
				DELETE FROM %4$s WHERE id = NEW.id;
				)',			
				_view_rootname||'_delete', --1
				_view_name::regclass, --2
				(_parent_table->>'table_name')::regclass, --3
				(_child_table->>'table_name')::regclass --4
			);
		
			-- create trigger function
			RAISE NOTICE '  trigger function';
			EXECUTE format('
				CREATE OR REPLACE FUNCTION %1$I()
					RETURNS trigger AS
					$$
					BEGIN
						INSERT INTO %2$s (
							 id,
							 %3$s
						   )
						VALUES ( 
							nextval(''%4$s'')  --id
							, %5$s
						   )
						   RETURNING id INTO NEW.id;

						INSERT INTO %6$s (
							 id,
							 %7$s
						   )
						VALUES (
							NEW.id -- id
						   , %8$s
						   );
						RETURN NEW;
					END; 
					$$
					LANGUAGE plpgsql;',
			_function_trigger, --1
			(_parent_table->>'table_name')::regclass, --2
			array_to_string(_parent_field_array, ', '), --3
			(_parent_table->>'pkey_nextval')::regclass, --4
			'NEW.'||array_to_string(_parent_field_array, ', NEW.'), --5
			(_child_table->>'table_name')::regclass, --6
			array_to_string(_child_field_array, ', '), --7
			'NEW.'||array_to_string(_child_field_array, ', NEW.') --8
			);
		
			-- create trigger
			RAISE NOTICE '  trigger';
			EXECUTE format('
			CREATE TRIGGER %1$I
				  INSTEAD OF INSERT
				  ON %2$s
				  FOR EACH ROW
				  EXECUTE PROCEDURE %3$I();',
			_view_rootname||'_insert', --1
			_view_name::regclass, --2
			_function_trigger --3
			); 
			
			-- merge view (all children tables)
			_merge_view_cmd_1 := _merge_view_cmd_1 || ', t' || _count || '.' || array_to_string(_child_field_array, ', t'||_count||'.');
			_merge_view_cmd_2 := _merge_view_cmd_2 || format(' LEFT JOIN %1$s t%2$s ON t0.id=t%2$s.id ', (_child_table->>'table_name')::regclass, _count);
			
		END LOOP;
		
		-- execute merge view
		RAISE NOTICE '%', _merge_view_cmd_1 || _merge_view_cmd_2;
		EXECUTE( _merge_view_cmd_1 || _merge_view_cmd_2 );
	
	END;
$BODY$
LANGUAGE plpgsql;

