/*
	qWat - QGIS Water Module

	SQL file :: installation tank
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.tank ();

/* specific to tanks */
ALTER TABLE qwat_od.tank ADD COLUMN id integer NOT NULL REFERENCES qwat_od.installation(id) PRIMARY KEY ;
ALTER TABLE qwat_od.tank ADD COLUMN fk_overflow          integer             ;
ALTER TABLE qwat_od.tank ADD COLUMN fk_firestorage       integer             ;
ALTER TABLE qwat_od.tank ADD COLUMN storage_total        numeric(10,1)       ; COMMENT ON COLUMN qwat_od.tank.storage_total  IS 'litres';
ALTER TABLE qwat_od.tank ADD COLUMN storage_supply       numeric(10,1)       ; COMMENT ON COLUMN qwat_od.tank.storage_supply IS 'litres';
ALTER TABLE qwat_od.tank ADD COLUMN storage_fire         numeric(10,1)       ; COMMENT ON COLUMN qwat_od.tank.storage_fire   IS 'litres';
ALTER TABLE qwat_od.tank ADD COLUMN altitude_overflow    numeric(7,3)        ;
ALTER TABLE qwat_od.tank ADD COLUMN altitude_apron       numeric(7,3)        ;
ALTER TABLE qwat_od.tank ADD COLUMN height_max           numeric(7,3)        ;
ALTER TABLE qwat_od.tank ADD COLUMN fire_valve           boolean default NULL;
ALTER TABLE qwat_od.tank ADD COLUMN fire_remote          boolean default NULL;
ALTER TABLE qwat_od.tank ADD COLUMN _litrepercm          numeric(9,3)        ;

ALTER TABLE qwat_od.tank ADD COLUMN cistern1_fk_type     integer      ;
ALTER TABLE qwat_od.tank ADD COLUMN cistern1_dimension_1 numeric(10,2);
ALTER TABLE qwat_od.tank ADD COLUMN cistern1_dimension_2 numeric(10,2);
ALTER TABLE qwat_od.tank ADD COLUMN cistern1_storage     numeric(10,2);
ALTER TABLE qwat_od.tank ADD COLUMN _cistern1_litrepercm numeric(9,3) ;
ALTER TABLE qwat_od.tank ADD COLUMN cistern2_fk_type     integer      ;
ALTER TABLE qwat_od.tank ADD COLUMN cistern2_dimension_1 numeric(10,2);
ALTER TABLE qwat_od.tank ADD COLUMN cistern2_dimension_2 numeric(10,2);
ALTER TABLE qwat_od.tank ADD COLUMN cistern2_storage     numeric(10,2);
ALTER TABLE qwat_od.tank ADD COLUMN _cistern2_litrepercm numeric(9,3) ;

/* Constraints */
ALTER TABLE qwat_od.tank ADD CONSTRAINT tank_fk_overflow     FOREIGN KEY (fk_overflow)      REFERENCES qwat_vl.overflow(id)              MATCH FULL; CREATE INDEX fki_tank_fk_overflow     ON qwat_od.tank(fk_overflow)     ;
ALTER TABLE qwat_od.tank ADD CONSTRAINT tank_fk_firestorage  FOREIGN KEY (fk_firestorage)   REFERENCES qwat_vl.tank_firestorage(id)      MATCH FULL; CREATE INDEX fki_tank_fk_firestorage  ON qwat_od.tank(fk_firestorage)  ;
ALTER TABLE qwat_od.tank ADD CONSTRAINT tank_cistern1type    FOREIGN KEY (cistern1_fk_type) REFERENCES qwat_vl.cistern(id)               MATCH FULL; CREATE INDEX fki_tank_cistern1type    ON qwat_od.tank(cistern1_fk_type);
ALTER TABLE qwat_od.tank ADD CONSTRAINT tank_cistern2type    FOREIGN KEY (cistern2_fk_type) REFERENCES qwat_vl.cistern(id)               MATCH FULL; CREATE INDEX fki_tank_cistern2type    ON qwat_od.tank(cistern2_fk_type);


/* Function */
CREATE OR REPLACE FUNCTION qwat_od.fn_litres_per_cm(fk_type integer,dim1 double precision, dim2 double precision) RETURNS double precision AS
$BODY$
	BEGIN
		IF fk_type = 1 THEN
			return pi()*(dim1/2)^2*10;
		ELSEIF fk_type = 2 THEN
			return dim2*dim2*10;
		ELSE
			return NULL;
		END IF;
	END
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_litres_per_cm(integer, double precision, double precision) IS 'Calculate the litres_per_cm of a tank cistern.';

/* Triggers */
CREATE OR REPLACE FUNCTION qwat_od.ft_tank() RETURNS trigger AS
$BODY$
	BEGIN
		NEW._cistern1_litrepercm := qwat_od.fn_litres_per_cm(NEW.cistern1_fk_type,NEW.cistern1_dimension_1,NEW.cistern1_dimension_2);
		NEW._cistern2_litrepercm := qwat_od.fn_litres_per_cm(NEW.cistern2_fk_type,NEW.cistern2_dimension_1,NEW.cistern2_dimension_2);
		NEW._litrepercm := COALESCE(NEW._cistern1_litrepercm,0)+COALESCE(NEW._cistern2_litrepercm,0);
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER tr_tank
	BEFORE INSERT OR UPDATE OF cistern1_fk_type,cistern1_dimension_1,cistern1_dimension_2,
							   cistern2_fk_type,cistern2_dimension_1,cistern2_dimension_2
	ON qwat_od.tank
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_tank();



