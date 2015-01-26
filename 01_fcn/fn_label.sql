

/*        
Creates the fields and constraints for customization of labels.
*/
CREATE OR REPLACE FUNCTION qwat_od.fn_label_create_fields(table_name varchar, coordinates boolean = true, rotation boolean = true) RETURNS void AS
$BODY$
	BEGIN
		/* Creates columns */
		EXECUTE 'ALTER TABLE qwat_od.'||table_name||' ADD COLUMN label_1_visible  smallint default 1;           ';
		IF coordinates IS TRUE THEN
			EXECUTE 'ALTER TABLE qwat_od.'||table_name||' ADD COLUMN label_1_x        double precision default null;';
			EXECUTE 'ALTER TABLE qwat_od.'||table_name||' ADD COLUMN label_1_y        double precision default null;';
		END IF;
		IF rotation IS TRUE THEN
			EXECUTE 'ALTER TABLE qwat_od.'||table_name||' ADD COLUMN label_1_rotation double precision default null;';
		END IF;
		EXECUTE 'ALTER TABLE qwat_od.'||table_name||' ADD COLUMN label_1_text     varchar(120);';
		
		EXECUTE 'ALTER TABLE qwat_od.'||table_name||' ADD COLUMN label_2_visible  smallint default 1;           ';
		IF coordinates IS TRUE THEN
			EXECUTE 'ALTER TABLE qwat_od.'||table_name||' ADD COLUMN label_2_x        double precision default null;';
			EXECUTE 'ALTER TABLE qwat_od.'||table_name||' ADD COLUMN label_2_y        double precision default null;';
		END IF;
		IF rotation IS TRUE THEN
			EXECUTE 'ALTER TABLE qwat_od.'||table_name||' ADD COLUMN label_2_rotation double precision default null;';
		END IF;

		EXECUTE 'ALTER TABLE qwat_od.'||table_name||' ADD COLUMN label_2_text     varchar(120);';
		/* Creates constraints */
		EXECUTE 'ALTER TABLE qwat_od.'||table_name||' ADD CONSTRAINT '||table_name||'_label_1_visible FOREIGN KEY (label_1_visible) REFERENCES qwat_vl.visible(vl_code_int) MATCH FULL; CREATE INDEX fki_'||table_name||'_label_1_visible  ON qwat_od.'||table_name||'(label_1_visible);';
		EXECUTE 'ALTER TABLE qwat_od.'||table_name||' ADD CONSTRAINT '||table_name||'_label_2_visible FOREIGN KEY (label_2_visible) REFERENCES qwat_vl.visible(vl_code_int) MATCH FULL; CREATE INDEX fki_'||table_name||'_label_2_visible  ON qwat_od.'||table_name||'(label_2_visible);';
	END;
$BODY$
LANGUAGE 'plpgsql';
COMMENT ON FUNCTION qwat_od.fn_label_create_fields(varchar, boolean, boolean) IS 'Creates the fields and constraints for customization of labels.';

