/*
	qWat - QGIS Water Module

	SQL file :: leak arcs
*/


/* CREATE TABLE */
CREATE TABLE qwat_od.leak (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.leak IS 'pipe leaks';

/* columns */
ALTER TABLE qwat_od.leak ADD COLUMN fk_cause          integer not null;
ALTER TABLE qwat_od.leak ADD COLUMN fk_pipe           integer;
ALTER TABLE qwat_od.leak ADD COLUMN widespread_damage boolean not null;
ALTER TABLE qwat_od.leak ADD COLUMN detection_date    date;
ALTER TABLE qwat_od.leak ADD COLUMN repair_date       date;
ALTER TABLE qwat_od.leak ADD COLUMN _repaired         boolean;
ALTER TABLE qwat_od.leak ADD COLUMN address           text ;
ALTER TABLE qwat_od.leak ADD COLUMN pipe_replaced     boolean;
ALTER TABLE qwat_od.leak ADD COLUMN description       text ;
ALTER TABLE qwat_od.leak ADD COLUMN repair            text ;

/* GEOMETRY */
ALTER TABLE qwat_od.leak ADD COLUMN geometry          geometry(Point,:SRID);
CREATE INDEX leak_geoidx ON qwat_od.leak USING GIST ( geometry );

/* LABELS */
DO $$ BEGIN PERFORM qwat_sys.fn_label_create_fields('leak'); END $$;

/* constraints */
ALTER TABLE qwat_od.leak ADD CONSTRAINT leak_fk_cause FOREIGN KEY (fk_cause) REFERENCES qwat_vl.leak_cause(id) MATCH FULL; CREATE INDEX fki_leak_fk_cause ON qwat_od.leak(fk_cause);
ALTER TABLE qwat_od.leak ADD CONSTRAINT leak_fk_pipe  FOREIGN KEY (fk_pipe)  REFERENCES qwat_od.pipe(id)       MATCH FULL; CREATE INDEX fki_leak_fk_pipe  ON qwat_od.leak(fk_pipe);

/* REPAIRED TRIGGER */
CREATE OR REPLACE FUNCTION qwat_od.ft_leak_repaired() RETURNS trigger AS
$BODY$
	BEGIN
		IF NEW.repair_date IS NULL THEN
			NEW._repaired := false;
		ELSE
			NEW._repaired := true;
		END IF;
		RETURN NEW;
	END;
$BODY$LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_leak_repaired() IS 'Fcn/Trigger: updates the repaired status of the leak.';

CREATE TRIGGER tr_leak_repaired
	BEFORE INSERT OR UPDATE OF repair_date ON qwat_od.leak
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_leak_repaired();
COMMENT ON TRIGGER tr_leak_repaired ON qwat_od.leak IS 'Trigger: updates the repaired status of the leak.';

/* LINKED PIPE TRIGGER */
CREATE OR REPLACE FUNCTION qwat_od.ft_leak_pipe() RETURNS trigger AS
$BODY$
	BEGIN
		IF NEW.fk_pipe IS NULL THEN
			NEW.fk_pipe := qwat_od.fn_pipe_get_id(NEW.geometry);
		END IF;
		RETURN NEW;
	END;
$BODY$LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_leak_pipe() IS 'Fcn/Trigger:get the pipe associated to the leak.';

CREATE TRIGGER tr_leak_pipe
	BEFORE INSERT ON qwat_od.leak --TODO whenever Layer Event Triggers are ready in QGIS, also do UPDATE with asking user to upate or not
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_leak_pipe();
COMMENT ON TRIGGER tr_leak_pipe ON qwat_od.leak IS 'Trigger: get the pipe associated to the leak.';


