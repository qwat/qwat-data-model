
-- Populate columns

-- TODO : complete this !!!
-- TODO : sync this with delta_1.3.6_add_vl_for_SIA_export.sql

UPDATE qwat_vl.pipe_material SET sia405_de = CASE
    WHEN short_fr = 'AC' THEN 'Stahl.unbekannt'
    WHEN short_fr = 'PE' THEN 'Kunststoff.Polyethylen.unbekannt'
    ELSE 'unbekannt'
END;

UPDATE qwat_vl.status SET sia405_de = CASE
    WHEN value_en = 'in use' THEN 'in_Betrieb'
    WHEN value_en = 'out of service' THEN 'ausser_Betrieb'
    ELSE 'unbekannt'
END;
