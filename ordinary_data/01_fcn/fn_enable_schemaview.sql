/*
	qWat - QGIS Water Module
	
	SQL file :: function to add schema view capability to tables
*/


CREATE OR REPLACE FUNCTION qwat_od.fn_enable_schemaview(_table_name text)
	RETURNS VOID AS 
$BODY$
	BEGIN
		/* Add columns */
		EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN schema_force_view boolean default NULL;',
						_table_name);
		/* Constraint */
		EXECUTE format('ALTER TABLE qwat_od.%1$I ADD CONSTRAINT %2$I FOREIGN KEY (schema_force_view) REFERENCES qwat_vl.visible(vl_code) MATCH FULL;
						CREATE INDEX %3$I ON qwat_od.%1$I(schema_force_view);',
							_table_name, 
							_table_name||'_schema_force_view',
							'fki_'||_table_name||'_schema_force_view'
						);
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_enable_schemaview(text) IS 'Add a column schema_force_view used to overwrite the schema_view defined by the auxiliary table (pipe_function for instance).';	

