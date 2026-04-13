/*
	qWat - QGIS Water Module

	SQL file :: status table
*/

/* CREATE */
CREATE TABLE qwat_vl.status () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.status ADD CONSTRAINT vl_status_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.status IS 'Status table, with SIRE id.';

/* COLUMNS */
ALTER TABLE qwat_vl.status ADD COLUMN active     boolean default true; /* determines if the actual status is active or not */
ALTER TABLE qwat_vl.status ADD COLUMN functional boolean default true; /* determines if the actual status is functional or not */


/* VALUES */
INSERT INTO qwat_vl.status (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.status (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.status (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.status (id, active, functional, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1307, true,  true,    'Fictional',      'Fictif',       'Fictiv',       '', 'L''objet n''existe pas mais est nécessaire à l''intégrité topologique.', 'Obiectul este fictiv dar este necesar pentru integritatea topologică.');    /*  */
INSERT INTO qwat_vl.status (id, active, functional, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1303, false, false, 'Shut down',      'Désaffecté',   'Dezafectat',   '', 'La mise hors service est quasi-définitive et une remise en service nécessiterai des opérations spéciales. Par exemple, une source non-captée est considérée comme désaffectée. Ou encore, une conduite n''étant plus raccordée maism étant toutefois dans état propre à son utilisation.', 'Punerea în stare dezafectată este semi definitivă iar repunerea în stare funcţională ar necesita operaţiuni speciale. Spre exemplu, o sursă necaptată este considerată ca dezafectată. Sau mai mult, o conductă care nu este racordată dar a cărei stare e utilizabilă.');    /*  */
INSERT INTO qwat_vl.status (id, active, functional, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1305, false, false, 'Destroyed',      'Détruit',      'Distrus',      '', 'L''objet a été partiellement ou complètement détruit.', 'Obiectul este distrus complet sau parţial');    /*  */
INSERT INTO qwat_vl.status (id, active, functional, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1302, false, true, 'Out of service', 'Hors service', 'Nefuncţional', '', 'Ne contribue actuellement pas au réseau, mais peut être remis en service sans opération spéciale. La mise hors service est considérée comme temporaire. Par exemple, une source mise hors service pour des problèmes de qualité.', 'Nu contribuie efectiv la reţea, dar poate fi repusă în stare funcţională fară operaţiuni speciale. Starea nefuncţională este considerată ca una temporară. De exemplu, putem avea o sursă care a fost pusă în stare nefuncţională datorită unor probleme de calitate.');    /*  */
INSERT INTO qwat_vl.status (id, active, functional, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1301, true,  true,    'In use',         'En service',   'Funcţional',   '', 'Contribue actuellement au réseau.', 'Contribuie efectiv la reţea.');    /*  */
INSERT INTO qwat_vl.status (id, active, functional, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1304, false, false, 'Disused',        'Abandonné',    'Abandonat',    '', 'L''objet est inutilisable et sa mise hors service est strictement définitive. Par exemple, une conduite non raccordée et impropre au transport d''eau, mais pouvant éventuellement servir à passer des câbles. Ou encore une station de pompage sans pompe en état de fonctionner.', 'Obiectul este abandonat iar scoaterea din funcţiune este strict definitivă. Spre exemplu, putem avea o conductă neracordată și improprie transportului de apă dar care poate fi eventual folosită ca mediu protector pentru alte conducte sau pt. cabluri. Alt exemplu este o statie de pompare fară nici o pompă  în stare funcţională.');    /*  */
INSERT INTO qwat_vl.status (id, active, functional, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1306, true, false, 'Project planned',        'Projet planifie',       'Proiect planificat',      '', 'L''objet est un projet validé en attente', 'Obiectul face parte dintr-un proiect planificat');    /*  */
INSERT INTO qwat_vl.status (id, active, functional, value_en, value_fr, value_ro, description_en, description_fr, description_ro) VALUES (1308, true, false, 'Project in execution',        'Projet en execution',       'Proiect în execuție',      'The object is part of a project that''s already in execution', 'L''objet est un projet validé en cours de réalisation', 'Obiectul face parte dintr-un proiect care este în curs de execuție');    /*  */

/* SIA405 codes */
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
