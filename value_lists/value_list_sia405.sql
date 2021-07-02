/*
TODO : This should be defined directly in the corresponding vl_*.sql files.
Currently, we do it here until the matching stabilizes, so it can be pasted
from delta_1.3.6_add_vl_for_SIA_export.sql
*/

-- Populate columns

-- TODO : complete mapping
-- UPDATE qwat_vl.bedding SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.cistern SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.cover_type SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
UPDATE qwat_vl.hydrant_material SET sia405code = 'Metall' WHERE short_fr LIKE 'F %';

-- TODO : complete mapping
-- UPDATE qwat_vl.hydrant_model_inf SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.hydrant_model_sup SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.hydrant_output SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.hydrant_provider SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.leak_cause SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.locationtype SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.nominal_diameter SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.object_reference SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.overflow SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.part_type SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.pipe_function SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.pipe_installmethod SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
UPDATE qwat_vl.pipe_material SET sia405code = 'Stahl.unbekannt' WHERE short_fr = 'AC';
UPDATE qwat_vl.pipe_material SET sia405code = 'Kunststoff.Polyethylen.unbekannt' WHERE short_fr = 'PE';

-- TODO : complete mapping
-- UPDATE qwat_vl.pipe_protection SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.precisionalti SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
UPDATE qwat_vl.pressurecontrol_type SET sia405code = 'Schacht.Druckbrecher' WHERE value_en = 'reducer';
UPDATE qwat_vl.pressurecontrol_type SET sia405code = 'Schacht.Druckbrecher' WHERE value_en = 'pressure cut';
UPDATE qwat_vl.pressurecontrol_type SET sia405code = 'Schacht.unbekannt' WHERE value_en = 'gathering';

-- TODO : complete mapping
-- UPDATE qwat_vl.protectionzone_type SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.pump_operating SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.pump_type SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.remote_type SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.source_quality SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping

UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.Fluss_Seewasserfassung' WHERE value_fr = 'captage eau lac';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.Grundwasserfassung' WHERE value_fr = 'captage eau nappe';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.Quellfassung' WHERE value_fr = 'captage eau source';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.Fluss_Seewasserfassung' WHERE value_fr = 'captage eau rivière';

-- TODO : complete mapping
UPDATE qwat_vl.status SET sia405code = 'in_Betrieb' WHERE value_en = 'in use';
UPDATE qwat_vl.status SET sia405code = 'ausser_Betrieb' WHERE value_en = 'out of service';

-- TODO : complete mapping
-- UPDATE qwat_vl.subscriber_type SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.survey_type SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.tank_firestorage SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.valve_actuation SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.valve_function SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.valve_maintenance SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.valve_type SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.visible SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.watertype SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.worker_type SET sia405code = 'unbekannt' WHERE ???;
