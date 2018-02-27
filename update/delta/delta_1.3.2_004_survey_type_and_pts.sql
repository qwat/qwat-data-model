-- Remove obsolete comment

COMMENT ON TABLE qwat_od.surveypoint IS NULL;


-- add total station to survey_type, add translation to Chevillère

UPDATE qwat_vl.survey_type SET ( value_en, value_fr, value_ro ) = ('measuring tape', 'ruban métrique'     , 'ruletă') WHERE id = 9902;
INSERT INTO qwat_vl.survey_type (id, value_en, value_fr, value_ro ) VALUES (9903, 'total station', 'station totale'     , 'stație totală');


-- add fk_object_reference to survey points
ALTER TABLE qwat_od.surveypoint ADD COLUMN fk_object_reference integer NULL;
ALTER TABLE qwat_od.surveypoint ADD CONSTRAINT surveypoint_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference (id) MATCH FULL;


