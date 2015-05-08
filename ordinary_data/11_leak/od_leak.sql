/*
	qWat - QGIS Water Module
	
	SQL file :: leak arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.leak CASCADE;
CREATE TABLE qwat_od.leak (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.leak IS 'pipe leaks';

/* columns */
ALTER TABLE qwat_od.leak ADD COLUMN fk_type        integer not null;
ALTER TABLE qwat_od.leak ADD COLUMN fk_cause       integer;
ALTER TABLE qwat_od.leak ADD COLUMN fk_damage      integer not null;
ALTER TABLE qwat_od.leak ADD COLUMN detection_date date;
ALTER TABLE qwat_od.leak ADD COLUMN repair_date    date;
ALTER TABLE qwat_od.leak ADD COLUMN _repaired      boolean;
ALTER TABLE qwat_od.leak ADD COLUMN address        text default '';
ALTER TABLE qwat_od.leak ADD COLUMN pipe_replaced  boolean;
ALTER TABLE qwat_od.leak ADD COLUMN description    text default '';
ALTER TABLE qwat_od.leak ADD COLUMN repair         text default '';

/* geometry */
SELECT qwat_od.fn_geom_tool_point('leak', false, false, false, true, true, true);

/* LABELS */
SELECT qwat_od.fn_label_create_fields('leak');

/* constraints */
ALTER TABLE qwat_od.leak ADD CONSTRAINT leak_fk_type   FOREIGN KEY (fk_type)   REFERENCES qwat_vl.leak_type(id)   MATCH FULL;   CREATE INDEX fki_leak_fk_type   ON qwat_od.leak(fk_type)  ;
ALTER TABLE qwat_od.leak ADD CONSTRAINT leak_fk_cause  FOREIGN KEY (fk_cause)  REFERENCES qwat_vl.leak_cause(id)  MATCH SIMPLE; CREATE INDEX fki_leak_fk_cause  ON qwat_od.leak(fk_cause) ;
ALTER TABLE qwat_od.leak ADD CONSTRAINT leak_fk_damage FOREIGN KEY (fk_damage) REFERENCES qwat_vl.leak_damage(id) MATCH FULL;   CREATE INDEX fki_leak_fk_damage ON qwat_od.leak(fk_damage);

/* Trigger */
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


