/*
	qWat - QGIS Water Module
	
	SQL file :: node
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.node (id serial PRIMARY KEY);

COMMENT ON TABLE qwat_od.node IS 'Nodes. Type:If three pipe or more arrives at the node: three. If one pipe: one. If two: depends on characteristics of pipe: two_same (everything same), two_year (year is different), two_material (and year is/are different), two_diameter (and material/year are different). Orientation is calculated if two pipe arrives to place the symbol in theright direction.';

/* columns */
ALTER TABLE qwat_od.node ADD COLUMN fk_precisionalti integer                  ;
ALTER TABLE qwat_od.node ADD COLUMN altitude         decimal(10,3)            ;
ALTER TABLE qwat_od.node ADD COLUMN _type            varchar(40) default null ;
ALTER TABLE qwat_od.node ADD COLUMN _orientation     float       default 0    ;
ALTER TABLE qwat_od.node ADD COLUMN _schema_visible  boolean     default false;
ALTER TABLE qwat_od.node ADD COLUMN _status_active   boolean     default false;
-- ALTER TABLE qwat_od.node ADD COLUMN _under_object    boolean     default false;

/* geometry */
ALTER TABLE qwat_od.node ADD COLUMN geometry geometry('POINTZ',:SRID);
CREATE INDEX node_geoidx ON qwat_od.node USING GIST ( geometry );

/* constraints */
ALTER TABLE qwat_od.node ADD CONSTRAINT node_fk_precisionalti FOREIGN KEY (fk_precisionalti) REFERENCES qwat_vl.precisionalti(id) MATCH FULL; CREATE INDEX fki_node_fk_precisionalti ON qwat_od.node(fk_precisionalti);


/* Altitude triggers */
CREATE OR REPLACE FUNCTION qwat_od.ft_node_altitude() RETURNS TRIGGER AS
	$BODY$
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF TG_OP = 'INSERT' THEN
			IF NEW.altitude IS NULL THEN
				NEW.altitude := ST_Z(NEW.geometry);
			END IF;
			IF ST_Z(NEW.geometry) IS NULL THEN
				NEW.geometry := ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), altitude );
			END IF;
		ELSIF TG_OP = 'UPDATE' THEN
			IF NEW.altitue <> OLD.altitude THEN
				NEW.geometry := ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), altitude );
			ELSIF ST_Z(NEW.geometry) <> ST_Z(OLD.geometry) THEN
				NEW.altitude := ST_Z(NEW.geometry);
			END IF;
		END IF;
		RETURN NEW;
	END;
	$BODY$
	LANGUAGE plpgsql;
	
CREATE TRIGGER node_altitude_update_trigger
	BEFORE UPDATE OF altitude, geometry ON qwat_od.node
	FOR EACH ROW
	WHEN (NEW.altitude <> OLD.altitude OR ST_Z(NEW.geometry) <> ST_Z(OLD.geometry))
	EXECUTE PROCEDURE qwat_od.ft_node_altitude();
COMMENT ON TRIGGER %1$I ON qwat_od.node_altitude_update_trigger IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';

CREATE TRIGGER node_altitude_insert_trigger
	BEFORE INSERT ON qwat_od.node
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_node_altitude();
COMMENT ON TRIGGER node_altitude_insert_trigger ON qwat_od.node_altitude_insert_trigger IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';



