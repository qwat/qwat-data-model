------ This file generates the database class organisation (Modul qwat (2020)) in en on QQIS
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 10.04.2024 15:47:40
------ with 3D coordinates
BEGIN;

---- 03_qwat_db_organisation.sql ----------

---------------------------

CREATE TABLE qwat_vl.value_list_base
(
code integer NOT NULL,
vsacode integer NOT NULL,
value_en character varying(100),
value_de character varying(100),
value_fr character varying(100),
value_it character varying(100),
value_ro character varying(100),
abbr_en character varying(3),
abbr_de character varying(3),
abbr_fr character varying(3),
abbr_it character varying(3),
abbr_ro character varying(3),
active boolean,
CONSTRAINT pkey_qwat_value_list_code PRIMARY KEY (code)
)
WITH (
   OIDS = False
);
-------
-------

CREATE TABLE qwat_od.organisation
(
   obj_id varchar(16) NOT NULL,
   CONSTRAINT pkey_qwat_od_organisation_obj_id PRIMARY KEY (obj_id)
)
WITH (
   OIDS = False
);
CREATE SEQUENCE qwat_od.seq_organisation_oid INCREMENT 1 MINVALUE 0 MAXVALUE 999999 START 0;
 ALTER TABLE qwat_od.organisation ALTER COLUMN obj_id SET DEFAULT qwat_sys.generate_oid('qwat_od','organisation');
COMMENT ON COLUMN qwat_od.organisation.obj_id IS 'INTERLIS STANDARD OID (with Postfix/Präfix), see www.interlis.ch';
 ALTER TABLE qwat_od.organisation ADD COLUMN identifier text;
 ALTER TABLE qwat_od.organisation ADD CONSTRAINT og_identifier_length_max_255 CHECK(char_length(identifier)<=255);
COMMENT ON COLUMN qwat_od.organisation.identifier IS 'The designation for municipalities is adopted according to the FSO list; for private individuals according to the UID register, if necessary with the addition of the location of the branch if no separate UID exists for it. / Die Bezeichnung für Gemeinden wird gemäss BFS-Liste übernommen; für Private gemäss UID-Register, allenfalls mit Zusatz des Ortes der Filiale, falls keine separate UID dafür besteht. / La désignation pour les communes est reprise selon la liste de l''OFS ; pour les particuliers, selon le registre UID, éventuellement avec l''ajout du lieu de la filiale s''il n''existe pas d''UID séparé pour celle-ci.';
 ALTER TABLE qwat_od.organisation ADD COLUMN identifier_short text;
 ALTER TABLE qwat_od.organisation ADD CONSTRAINT og_identifier_short_length_max_12 CHECK(char_length(identifier_short)<=12);
COMMENT ON COLUMN qwat_od.organisation.identifier_short IS ' / Kurzbezeichnung / désignation abrégée';
 ALTER TABLE qwat_od.organisation ADD COLUMN municipality_number  smallint ;
COMMENT ON COLUMN qwat_od.organisation.municipality_number IS 'Official number of municipality of federal office for statistics, mandatory for the municipalities. / Offizielle Gemeinde Nummer gemäss Bundesamt für Statistik, bei Gemeinden zwingend, sonst leer lassen. / Numéro officiel de la commune selon l''Office fédéral de la statistique, obligatoire pour les communes. Sinon, laissez vide.';
 ALTER TABLE qwat_od.organisation ADD COLUMN organisation_type  integer ;
COMMENT ON COLUMN qwat_od.organisation.organisation_type IS 'Type of organisatoin / Art der Organisation / Genre d''organisation';
 ALTER TABLE qwat_od.organisation ADD COLUMN remark text;
 ALTER TABLE qwat_od.organisation ADD CONSTRAINT og_remark_length_max_255 CHECK(char_length(remark)<=255);
COMMENT ON COLUMN qwat_od.organisation.remark IS 'General remarks / Allgemeine Bemerkungen / Remarques générales';
 ALTER TABLE qwat_od.organisation ADD COLUMN status  integer ;
COMMENT ON COLUMN qwat_od.organisation.status IS 'yyy_Status der Organisation, damit untergegangende Organisationen nicht einfach gelöscht werden müssen und kontrolliert werden kann, ob noch Beziehungen auf untergegangene Organisationen, z.B. bei Gemeindefusion oder Konkurs einer Firma vorhanden sind / Status der Organisation, damit untergegangende Organisationen nicht einfach gelöscht werden müssen und kontrolliert werden kann, ob noch Beziehungen auf untergegangene Organisationen, z.B. bei Gemeindefusion oder Konkurs einer Firma vorhanden sind / Statut de l''organisation, pour que les organisations disparues ne soient pas simplement supprimées et qu''il soit possible de contrôler s''il existe encore des relations avec les organisations disparues, par exemple en cas de fusion de communes ou de faillite d''une société';
 ALTER TABLE qwat_od.organisation ADD COLUMN uid text;
 ALTER TABLE qwat_od.organisation ADD CONSTRAINT og_uid_length_max_12 CHECK(char_length(uid)<=12);
COMMENT ON COLUMN qwat_od.organisation.uid IS 'Reference to the company identification of the Federal Office for Statistics (www.uid.admin.ch), e.g. CHE123456789 / Referenz zur Unternehmensidentifikation des Bundesamts fuer Statistik (www.uid.admin.ch), z.B. CHE123456789 / Référence pour l’identification des entreprises selon l’Office fédéral de la statistique OFS (www.uid.admin.ch), par exemple: CHE123456789';
 ALTER TABLE qwat_od.organisation ADD COLUMN last_modification TIMESTAMP without time zone DEFAULT now();
COMMENT ON COLUMN qwat_od.organisation.last_modification IS 'Last modification / Letzte_Aenderung / Derniere_modification: INTERLIS_1_DATE';
 ALTER TABLE qwat_od.organisation ADD COLUMN fk_dataowner varchar(16);
COMMENT ON COLUMN qwat_od.organisation.fk_dataowner IS 'Foreignkey to Metaattribute dataowner (as an organisation) - this is the person or body who is allowed to delete, change or maintain this object / Metaattribut Datenherr ist diejenige Person oder Stelle, die berechtigt ist, diesen Datensatz zu löschen, zu ändern bzw. zu verwalten / Maître des données gestionnaire de données, qui est la personne ou l''organisation autorisée pour gérer, modifier ou supprimer les données de cette table/classe';
 ALTER TABLE qwat_od.organisation ADD COLUMN fk_provider varchar(16);
COMMENT ON COLUMN qwat_od.organisation.fk_provider IS 'Foreignkey to Metaattribute provider (as an organisation) - this is the person or body who delivered the data / Metaattribut Datenlieferant ist diejenige Person oder Stelle, die die Daten geliefert hat / FOURNISSEUR DES DONNEES Organisation qui crée l’enregistrement de ces données ';
-------
CREATE TRIGGER
update_last_modified_organisation
BEFORE UPDATE OR INSERT ON
 qwat_od.organisation
FOR EACH ROW EXECUTE PROCEDURE
 qwat_sys.update_last_modified();

-------

------------ Relationships and Value Tables ----------- ;

CREATE TABLE qwat_vl.organisation_organisation_type () INHERITS (qwat_vl.value_list_base);
ALTER TABLE qwat_vl.organisation_organisation_type ADD CONSTRAINT pkey_qwat_vl_organisation_organisation_type_code PRIMARY KEY (code);
 INSERT INTO qwat_vl.organisation_organisation_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8608,8608,'waste_water_association','Abwasserverband','association_epuration_eau', 'consorzio_depurazione', 'rrr_Abwasserverband', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.organisation_organisation_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8715,8715,'federation','Bund','federation', 'confederazione', 'rrr_Bund', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.organisation_organisation_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8604,8604,'municipality','Gemeinde','commune', 'comune', 'municipiul', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.organisation_organisation_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9319,9319,'municipal_department','Gemeindeabteilung','departement_communal', 'dipartimento_comunale', 'departamentul_municipal', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.organisation_organisation_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8610,8610,'cooperative','Genossenschaft_Korporation','cooperative', 'cooperativa_corporazione', 'rrr_Genossenschaft_Korporation', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.organisation_organisation_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8605,8605,'canton','Kanton','canton', 'cantone', 'rrr_Kanton', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.organisation_organisation_type (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (8606,8606,'private','Privat','prive', 'privato', 'privata', '', '', '', '', '', 'true');
 ALTER TABLE qwat_od.organisation ADD CONSTRAINT fkey_vl_organisation_organisation_type FOREIGN KEY (organisation_type)
 REFERENCES qwat_vl.organisation_organisation_type (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;
CREATE TABLE qwat_vl.organisation_status () INHERITS (qwat_vl.value_list_base);
ALTER TABLE qwat_vl.organisation_status ADD CONSTRAINT pkey_qwat_vl_organisation_status_code PRIMARY KEY (code);
 INSERT INTO qwat_vl.organisation_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9047,9047,'activ','aktiv','active', 'attivo', 'rrr_aktiv', '', '', '', '', '', 'true');
 INSERT INTO qwat_vl.organisation_status (code, vsacode, value_en, value_de, value_fr, value_it, value_ro, abbr_en, abbr_de, abbr_fr, abbr_it, abbr_ro, active) VALUES (9048,9048,'gone','untergegangen','disparue', 'decaduta', 'rrr_untergegangen', '', '', '', '', '', 'true');
 ALTER TABLE qwat_od.organisation ADD CONSTRAINT fkey_vl_organisation_status FOREIGN KEY (status)
 REFERENCES qwat_vl.organisation_status (code) MATCH SIMPLE
 ON UPDATE RESTRICT ON DELETE RESTRICT;

 --------- Relations to class organisation for dataowner and provider (new 3.11.2014);

ALTER TABLE qwat_od.organisation ADD CONSTRAINT rel_od_organisation_fk_dataowner FOREIGN KEY (fk_dataowner) REFERENCES qwat_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE qwat_od.organisation ADD CONSTRAINT rel_od_organisation_fk_dataprovider FOREIGN KEY (fk_provider) REFERENCES qwat_od.organisation(obj_id) DEFERRABLE INITIALLY DEFERRED;

----- Indexes on identifiers

 CREATE UNIQUE INDEX in_od_organisation_identifier ON qwat_od.organisation USING btree (identifier ASC NULLS LAST, fk_dataowner ASC NULLS LAST);

 COMMIT;
