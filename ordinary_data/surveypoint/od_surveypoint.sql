/*
	qWat - QGIS Water Module

	SQL file :: samplingpoint table
*/


/* create */
CREATE TABLE qwat_od.surveypoint ();
COMMENT ON TABLE qwat_od.surveypoint IS 'Table for sampling points. Inherits from surveypoint.';

ALTER TABLE qwat_od.surveypoint ADD COLUMN id integer NOT NULL REFERENCES qwat_od.surveypoint(id) PRIMARY KEY;
ALTER TABLE qwat_od.surveypoint ADD COLUMN fk_survey_type   integer not null;
ALTER TABLE qwat_od.surveypoint ADD COLUMN fk_worker        integer;
ALTER TABLE qwat_od.surveypoint ADD COLUMN code             varchar(50);
ALTER TABLE qwat_od.surveypoint ADD COLUMN description      text;
ALTER TABLE qwat_od.surveypoint ADD COLUMN date             date;
ALTER TABLE qwat_od.surveypoint ADD COLUMN fk_folder           integer ;
ALTER TABLE qwat_od.surveypoint ADD COLUMN altitude         double precision;
ALTER TABLE qwat_od.surveypoint ADD COLUMN geometry         geometry(POINTZ,:SRID);


/* constraints */
ALTER TABLE qwat_od.surveypoint ADD CONSTRAINT surveypoint_fk_type   FOREIGN KEY (fk_survey_type) REFERENCES qwat_vl.survey_type(id) MATCH FULL; CREATE INDEX fki_surveypoint_fk_type   ON qwat_od.surveypoint(fk_survey_type);
ALTER TABLE qwat_od.surveypoint ADD CONSTRAINT surveypoint_fk_worker FOREIGN KEY (fk_worker)      REFERENCES qwat_od.worker(id)      MATCH FULL; CREATE INDEX fki_surveypoint_fk_worker ON qwat_od.surveypoint(fk_worker);
ALTER TABLE qwat_od.surveypoint ADD CONSTRAINT surveypoint_fk_folder FOREIGN KEY (fk_folder)      REFERENCES qwat_od.folder(id)      MATCH FULL; CREATE INDEX fki_surveypoint_fk_folder ON qwat_od.surveypoint(fk_folder);


/* Altitude triggers */
CREATE OR REPLACE FUNCTION qwat_od.ft_surveypoint_altitude() RETURNS TRIGGER AS
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

CREATE TRIGGER surveypoint_altitude_update_trigger
	BEFORE UPDATE OF altitude, geometry ON qwat_od.surveypoint
	FOR EACH ROW
	WHEN (NEW.altitude <> OLD.altitude OR ST_Z(NEW.geometry) <> ST_Z(OLD.geometry))
	EXECUTE PROCEDURE qwat_od.ft_surveypoint_altitude();
COMMENT ON TRIGGER surveypoint_altitude_update_trigger ON qwat_od.surveypoint IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';

CREATE TRIGGER surveypoint_altitude_insert_trigger
	BEFORE INSERT ON qwat_od.surveypoint
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_surveypoint_altitude();
COMMENT ON TRIGGER surveypoint_altitude_insert_trigger ON qwat_od.surveypoint IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';
