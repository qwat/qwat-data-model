/*
	qWat - QGIS Water Module
	
	SQL file :: samplingpoint table
*/


/* create */
CREATE TABLE qwat_od.surveypoint ();
COMMENT ON TABLE qwat_od.surveypoint IS 'Table for sampling points. Inherits from node.';

ALTER TABLE qwat_od.surveypoint ADD COLUMN id integer NOT NULL REFERENCES qwat_od.node(id) PRIMARY KEY;
ALTER TABLE qwat_od.surveypoint ADD COLUMN fk_survey_type   integer not null;
ALTER TABLE qwat_od.surveypoint ADD COLUMN fk_worker        integer;
ALTER TABLE qwat_od.surveypoint ADD COLUMN code             varchar(50);
ALTER TABLE qwat_od.surveypoint ADD COLUMN date             date;


/* constraints */
ALTER TABLE qwat_od.surveypoint ADD CONSTRAINT surveypoint_fk_type   FOREIGN KEY (fk_survey_type) REFERENCES qwat_vl.survey_type(id) MATCH FULL; CREATE INDEX fki_surveypoint_fk_type   ON qwat_od.surveypoint(fk_survey_type);
ALTER TABLE qwat_od.surveypoint ADD CONSTRAINT surveypoint_fk_worker FOREIGN KEY (fk_worker)      REFERENCES qwat_od.worker(id)      MATCH FULL; CREATE INDEX fki_surveypoint_fk_worker ON qwat_od.surveypoint(fk_worker);








 
