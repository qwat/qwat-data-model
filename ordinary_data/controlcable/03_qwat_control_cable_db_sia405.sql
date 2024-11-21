------ This file generates the postgres database (Modul fernwirkkabel (based on SIA405_FERNWIRKKABEL_3D_2015_LV95 (Version 18.04.2018) in en for QQIS
------ Rename classes for integration in specific TEKSI module based on this convention: https://github.com/orgs/teksi/discussions/100#discussioncomment-9058690
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 28.10.2024 20:47:23
------ with 3D coordinates

--- CREATE FUNCTION qgep_sys.update_last_modified() exists already
-------
CREATE TABLE qwat_od.sia405cc_cable_point
(
   obj_id varchar(16) NOT NULL,
   CONSTRAINT pkey_qwat_od_sia405cc_cable_point_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE SEQUENCE qwat_od.seq_sia405cc_cable_point_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
ALTER TABLE qwat_od.sia405cc_cable_point ALTER COLUMN obj_id SET DEFAULT qwat_sys.generate_oid('qwat_od','sia405cc_cable_point');
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix), see www.interlis.ch';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN name_number text;
 ALTER TABLE qwat_od.sia405cc_cable_point ADD CONSTRAINT _name_number_length_max_40 CHECK(char_length(name_number)<=40);
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.name_number IS '';
--ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN geometry_geometry geometry('POINT', :SRID);
-- CREATE INDEX in_qwat_sia405cc_cable_point_geometry_geometry ON qwat_od.sia405cc_cable_point USING gist (geometry_geometry );
-- COMMENT ON COLUMN qwat_od.sia405cc_cable_point.geometry_geometry IS '';
ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN geometry3d_geometry geometry('POINTZ', :SRID);
CREATE INDEX in_qwat_sia405cc_cable_point_geometry3d_geometry ON qwat_od.sia405cc_cable_point USING gist (geometry3d_geometry );
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.geometry3d_geometry IS '';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN kind  integer ;
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.kind IS '';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN horizontal_positioning  integer ;
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.horizontal_positioning IS '';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN altitude  decimal(7,3) ;
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.altitude IS '';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN elevation_determination  integer ;
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.elevation_determination IS '';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN status  integer ;
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.status IS 'Operating and planning status of the structure / Betriebs- bzw. Planungszustand des Bauwerks / Etat de fonctionnement et de planification de l’ouvrage';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN installation_year  smallint ;
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.installation_year IS '';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN sur_plus_cover  decimal(4,1) ;
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.sur_plus_cover IS '';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN condition text;
 ALTER TABLE qwat_od.sia405cc_cable_point ADD CONSTRAINT _condition_length_max_40 CHECK(char_length(condition)<=40);
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.condition IS '';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN remark text;
 ALTER TABLE qwat_od.sia405cc_cable_point ADD CONSTRAINT _remark_length_max_80 CHECK(char_length(remark)<=80);
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN dimension1  smallint ;
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.dimension1 IS '';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN dimension2  smallint ;
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.dimension2 IS '';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN altitude_lower_edge  decimal(7,3) ;
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.altitude_lower_edge IS ' / Höhe Unterkante';
ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN symbolori  decimal(4,1) ;
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.symbolori IS 'Default: 90 degree / Default: 90 Grad / Default: 90 degre';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.depth IS '';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN last_modification TIMESTAMP without time zone DEFAULT now();
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN fk_dataowner varchar(16);
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.fk_dataowner IS 'Foreignkey to Metaattribute dataowner (as an organisation) - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN fk_provider varchar(16);
COMMENT ON COLUMN qwat_od.sia405cc_cable_point.fk_provider IS 'Foreignkey to Metaattribute provider (as an organisation) - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée l’enregistrement de ces données ';
-------
CREATE TRIGGER
update_last_modified_sia405cc_cable_point
BEFORE UPDATE OR INSERT ON
 qwat_od.sia405cc_cable_point
FOR EACH ROW EXECUTE PROCEDURE
 qwat_sys.update_last_modified();
-------
CREATE TABLE qwat_od.sia405cc_cable
(
   obj_id varchar(16) NOT NULL,
   CONSTRAINT pkey_qwat_od_sia405cc_cable_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE SEQUENCE qwat_od.seq_sia405cc_cable_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
ALTER TABLE qwat_od.sia405cc_cable ALTER COLUMN obj_id SET DEFAULT qwat_sys.generate_oid('qwat_od','sia405cc_cable');
COMMENT ON COLUMN qwat_od.sia405cc_cable.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix), see www.interlis.ch';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN name_number text;
 ALTER TABLE qwat_od.sia405cc_cable ADD CONSTRAINT _name_number_length_max_40 CHECK(char_length(name_number)<=40);
COMMENT ON COLUMN qwat_od.sia405cc_cable.name_number IS ' / z.B. Kabelpunktanfang_Kabelpunkteende / xxx_z.B. Point_cableanfang_Point_cableeende';
-- ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN geometry_geometry geometry('COMPOUNDCURVE', :SRID);
-- CREATE INDEX in_qwat_sia405cc_cable_geometry_geometry ON qwat_od.sia405cc_cable USING gist (geometry_geometry );
-- COMMENT ON COLUMN qwat_od.sia405cc_cable.geometry_geometry IS '';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN function  integer ;
COMMENT ON COLUMN qwat_od.sia405cc_cable.function IS '';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN cable_type  integer ;
COMMENT ON COLUMN qwat_od.sia405cc_cable.cable_type IS 'Cable type / Kabelart / Genre de cable';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN horizontal_positioning  integer ;
COMMENT ON COLUMN qwat_od.sia405cc_cable.horizontal_positioning IS '';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN status  integer ;
COMMENT ON COLUMN qwat_od.sia405cc_cable.status IS '';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN installation_year  smallint ;
COMMENT ON COLUMN qwat_od.sia405cc_cable.installation_year IS '';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN sur_plus_cover  decimal(4,1) ;
COMMENT ON COLUMN qwat_od.sia405cc_cable.sur_plus_cover IS '';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN condition text;
 ALTER TABLE qwat_od.sia405cc_cable ADD CONSTRAINT _condition_length_max_40 CHECK(char_length(condition)<=40);
COMMENT ON COLUMN qwat_od.sia405cc_cable.condition IS '';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN remark text;
 ALTER TABLE qwat_od.sia405cc_cable ADD CONSTRAINT _remark_length_max_80 CHECK(char_length(remark)<=80);
COMMENT ON COLUMN qwat_od.sia405cc_cable.remark IS '';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN width  smallint ;
COMMENT ON COLUMN qwat_od.sia405cc_cable.width IS '';
ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN geometry3d_geometry geometry('COMPOUNDCURVEZ', :SRID);
CREATE INDEX in_qwat_sia405cc_cable_geometry3d_geometry ON qwat_od.sia405cc_cable USING gist (geometry3d_geometry );
COMMENT ON COLUMN qwat_od.sia405cc_cable.geometry3d_geometry IS '';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN elevation_determination  integer ;
COMMENT ON COLUMN qwat_od.sia405cc_cable.elevation_determination IS '';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN depth  smallint ;
COMMENT ON COLUMN qwat_od.sia405cc_cable.depth IS 'Extension 3D, depth (height) of an object [mm]. / Erweiterung 3D Mächtigkeit (Höhe) eines Objektes [mm]. / Extension 3D, épaisseur (hauteur) d''un objet [mm].';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN last_modification TIMESTAMP without time zone DEFAULT now();
COMMENT ON COLUMN qwat_od.sia405cc_cable.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN fk_dataowner varchar(16);
COMMENT ON COLUMN qwat_od.sia405cc_cable.fk_dataowner IS 'Foreignkey to Metaattribute dataowner (as an organisation) - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN fk_provider varchar(16);
COMMENT ON COLUMN qwat_od.sia405cc_cable.fk_provider IS 'Foreignkey to Metaattribute provider (as an organisation) - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée l’enregistrement de ces données ';
-------
CREATE TRIGGER
update_last_modified_sia405cc_cable
BEFORE UPDATE OR INSERT ON
 qwat_od.sia405cc_cable
FOR EACH ROW EXECUTE PROCEDURE
 qwat_sys.update_last_modified();

------------ Relationships and Value Tables ----------- ;
ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN fk_owner varchar(16);
ALTER TABLE qwat_od.sia405cc_cable_point ADD CONSTRAINT rel_sia405cc_cable_point_owner FOREIGN KEY (fk_owner) REFERENCES qwat_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
CREATE TABLE qwat_vl.sia405cc_cable_point_kind () INHERITS (qwat_vl.value_list_base2);
ALTER TABLE qwat_vl.sia405cc_cable_point_kind ADD CONSTRAINT pkey_qwat_vl_sia405cc_cable_point_kind_code PRIMARY KEY (code);
 INSERT INTO qwat_vl.sia405cc_cable_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9385,9385,'cable_sleeve','Kabelmuffe','manchon_cable', 'manicotto_del_cavo', 'manson_de_cablu', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9388,9388,'cable_point','Kabelpunkt','point_de_cable', 'punto_cavo', 'punct_de_cablu', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9386,9386,'cable_manhole','Kabelschacht','chambre_cable', '', '', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9387,9387,'cabine','Kabine','cabine', 'cabina', 'cabina', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9384,9384,'unknown','unbekannt','inconnue', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_kind (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9389,9389,'others','weitere','autre', '', '', '', '', '', '', '', 'true');
 ALTER TABLE qwat_od.sia405cc_cable_point ADD CONSTRAINT fkey_vl_sia405cc_cable_point_kind FOREIGN KEY (kind)
 REFERENCES qwat_vl.sia405cc_cable_point_kind (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qwat_vl.sia405cc_cable_point_horizontal_positioning () INHERITS (qwat_vl.value_list_base2);
ALTER TABLE qwat_vl.sia405cc_cable_point_horizontal_positioning ADD CONSTRAINT pkey_qwat_vl_sia405cc_cable_point_horizontal_positioning_code PRIMARY KEY (code);
 INSERT INTO qwat_vl.sia405cc_cable_point_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9392,9392,'accurate','genau','precis', 'precisa', 'precisa', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9390,9390,'unknown','unbekannt','inconnue', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9391,9391,'inaccurate','ungenau','imprecis', 'impreciso', 'imprecisa', '', '', '', '', '', 'true');
 ALTER TABLE qwat_od.sia405cc_cable_point ADD CONSTRAINT fkey_vl_sia405cc_cable_point_horizontal_positioning FOREIGN KEY (horizontal_positioning)
 REFERENCES qwat_vl.sia405cc_cable_point_horizontal_positioning (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qwat_vl.sia405cc_cable_point_elevation_determination () INHERITS (qwat_vl.value_list_base2);
ALTER TABLE qwat_vl.sia405cc_cable_point_elevation_determination ADD CONSTRAINT pkey_qwat_vl_sia405cc_cable_point_elevation_determination_code PRIMARY KEY (code);
 INSERT INTO qwat_vl.sia405cc_cable_point_elevation_determination (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9394,9394,'accurate','genau','precis', 'precisa', 'precisa', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_elevation_determination (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9395,9395,'unknown','unbekannt','inconnue', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_elevation_determination (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9396,9396,'inaccurate','ungenau','imprecis', 'impreciso', 'imprecisa', '', '', '', '', '', 'true');
 ALTER TABLE qwat_od.sia405cc_cable_point ADD CONSTRAINT fkey_vl_sia405cc_cable_point_elevation_determination FOREIGN KEY (elevation_determination)
 REFERENCES qwat_vl.sia405cc_cable_point_elevation_determination (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qwat_vl.sia405cc_cable_point_status () INHERITS (qwat_vl.value_list_base2);
ALTER TABLE qwat_vl.sia405cc_cable_point_status ADD CONSTRAINT pkey_qwat_vl_sia405cc_cable_point_status_code PRIMARY KEY (code);
 INSERT INTO qwat_vl.sia405cc_cable_point_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9397,9397,'inoperative','ausser_Betrieb','hors_service', 'fuori_servizio', 'rrr_ausser_Betrieb', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9398,9398,'inoperative.reserve','ausser_Betrieb.Reserve','hors_service.en_reserve', 'fuori_servizio.riserva', 'rrr_ausser_Betrieb.Reserve', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9399,9399,'operational','in_Betrieb','en_service', 'in_funzione', 'functionala', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9400,9400,'operational.tentative','in_Betrieb.provisorisch','en_service.provisoire', 'in_funzione.provvisorio', 'functionala.provizoriu', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9401,9401,'others','weitere','', '', '', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9402,9402,'other.calculation_alternative','weitere.Berechnungsvariante','autre.variante_de_calcule', 'altro.variante_calcolo', 'alta.varianta_calcul', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9403,9403,'other.planned','weitere.geplant','autre.planifie', 'altro.previsto', 'rrr_weitere.geplant', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_point_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9404,9404,'other.project','weitere.Projekt','autre.projet', 'altro.progetto', 'alta.proiect', '', '', '', '', '', 'true');
 ALTER TABLE qwat_od.sia405cc_cable_point ADD CONSTRAINT fkey_vl_sia405cc_cable_point_status FOREIGN KEY (status)
 REFERENCES qwat_vl.sia405cc_cable_point_status (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN fk_owner varchar(16);
ALTER TABLE qwat_od.sia405cc_cable ADD CONSTRAINT rel_cable_owner FOREIGN KEY (fk_owner) REFERENCES qwat_od.organisation(obj_id) ON UPDATE CASCADE ON DELETE set null DEFERRABLE INITIALLY DEFERRED;
CREATE TABLE qwat_vl.sia405cc_cable_function () INHERITS (qwat_vl.value_list_base2);
ALTER TABLE qwat_vl.sia405cc_cable_function ADD CONSTRAINT pkey_qwat_vl_sia405cc_cable_function_code PRIMARY KEY (code);
 INSERT INTO qwat_vl.sia405cc_cable_function (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9339,9339,'signal_cable','Signalkabel','cable_de_signal', 'cavo_di_segnale', 'cablu_de_semnal', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_function (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9340,9340,'control_cable','Steuerkabel','cable_de_conduite', 'cavo_di_comando', 'cablu_de_control', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_function (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9341,9341,'power_cable','Stromkabel','cable_de_courant', 'cavo_di_alimentazione', 'cablu_de_alimentare', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_function (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9338,9338,'unknown','unbekannt','inconnue', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_function (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9342,9342,'others','weitere','autres', 'zzz_weitere', 'rrr_weitere', '', '', '', '', '', 'true');
 ALTER TABLE qwat_od.sia405cc_cable ADD CONSTRAINT fkey_vl_sia405cc_cable_function FOREIGN KEY (function)
 REFERENCES qwat_vl.sia405cc_cable_function (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qwat_vl.sia405cc_cable_cable_type () INHERITS (qwat_vl.value_list_base2);
ALTER TABLE qwat_vl.sia405cc_cable_cable_type ADD CONSTRAINT pkey_qwat_vl_sia405cc_cable_cable_type_code PRIMARY KEY (code);
 INSERT INTO qwat_vl.sia405cc_cable_cable_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9345,9345,'coaxial','koaxial','coaxial', 'zzz_coassiale', 'rrr_koaxial', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_cable_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9344,9344,'copper','Kupfer','cuivre', 'zzz_rame', 'zzz_Kupfer', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_cable_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9346,9346,'fiber_optic','Lichtwellenleiter','optique', 'zzz_Lichtwellenleiter', 'rrr_Lichtwellenleiter', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_cable_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9343,9343,'unknown','unbekannt','inconnue', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 ALTER TABLE qwat_od.sia405cc_cable ADD CONSTRAINT fkey_vl_sia405cc_cable_cable_type FOREIGN KEY (cable_type)
 REFERENCES qwat_vl.sia405cc_cable_cable_type (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qwat_vl.sia405cc_cable_horizontal_positioning () INHERITS (qwat_vl.value_list_base2);
ALTER TABLE qwat_vl.sia405cc_cable_horizontal_positioning ADD CONSTRAINT pkey_qwat_vl_sia405cc_cable_horizontal_positioning_code PRIMARY KEY (code);
 INSERT INTO qwat_vl.sia405cc_cable_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9347,9347,'accurate','genau','precis', 'precisa', 'precisa', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9348,9348,'unknown','unbekannt','inconnue', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_horizontal_positioning (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9349,9349,'inaccurate','ungenau','imprecis', 'impreciso', 'imprecisa', '', '', '', '', '', 'true');
 ALTER TABLE qwat_od.sia405cc_cable ADD CONSTRAINT fkey_vl_sia405cc_cable_horizontal_positioning FOREIGN KEY (horizontal_positioning)
 REFERENCES qwat_vl.sia405cc_cable_horizontal_positioning (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qwat_vl.sia405cc_cable_status () INHERITS (qwat_vl.value_list_base2);
ALTER TABLE qwat_vl.sia405cc_cable_status ADD CONSTRAINT pkey_qwat_vl_sia405cc_cable_status_code PRIMARY KEY (code);
 INSERT INTO qwat_vl.sia405cc_cable_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9363,9363,'inoperative','ausser_Betrieb','hors_service', 'fuori_servizio', 'rrr_ausser_Betrieb', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9364,9364,'inoperative.reserve','ausser_Betrieb.Reserve','hors_service.en_reserve', 'fuori_servizio.riserva', 'rrr_ausser_Betrieb.Reserve', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9365,9365,'operational','in_Betrieb','en_service', 'in_funzione', 'functionala', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9366,9366,'operational.tentative','in_Betrieb.provisorisch','en_service.provisoire', 'in_funzione.provvisorio', 'functionala.provizoriu', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9367,9367,'others','weitere','autre', '', '', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9368,9368,'other.calculation_alternative','weitere.Berechnungsvariante','autre.variante_de_calcule', 'altro.variante_calcolo', 'alta.varianta_calcul', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9369,9369,'other.planned','weitere.geplant','autre.planifie', 'altro.previsto', 'rrr_weitere.geplant', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9370,9370,'other.project','weitere.Projekt','autre.projet', 'altro.progetto', 'alta.proiect', '', '', '', '', '', 'true');
 ALTER TABLE qwat_od.sia405cc_cable ADD CONSTRAINT fkey_vl_sia405cc_cable_status FOREIGN KEY (status)
 REFERENCES qwat_vl.sia405cc_cable_status (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qwat_vl.sia405cc_cable_elevation_determination () INHERITS (qwat_vl.value_list_base2);
ALTER TABLE qwat_vl.sia405cc_cable_elevation_determination ADD CONSTRAINT pkey_qwat_vl_sia405cc_cable_elevation_determination_code PRIMARY KEY (code);
 INSERT INTO qwat_vl.sia405cc_cable_elevation_determination (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9359,9359,'accurate','genau','precis', 'precisa', 'precisa', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_elevation_determination (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9360,9360,'unknown','unbekannt','inconnue', 'sconosciuto', 'necunoscuta', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.sia405cc_cable_elevation_determination (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9361,9361,'inaccurate','ungenau','imprecis', 'impreciso', 'imprecisa', '', '', '', '', '', 'true');
 ALTER TABLE qwat_od.sia405cc_cable ADD CONSTRAINT fkey_vl_sia405cc_cable_elevation_determination FOREIGN KEY (elevation_determination)
 REFERENCES qwat_vl.sia405cc_cable_elevation_determination (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
--------- Relations to class organisation for dataowner and provider (new 3.11.2014);

ALTER TABLE qwat_od.sia405cc_cable_point ADD CONSTRAINT rel_od_sia405cc_cable_point_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qwat_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE qwat_od.sia405cc_cable_point ADD CONSTRAINT rel_od_sia405cc_cable_point_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qwat_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE qwat_od.sia405cc_cable ADD CONSTRAINT rel_od_sia405cc_cable_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qwat_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE qwat_od.sia405cc_cable ADD CONSTRAINT rel_od_sia405cc_cable_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qwat_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;

------ Indexes on identifiers

 CREATE UNIQUE INDEX in_od_sia405cc_cable_point_name_number ON qwat_od.sia405cc_cable_point USING btree (name_number ASC NULLS LAST, fk_dataowner ASC NULLS LAST);
 CREATE UNIQUE INDEX in_od_sia405cc_cable_name_number ON qwat_od.sia405cc_cable USING btree (name_number ASC NULLS LAST, fk_dataowner ASC NULLS LAST);


-- For m:n relation tables to avoid duplicate entries


