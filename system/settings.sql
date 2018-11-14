
/*
 creates a table to save settings for QWAT
 constraints can apply on the value of the setting
 function qwat_sys.fn_setting_XXXX() is automatically created to quickly access the setting 
*/


CREATE TABLE qwat_sys.settings
(
   id serial PRIMARY KEY,
   name varchar(30),
   type regtype,
   value text,
   v_min double precision,
   v_max double precision,
   v_not_null boolean default true,
   description text,
   CONSTRAINT setting_unique UNIQUE(name),
   CONSTRAINT setting_type CHECK (type IN ('boolean'::regtype, 'integer'::regtype, 'double precision'::regtype, 'text'::regtype))
);

/* constraint to check value */

ALTER TABLE qwat_sys.settings
  ADD CONSTRAINT check_value
  CHECK (
		case when type in ('integer'::regtype,'double precision'::regtype) then
			case when v_max is not null and v_min is not null then
				value::double precision <= v_max and value::double precision >= v_min
			when v_max is not null then
				value::double precision <= v_max 
			when v_min is not null then
				value::double precision >= v_min
			else
				true
			end
		else
			true
		end
	and
		case when v_not_null then
			value is not null
		else
			true
		end
	);

/* trigger to create get function for quick access to the setting */

CREATE OR REPLACE FUNCTION qwat_sys.ft_setting_create_fn_get() RETURNS TRIGGER AS
	$BODY$
	BEGIN
		IF TG_OP <> 'INSERT' THEN
			EXECUTE format($$DROP FUNCTION IF EXISTS qwat_sys.fn_setting_%1$I();$$, OLD.name);
		END IF;
		IF TG_OP <> 'DELETE' THEN
			EXECUTE format($$
				CREATE FUNCTION qwat_sys.fn_setting_%1$I() RETURNS %2$s AS
					'SELECT value::%2$s from qwat_sys.settings where name = ''%1$I''' language sql
			$$, NEW.name, NEW.type::regtype );
		END	IF;
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE plpgsql;

	
	
	
CREATE TRIGGER tr_setting_create_fn_get_insert
	BEFORE INSERT OR DELETE ON qwat_sys.settings
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_sys.ft_setting_create_fn_get();
COMMENT ON TRIGGER tr_setting_create_fn_get_insert ON qwat_sys.settings IS 'Trigger: automatically create get function for inserted settings';

CREATE TRIGGER tr_setting_create_fn_get_update
	BEFORE UPDATE OF type, name ON qwat_sys.settings
	FOR EACH ROW
	WHEN ( NEW.type <> OLD.type OR  OLD.name <> NEW.name)
	EXECUTE PROCEDURE qwat_sys.ft_setting_create_fn_get();
COMMENT ON TRIGGER tr_setting_create_fn_get_update ON qwat_sys.settings IS 'Trigger: automatically create get function for inserted settings';

