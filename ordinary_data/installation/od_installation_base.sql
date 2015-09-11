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
CREATE OR REPLACE FUNCTION qwat_sys.fn_installation_view_create(_installation_name text, _fields text[]) RETURNS void AS
$BODY$
	DECLARE 
		main_fields text[] := ARRAY['name', 
								'identification',
								'fk_parent',
								'fk_status',
								'fk_distributor',
								'fk_remote',
								'fk_watertype',
								'fk_locationtype',
								'fk_precisionalti',
								'year',
								'year_end',
								'parcel',
								'eca',
								'altitude',
								'remark',
								'open_water_surface',
								'geometry',
								'geometry_alt1',
								'geometry_alt2',
								'_geometry_alt1_used',
								'_geometry_alt2_used',
								'geometry_polygon',
								'label_1_visible',
								'label_1_x',
								'label_1_y',
								'label_1_rotation',
								'label_1_text',
								'label_2_visible',
								'label_2_x',
								'label_2_y',
								'label_2_rotation',
								'label_2_text'];
								
		fieldlist1 text;
		fieldlist2 text;
	BEGIN
		-- create view
		EXECUTE format(' 
			CREATE OR REPLACE VIEW qwat_od.%1$I AS
				SELECT i.id, %2$s, %3$s
			FROM qwat_od.%4$I j INNER JOIN qwat_od.installation i ON j.id = i.id;'
			, 'vw_edit_'||_installation_name --1
			, 'i.' || array_to_string(main_fields, ', i.'::text) --2
			, 'j.' || array_to_string(_fields, ', j.'::text) --3
			, _installation_name --4
		);
			
		-- update rule
		SELECT array_to_string(f, ', ') 
			FROM ( SELECT array_agg(f||' = NEW.'||f) AS f
			FROM unnest(main_fields) AS f ) foo
			INTO fieldlist1;
		SELECT array_to_string(f, ', ') 
			FROM ( SELECT array_agg(f||' = NEW.'||f) AS f
			FROM unnest(_fields)     AS f ) foo
			INTO fieldlist2;
		EXECUTE format('
			CREATE OR REPLACE RULE %1$I AS ON UPDATE TO qwat_od.%2$I DO INSTEAD
			(
			UPDATE qwat_od.installation SET %3$s WHERE id = NEW.id;
			UPDATE qwat_od.%4$I         SET %5$s WHERE id = NEW.id;
			)',			
			'vw_edit_'||_installation_name||'_update', --1
			'vw_edit_'||_installation_name, --2
			fieldlist1, --3
			_installation_name, --4
			fieldlist2 --5
		);
		
		-- delete rule
		EXECUTE format('
			CREATE OR REPLACE RULE %1$I AS ON UPDATE TO qwat_od.%2$I DO INSTEAD
			(
			DELETE FROM qwat_od.%3$I         WHERE id = NEW.id;
			DELETE FROM qwat_od.installation WHERE id = NEW.id;
			)',			
			'vw_edit_'||_installation_name||'_delete', --1
			'vw_edit_'||_installation_name, --2
			_installation_name --3
		);
		
		-- create trigger function
		EXECUTE format('
			CREATE OR REPLACE FUNCTION qwat_od.%1$I()
				RETURNS trigger AS
				$$
				BEGIN
					INSERT INTO qwat_od.installation (
						 id,
						 %2$s
					   )
					VALUES ( 
						nextval(''qwat_od.installation_id_seq'')  --id
						, %3$s
					   )
					   RETURNING id INTO NEW.id;

					INSERT INTO qwat_od.%4$I (
						 id,
						 %5$s
					   )
					VALUES (
						NEW.id -- id
					   , %6$s
					   );
					RETURN NEW;
				END; 
				$$
				LANGUAGE plpgsql;',
		'ft_'||_installation_name||'_insert', --1
		array_to_string(main_fields, ', '), --2
		'NEW.'||array_to_string(main_fields, ', NEW.'), --3
		_installation_name, --4
		array_to_string(_fields, ', '), --5
		'NEW.'||array_to_string(_fields, ', NEW.') --6
		);
		
		-- create trigger
		EXECUTE format('
		CREATE TRIGGER %1$I
			  INSTEAD OF INSERT
			  ON qwat_od.%2$I
			  FOR EACH ROW
			  EXECUTE PROCEDURE qwat_od.%3$I();',
		'vw_edit_'||_installation_name||'_insert',
		'vw_edit_'||_installation_name,
		'ft_'||_installation_name||'_insert');
	
	
	
	
	END;
$BODY$
LANGUAGE plpgsql;

