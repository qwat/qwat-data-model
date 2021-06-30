/*
This adds corresponding sia405 values for interlis import/export.
*/

-- Add columns

ALTER TABLE qwat_vl.bedding ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.cistern ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.cover_type ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.hydrant_material ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.hydrant_model_inf ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.hydrant_model_sup ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.hydrant_output ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.hydrant_provider ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.leak_cause ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.locationtype ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.nominal_diameter ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.object_reference ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.overflow ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.part_type ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.pipe_function ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.pipe_installmethod ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.pipe_material ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.pipe_protection ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.precision ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.precisionalti ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.pressurecontrol_type ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.protectionzone_type ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.pump_operating ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.pump_type ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.remote_type ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.source_quality ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.source_type ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.status ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.subscriber_type ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.survey_type ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.tank_firestorage ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.value_list_base ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.valve_actuation ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.valve_function ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.valve_maintenance ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.valve_type ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.visible ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.watertype ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';
ALTER TABLE qwat_vl.worker_type ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';


-- Populate columns

-- TODO : complete this !!!
-- TODO : sync this with value_list_sia405.sql

UPDATE qwat_vl.pipe_material SET sia405_de = CASE
    WHEN short_fr = 'AC' THEN 'Stahl'
    WHEN short_fr = 'PE' THEN 'Polyethylen'
    ELSE 'unbekannt'
END;

UPDATE qwat_vl.status SET sia405_de = CASE
    WHEN value_en = 'in use' THEN 'in_Betrieb'
    WHEN value_en = 'out of service' THEN 'ausser_Betrieb'
    ELSE 'unbekannt'
END;


