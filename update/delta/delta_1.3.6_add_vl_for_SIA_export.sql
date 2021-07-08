/*
This adds corresponding sia405 values for interlis import/export.
*/

-- Add columns

ALTER TABLE qwat_vl.value_list_base ADD COLUMN sia405code TEXT;


-- Populate columns

-- TODO : complete mapping
-- UPDATE qwat_vl.bedding SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.cistern SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.cover_type SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
UPDATE qwat_vl.hydrant_material SET sia405code = 'Metall' WHERE short_fr LIKE 'F %';
UPDATE qwat_vl.hydrant_material SET sia405code = 'unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.hydrant_material SET sia405code = 'unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.hydrant_material SET sia405code = 'unbekannt' WHERE value_fr = 'à déterminer';

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

-- TODO : check mapping
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'Autre';
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'Inconnu';
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'À déterminer';
UPDATE qwat_vl.precision SET sia405code = 'ungenau' WHERE value_fr = 'Imprécis';
UPDATE qwat_vl.precision SET sia405code = 'genau' WHERE value_fr = 'Précis';
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'Localisé';
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'Digitalisé';

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

-- TODO : check mapping
UPDATE qwat_vl.status SET sia405code = 'unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.status SET sia405code = 'weitere' WHERE value_fr = 'fictif';
UPDATE qwat_vl.status SET sia405code = 'ausser_Betrieb' WHERE value_fr = 'désaffecté';
UPDATE qwat_vl.status SET sia405code = 'ausser_Betrieb' WHERE value_fr = 'abandonné';
UPDATE qwat_vl.status SET sia405code = 'ausser_Betrieb' WHERE value_fr = 'hors service';
UPDATE qwat_vl.status SET sia405code = 'in_Betrieb' WHERE value_fr = 'en service';
UPDATE qwat_vl.status SET sia405code = 'tot' WHERE value_fr = 'détruit';
UPDATE qwat_vl.status SET sia405code = 'unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.status SET sia405code = 'weitere' WHERE value_fr = 'autre';
UPDATE qwat_vl.status SET sia405code = 'weitere.geplant' WHERE value_fr = 'projet planifie';
UPDATE qwat_vl.status SET sia405code = 'weitere.Projekt' WHERE value_fr = 'projet en execution';

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
