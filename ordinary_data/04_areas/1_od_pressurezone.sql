/*
	qWat - QGIS Water Module
	
	SQL file :: pressure zones
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.pressurezone CASCADE;
CREATE TABLE qwat_od.pressurezone (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.pressurezone IS 'Pressure zones.';

/* COLUMNS */
ALTER TABLE qwat_od.pressurezone ADD COLUMN fk_distributor  integer not null;
ALTER TABLE qwat_od.pressurezone ADD COLUMN name            varchar(50) default '';
ALTER TABLE qwat_od.pressurezone ADD COLUMN consumptionzone varchar(50) default '';
ALTER TABLE qwat_od.pressurezone ADD COLUMN colorcode       smallint;

/* GEOMETRY */
SELECT AddGeometryColumn('qwat_od', 'pressurezone', 'geometry', 21781, 'MULTIPOLYGON', 2);
CREATE INDEX pressurezone_geoidx ON qwat_od.pressurezone USING GIST ( geometry );

/* LABELS */
SELECT qwat_od.fn_label_create_fields('pressurezone'); 

/* CONSTRAINT */
ALTER TABLE qwat_od.pressurezone ADD CONSTRAINT pressurezone_name UNIQUE (name);
ALTER TABLE qwat_od.pressurezone ADD CONSTRAINT pressurezone_fk_distributor FOREIGN KEY (fk_distributor) REFERENCES qwat_od.distributor(id) MATCH FULL; CREATE INDEX fki_pressurezone_fk_distributor ON qwat_od.pressurezone(fk_distributor) ;
            
      
/* TRIGGER FOR CONSUMPTION ZONE */
CREATE OR REPLACE FUNCTION qwat_od.ft_pressurezone_consumptionzone() RETURNS TRIGGER AS
$BODY$
	BEGIN
		IF NEW.consumptionzone = '' OR NEW.consumptionzone IS NULL THEN
			NEW.consumptionzone := NEW.name;
		END IF;
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER tr_pressurezone
	BEFORE INSERT OR UPDATE ON qwat_od.pressurezone 
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_pressurezone_consumptionzone();
