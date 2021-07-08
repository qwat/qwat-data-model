/*
This adds corresponding sia405 values for interlis import/export.
*/

-- Add columns

ALTER TABLE qwat_vl.value_list_base ADD COLUMN sia405code TEXT;


-- Populate columns

-- TODO : Bedding material mapping complete [X] to check [ ]
UPDATE qwat_vl.bedding SET sia405code = 'unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.bedding SET sia405code = 'unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.bedding SET sia405code = 'unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.bedding SET sia405code = 'unbekannt' WHERE value_fr = 'aucun';
UPDATE qwat_vl.bedding SET sia405code = 'Beton' WHERE value_fr = 'béton';
UPDATE qwat_vl.bedding SET sia405code = 'Fliess' WHERE value_fr = 'géotextile';
UPDATE qwat_vl.bedding SET sia405code = 'Betonkies' WHERE value_fr = 'gravier';
UPDATE qwat_vl.bedding SET sia405code = 'Sand' WHERE value_fr = 'sable';
UPDATE qwat_vl.bedding SET sia405code = 'unbekannt' WHERE value_fr = 'terre';

-- TODO : complete mapping
-- UPDATE qwat_vl.cistern SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.cover_type SET sia405code = 'unbekannt' WHERE ???;

-- Hydrant material : mapping complete [X] to check [ ]
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

-- TODO : Pipe function mapping to complete [X] to check [ ]
UPDATE qwat_vl.pipe_function SET sia405code = 'unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.pipe_function SET sia405code = 'unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.pipe_function SET sia405code = 'unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.pipe_function SET sia405code = 'Fernwasserleitung' WHERE value_fr = 'Conduite de transport';
UPDATE qwat_vl.pipe_function SET sia405code = 'Hydrantenanschlussleitung' WHERE value_fr = 'Conduite d''hydrant';
UPDATE qwat_vl.pipe_function SET sia405code = 'Entleerungsleitung' WHERE value_fr = 'Conduite de vidange';
UPDATE qwat_vl.pipe_function SET sia405code = 'Zubringerleitung' WHERE value_fr = 'Conduite d''adduction';
UPDATE qwat_vl.pipe_function SET sia405code = 'unbekannt' WHERE value_fr = 'Conduite de distribution';
UPDATE qwat_vl.pipe_function SET sia405code = 'Anschlussleitung.gemeinsam' WHERE value_fr = 'Branchement commun';
UPDATE qwat_vl.pipe_function SET sia405code = 'unbekannt' WHERE value_fr = 'By-pass';
UPDATE qwat_vl.pipe_function SET sia405code = 'Bau_Wasseranschluss' WHERE value_fr = 'Branchement privé';
UPDATE qwat_vl.pipe_function SET sia405code = 'unbekannt' WHERE value_fr = 'Conduite de haute pression';
UPDATE qwat_vl.pipe_function SET sia405code = 'Quellleitung' WHERE value_fr = 'Drain captant';
UPDATE qwat_vl.pipe_function SET sia405code = 'unbekannt' WHERE value_fr = 'Trop plein';
UPDATE qwat_vl.pipe_function SET sia405code = 'Entlueftungsleitung' WHERE value_fr = 'Ventilation';

-- TODO : pipe installation method mapping to complete [X] to check [ ]
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'offener_Graben' WHERE value_fr = 'En fouille';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'unbekannt' WHERE value_fr = 'Chemisé';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'freiliegend' WHERE value_fr = 'Air libre';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'grabenlos' WHERE value_fr = 'Sous pont';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'unbekannt' WHERE value_fr = 'Protégé';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'unbekannt' WHERE value_fr = 'Bétoné';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'grabenlos' WHERE value_fr = 'Galerie';

-- TODO : pipe material mapping to complete [ ] to check [ ]
-- Missing CU
UPDATE qwat_vl.pipe_material SET sia405code = 'unbekannt' WHERE value_fr = 'Autre';
UPDATE qwat_vl.pipe_material SET sia405code = 'unbekannt' WHERE value_fr = 'Inconnu';
UPDATE qwat_vl.pipe_material SET sia405code = 'unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.pipe_material SET sia405code = 'Stahl.unbekannt' WHERE short_fr = 'AC';
UPDATE qwat_vl.pipe_material SET sia405code = 'Stahl.verzinkt' WHERE short_fr = 'ACG';
UPDATE qwat_vl.pipe_material SET sia405code = 'Stahl.unbekannt' WHERE short_fr = 'ACPR';
UPDATE qwat_vl.pipe_material SET sia405code = 'Stahl.rostbestaendig' WHERE short_fr = 'ACI';
UPDATE qwat_vl.pipe_material SET sia405code = 'Guss.unbekannt' WHERE short_fr = 'F';
UPDATE qwat_vl.pipe_material SET sia405code = 'Guss.unbekannt' WHERE short_fr = 'FAE';
UPDATE qwat_vl.pipe_material SET sia405code = 'Kunststoff.Polyethylen.unbekannt' WHERE short_fr = 'PE';
UPDATE qwat_vl.pipe_material SET sia405code = 'Kunststoff.Polyethylen.unbekannt' WHERE short_fr = 'PE80';
UPDATE qwat_vl.pipe_material SET sia405code = 'Kunststoff.Polyethylen.unbekannt' WHERE short_fr = 'PEX';
UPDATE qwat_vl.pipe_material SET sia405code = 'Kunststoff.Polyvinylchlorid.unbekannt' WHERE short_fr = 'PVC';
UPDATE qwat_vl.pipe_material SET sia405code = 'Zementrohr_Beton.unbekannt' WHERE short_fr = 'TC';
UPDATE qwat_vl.pipe_material SET sia405code = 'Zementrohr_Beton.unbekannt' WHERE short_fr = 'TAC';
UPDATE qwat_vl.pipe_material SET sia405code = 'Zementrohr_Beton.unbekannt' WHERE value_fr = 'Béton précontraint';
UPDATE qwat_vl.pipe_material SET sia405code = 'Kunststoff.Glasfaserverstaerkter_Epoxiharz' WHERE short_fr = 'GRP';
UPDATE qwat_vl.pipe_material SET sia405code = 'Kunststoff' WHERE short_fr = 'PL';

-- TODO : complete mapping
-- UPDATE qwat_vl.pipe_protection SET sia405code = 'unbekannt' WHERE ???;

-- TODO : Planimetric precision mapping to complete [X] to check [ ]
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'Autre';
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'Inconnu';
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'À déterminer';
UPDATE qwat_vl.precision SET sia405code = 'ungenau' WHERE value_fr = 'Imprécis';
UPDATE qwat_vl.precision SET sia405code = 'genau' WHERE value_fr = 'Précis';
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'Localisé';
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'Digitalisé';

-- TODO : Altimetric precision mapping to complete [X] to check [ ]
UPDATE qwat_vl.precisionalti SET sia405code = 'unbekannt' WHERE value_fr = 'Autre';
UPDATE qwat_vl.precisionalti SET sia405code = 'unbekannt' WHERE value_fr = 'Inconnu';
UPDATE qwat_vl.precisionalti SET sia405code = 'unbekannt' WHERE value_fr = 'À déterminer';
UPDATE qwat_vl.precisionalti SET sia405code = 'ungenau' WHERE value_fr = 'Imprécis';
UPDATE qwat_vl.precisionalti SET sia405code = 'ungenau' WHERE value_fr = 'Inférieure à 100 cm';
UPDATE qwat_vl.precisionalti SET sia405code = 'ungenau' WHERE value_fr = 'Inférieure à 50 cm';
UPDATE qwat_vl.precisionalti SET sia405code = 'genau' WHERE value_fr = 'Inférieure à 10 cm';
UPDATE qwat_vl.precisionalti SET sia405code = 'genau' WHERE value_fr = 'Inférieure à 5 cm';

-- TODO : complete mapping
UPDATE qwat_vl.pressurecontrol_type SET sia405code = 'Schacht.unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.pressurecontrol_type SET sia405code = 'Schacht.unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.pressurecontrol_type SET sia405code = 'Schacht.unbekannt' WHERE value_fr = 'à déterminer';
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
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.Fluss_Seewasserfassung' WHERE value_fr = 'captage eau lac';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.Grundwasserfassung' WHERE value_fr = 'captage eau nappe';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.Quellfassung' WHERE value_fr = 'captage eau source';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.Fluss_Seewasserfassung' WHERE value_fr = 'captage eau rivière';

-- TODO : status mapping complete [X] to check [ ]
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

-- TODO : valve function actuation complete [X] to check [ ]
UPDATE qwat_vl.valve_actuation SET sia405code = 'unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.valve_actuation SET sia405code = 'unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.valve_actuation SET sia405code = 'unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.valve_actuation SET sia405code = 'mechanisch' WHERE value_fr = 'manuel';
UPDATE qwat_vl.valve_actuation SET sia405code = 'mechanisch' WHERE value_fr = 'manuel à gauche';
UPDATE qwat_vl.valve_actuation SET sia405code = 'motorisch.unbekannt' WHERE value_fr = 'électrique';
UPDATE qwat_vl.valve_actuation SET sia405code = 'motorisch.mit_Fernsteuerung' WHERE value_fr = 'télécommandée';
UPDATE qwat_vl.valve_actuation SET sia405code = 'motorisch.unbekannt' WHERE value_fr = 'automatique';

-- TODO : valve function mapping complete [X] to check [ ]
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.Zonenschieber' WHERE value_fr = 'vanne de régulation';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.unbekannt' WHERE value_fr = 'ventouse';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.unbekannt' WHERE value_fr = 'vanne bypass';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.Anschlussschieber' WHERE value_fr = 'vanne branchement';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.unbekannt' WHERE value_fr = 'vanne incendie';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.Hydrantenschieber' WHERE value_fr = 'vanne d''hydrant';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.Entleerungsschieber' WHERE value_fr = 'vidange';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.Trennschieber' WHERE value_fr = 'vanne réseau';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.Entleerungsschieber' WHERE value_fr = 'vidange-ventouse';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.unbekannt' WHERE value_fr = 'antiretour';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.unbekannt' WHERE value_fr = 'vanne sprinkler';
UPDATE qwat_vl.valve_function SET sia405code = 'Schieber.unbekannt' WHERE value_fr = 'jauge';

-- TODO : complete mapping
-- UPDATE qwat_vl.valve_maintenance SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.valve_type SET sia405code = 'unbekannt' WHERE ???;

-- TODO : complete mapping
-- UPDATE qwat_vl.visible SET sia405code = 'unbekannt' WHERE ???;
-- This is a QWAT attribute to enable/disable some attributes, no mapping required here.

-- TODO : Water Quality : mapping complete [X] to check [ ]
UPDATE qwat_vl.watertype SET sia405code = 'unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.watertype SET sia405code = 'unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.watertype SET sia405code = 'unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.watertype SET sia405code = 'Rohwasser' WHERE value_fr = 'brute';
UPDATE qwat_vl.watertype SET sia405code = 'Trinkwasser' WHERE value_fr = 'potable';
UPDATE qwat_vl.watertype SET sia405code = 'Industriebrauchwasser' WHERE value_fr = 'industrielle';

-- TODO : complete mapping
-- UPDATE qwat_vl.worker_type SET sia405code = 'unbekannt' WHERE ???;
