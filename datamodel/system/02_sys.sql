------ LAST MODIFIED -----
CREATE FUNCTION qwat_sys.update_last_modified() RETURNS trigger AS $$
BEGIN
 NEW.last_modification := TIMEOFDAY();

 RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE FUNCTION qwat_sys.update_last_modified_parent() RETURNS trigger AS $$
DECLARE
 table_name TEXT;
BEGIN
 table_name = TG_ARGV[0];

 EXECUTE '
 UPDATE ' || table_name || '
 SET last_modification = TIMEOFDAY()::timestamp
 WHERE obj_id = ''' || NEW.obj_id || '''
';
 RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;
