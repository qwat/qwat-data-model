/*
This creates a field _schema_visible which determines if
an element is visible in schematic view.
It is calculated by COALESCE(schema_force_visible, value_list.schema_visible).
This allows direct use of this field in QGIS for rule-based labeling and
fixes performance issues if calculation is done on client side.

* schema_visible field is dropped on network_element as it is not used (was introduced for valves at the origin)
* _schema_visible and schema_force_visible are added to pipe and valve tables by the qwat_sys.fn_enable_schemavisible function
* old function qwat_sys.fn_enable_schemaview is enhanced and renamed
*/
BEGIN;

ALTER TABLE qwat_od.network_element DROP COLUMN schema_force_visible;

DROP FUNCTION qwat_sys.fn_enable_schemaview(text);

ALTER TABLE qwat_od.pipe RENAME COLUMN schema_force_visible TO schema_force_visible_old;
ALTER TABLE qwat_od.pipe DROP CONSTRAINT pipe_schema_force_visible;
DROP INDEX qwat_od.fki_pipe_schema_force_visible;
ALTER TABLE qwat_od.valve RENAME COLUMN schema_force_visible TO schema_force_visible_old;
ALTER TABLE qwat_od.valve DROP CONSTRAINT valve_schema_force_visible;
DROP INDEX qwat_od.fki_valve_schema_force_visible;

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

		EXECUTE format('CREATE TRIGGER tr_%1$I_schema_view_update
						BEFORE UPDATE OF %2$I
						ON qwat_od.%1$I
						FOR EACH ROW
  					EXECUTE PROCEDURE qwat_od.ft_%1$I_schema_visible();',
				_table_name,
				_fk_field);

		EXECUTE format('CREATE TRIGGER tr_%1$I_schema_view_insert
						BEFORE INSERT
						ON qwat_od.%1$I
						FOR EACH ROW
  					EXECUTE PROCEDURE qwat_od.ft_%1$I_schema_visible();',
				_table_name);
END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_sys.fn_enable_schemavisible(text,text,text) IS 'Add a column schema_force_visible used to overwrite the schema_view defined by the auxiliary table (pipe_function for instance). Add a column _schema_visible which determines if the element is visible in the schema (updated by trigger).';


DO $$ BEGIN PERFORM qwat_sys.fn_enable_schemavisible('valve', 'valve_function', 'fk_valve_function'); END $$;
DO $$ BEGIN PERFORM qwat_sys.fn_enable_schemavisible('pipe', 'pipe_function', 'fk_function'); END $$;

UPDATE qwat_od.pipe SET schema_force_visible = schema_force_visible_old;
UPDATE qwat_od.valve SET schema_force_visible = schema_force_visible_old;

ALTER TABLE qwat_od.pipe DROP COLUMN schema_force_visible_old;
ALTER TABLE qwat_od.valve DROP COLUMN schema_force_visible_old;


COMMIT;
