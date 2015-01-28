/*
	qWat - QGIS Water Module
	
	SQL file :: function to add schema view capability to tables
*/


CREATE OR REPLACE FUNCTION qwat_od.fn_enable_schemaview(
		_table_name text, 
		_auxiliary varchar,
		_keyfield varchar)
	RETURNS VOID AS 
$BODY$
	BEGIN
		/* Add columns */
		EXECUTE format('ALTER TABLE qwat_od.%I 
							ADD COLUMN schema_force_view boolean default NULL,
							ADD COLUMN _schema_visible boolean default NULL;',
						_table_name);
		/* Constraint */
		EXECUTE format('ALTER TABLE qwat_od.%1$I ADD CONSTRAINT %2$I FOREIGN KEY (schema_force_view) REFERENCES qwat_vl.visible(vl_code) MATCH FULL;
						CREATE INDEX %3$I ON qwat_od.%1$I(schema_force_view);', 
						_table_name, _table_name||'_schema_force_view', 'fki_'||_table_name||'_schema_force_view');
		
		/* trigger */
		EXECUTE format('CREATE OR REPLACE FUNCTION qwat_od.%1$I() RETURNS trigger AS
		$func$
			DECLARE
				visibility boolean;
			BEGIN
				IF NEW.schema_force_view IS NULL THEN
					SELECT schema_visible FROM qwat_vl.%2$I WHERE id = NEW.%3$I INTO visibility;
				ELSE 
					visibility := NEW.schema_force_view;
				END IF;
				NEW._schema_visible := visibility;
				RETURN NEW;
			END;
		$func$ LANGUAGE plpgsql;
		
		CREATE TRIGGER %4$I
			BEFORE INSERT OR UPDATE OF schema_force_view,%3$I ON qwat_od.%5$I
			FOR EACH ROW EXECUTE PROCEDURE qwat_od.%1$I();
		COMMENT ON TRIGGER %4$I ON qwat_od.%5$I IS ''Schema view depends on pipe function and on manual changes.'';',
		_table_name||'_schemaview', _auxiliary, _keyfield, 'tr_'||_table_name||'_schemaview', _table_name);
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_enable_schemaview(text,varchar,varchar) IS 'Add a column schema_force_view and _schema_visible in given table. _schema_visible is a boolean determined by the corresponding auxiliary table and might be overriden by _schema_force_view.';	

