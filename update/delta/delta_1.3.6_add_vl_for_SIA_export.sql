/*
This adds corresponding sia405 values for interlis import/export.
*/


-- Add columns

ALTER TABLE qwat_vl.value_list_base ADD COLUMN sia405_de TEXT NOT NULL DEFAULT 'unbekannt';


-- Populate columns
-- TODO : sync this with value_list_sia405.sql

-- TODO : complete mapping
UPDATE qwat_vl.bedding SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.cistern SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.cover_type SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.hydrant_material SET sia405_de = CASE
    WHEN short_fr LIKE 'F %' THEN 'Metall'
    ELSE 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.hydrant_model_inf SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.hydrant_model_sup SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.hydrant_output SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.hydrant_provider SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.leak_cause SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.locationtype SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.nominal_diameter SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.object_reference SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.overflow SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.part_type SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.pipe_function SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.pipe_installmethod SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.pipe_material SET sia405_de = CASE
    WHEN short_fr = 'AC' THEN 'Stahl.unbekannt'
    WHEN short_fr = 'PE' THEN 'Kunststoff.Polyethylen.unbekannt'
    ELSE 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.pipe_protection SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.precision SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.precisionalti SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.pressurecontrol_type SET sia405_de = CASE
    WHEN value_en = 'reducer' THEN 'Schacht.Druckbrecher'
    WHEN value_en = 'pressure cut' THEN 'Schacht.Druckbrecher'
    WHEN value_en = 'gathering' THEN 'Schacht.unbekannt'
    ELSE 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.protectionzone_type SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.pump_operating SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.pump_type SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.remote_type SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.source_quality SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.source_type SET sia405_de = CASE
    WHEN value_fr = 'captage eau lac' THEN 'Fassungsanlage.Fluss_Seewasserfassung'
    WHEN value_fr = 'captage eau nappe' THEN 'Fassungsanlage.Grundwasserfassung'
    WHEN value_fr = 'captage eau source' THEN 'Fassungsanlage.Quellfassung'
    WHEN value_fr = 'captage eau rivière' THEN 'Fassungsanlage.Fluss_Seewasserfassung'
    ELSE 'Fassungsanlage.unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.status SET sia405_de = CASE
    WHEN value_en = 'in use' THEN 'in_Betrieb'
    WHEN value_en = 'out of service' THEN 'ausser_Betrieb'
    ELSE 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.subscriber_type SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.survey_type SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.tank_firestorage SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.valve_actuation SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.valve_function SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.valve_maintenance SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.valve_type SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.visible SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.watertype SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;

-- TODO : complete mapping
UPDATE qwat_vl.worker_type SET sia405_de = CASE
    WHEN TRUE THEN 'unbekannt'
END;
