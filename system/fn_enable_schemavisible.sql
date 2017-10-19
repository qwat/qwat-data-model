/*
	qWat - QGIS Water Module

	SQL file :: function to add schema view capability to tables
*/


CREATE OR REPLACE FUNCTION qwat_sys.fn_enable_schemavisible(_table_name text, _vl_table text, _fk_field text)
	RETURNS VOID AS
$BODY$
	BEGIN
		/* Add columns */
		EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN schema_force_visible boolean default NULL;', _table_name);
		EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN _schema_visible boolean default NULL;',	_table_name);
		EXECUTE format('COMMENT ON COLUMN qwat_od.%1$I._schema_visible is ''define if the element is visible on schematic view. Update by trigger as COALESCE(schema_force_visible, %2$I.schema_visible)'';',
		  _table_name, _vl_table);

		/* Constraint */
		EXECUTE format('ALTER TABLE qwat_od.%1$I ADD CONSTRAINT %2$I FOREIGN KEY (schema_force_visible) REFERENCES qwat_vl.visible(vl_code) MATCH FULL;
						CREATE INDEX %3$I ON qwat_od.%1$I(schema_force_visible);',
							_table_name,
							_table_name||'_schema_force_visible',
							'fki_'||_table_name||'_schema_force_visible'
						);
		/* Trigger to update field */
		EXECUTE format('CREATE OR REPLACE FUNCTION qwat_od.ft_%1$I_schema_visible()
			RETURNS trigger AS
			$$
			BEGIN
			  IF NEW.schema_force_visible IS NOT NULL THEN
					NEW._schema_visible := NEW.schema_force_visible;
				ELSE
				  NEW._schema_visible := (SELECT schema_visible FROM qwat_vl.%2$I WHERE id = NEW.%3$I);
				END IF;
				RETURN NEW;
			END;
		  $$
			LANGUAGE plpgsql;',
				_table_name,
				_vl_table,
				_fk_field);

		EXECUTE format('CREATE TRIGGER tr_%1$I_schema_visible_update
						BEFORE UPDATE OF %2$I
						ON qwat_od.%1$I
						FOR EACH ROW
  					EXECUTE PROCEDURE qwat_od.ft_%1$I_schema_visible();',
				_table_name,
				_fk_field);

		EXECUTE format('CREATE TRIGGER tr_%1$I_schema_visible_insert
						BEFORE INSERT
						ON qwat_od.%1$I
						FOR EACH ROW
  					EXECUTE PROCEDURE qwat_od.ft_%1$I_schema_visible();',
				_table_name);
END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_sys.fn_enable_schemavisible(text,text,text) IS 'Add a column schema_force_visible used to overwrite the schema_view defined by the auxiliary table (pipe_function for instance). Add a column _schema_visible which determines if the element is visible in the schema (updated by trigger).';
