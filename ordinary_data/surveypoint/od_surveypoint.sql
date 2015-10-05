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
ALTER TABLE qwat_od.surveypoint ADD COLUMN fk_folder        integer ;
ALTER TABLE qwat_od.surveypoint ADD COLUMN altitude         decimal(10,3) default null;
SELECT AddGeometryColumn ('qwat_od','surveypoint','geometry',:SRID,'POINT',3, false); --TODO switch back to type mod whenever QGIS is ready
                                                                                      -- see http://postgis.net/docs/AddGeometryColumn.html and https://hub.qgis.org/issues/12010
                                                                                      -- ALTER TABLE qwat_od.node ADD COLUMN geometry geometry('POINTZ',:SRID);
-- TODO add fk_object_reference

/* constraints */
ALTER TABLE qwat_od.surveypoint ADD CONSTRAINT surveypoint_fk_type   FOREIGN KEY (fk_survey_type) REFERENCES qwat_vl.survey_type(id) MATCH FULL; CREATE INDEX fki_surveypoint_fk_type   ON qwat_od.surveypoint(fk_survey_type);
ALTER TABLE qwat_od.surveypoint ADD CONSTRAINT surveypoint_fk_worker FOREIGN KEY (fk_worker)      REFERENCES qwat_od.worker(id)      MATCH FULL; CREATE INDEX fki_surveypoint_fk_worker ON qwat_od.surveypoint(fk_worker);
ALTER TABLE qwat_od.surveypoint ADD CONSTRAINT surveypoint_fk_folder FOREIGN KEY (fk_folder)      REFERENCES qwat_od.folder(id)      MATCH FULL; CREATE INDEX fki_surveypoint_fk_folder ON qwat_od.surveypoint(fk_folder);


/* Altitude triggers */
CREATE OR REPLACE FUNCTION qwat_od.ft_surveypoint_altitude() RETURNS TRIGGER AS
$BODY$
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF NEW.altitude IS NULL THEN
			NEW.altitude := NULLIF( ST_Z(NEW.geometry), 0.0); -- 0 is the NULL value
		END IF;
		IF 	NEW.altitude IS NULL     AND ST_Z(NEW.geometry) <> 0.0 			OR
			NEW.altitude IS NOT NULL AND ST_Z(NEW.geometry) <> NEW.altitude THEN
				NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), COALESCE(NEW.altitude,0) ), ST_SRID(NEW.geometry) );
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
