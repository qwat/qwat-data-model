------ this file generates the qwat is_dictionary (Modul fernwaerme(based on SIA405_FERNWAERME_3D_2015_LV95 (Version 18.04.2018)) in en on TEKSI
------ For questions etc. please contact Stefan Burckhardt stefan.burckhardt@sjib.ch
------ version 28.10.2024 20:12:17
------ with 3D coordinates

CREATE TABLE qwat_sys.dictionary_od_table
(
  id integer NOT NULL,
  tablename text,
  name_en text,
  shortcut_en character(2),
  name_de text,
  shortcut_de character(2),
  name_fr text,
  shortcut_fr character(2),
  name_it text,
  shortcut_it character(4),
  name_ro text,
  shortcut_ro character(4),
  CONSTRAINT pkey_qwat_is_dictonary_id PRIMARY KEY (id),
  CONSTRAINT unq_qwat_is_dictonary_tablename UNIQUE (tablename)
)
WITH (
  OIDS = False
);
ALTER TABLE qwat_sys.dictionary_od_table ADD CONSTRAINT unq_qwat_is_dictonary_name_en UNIQUE (name_en);
ALTER TABLE qwat_sys.dictionary_od_table ADD CONSTRAINT unq_qwat_is_dictonary_shortcut_en UNIQUE (shortcut_en);
ALTER TABLE qwat_sys.dictionary_od_table ADD CONSTRAINT unq_qwat_is_dictonary_name_de UNIQUE (name_de);
---- ALTER TABLE qwat_sys.dictionary_od_table ADD CONSTRAINT unq_qwat_is_dictonary_shortcut_de UNIQUE (shortcut_de);
ALTER TABLE qwat_sys.dictionary_od_table ADD CONSTRAINT unq_qwat_is_dictonary_name_fr UNIQUE (name_fr);
---- ALTER TABLE qwat_sys.dictionary_od_table ADD CONSTRAINT unq_qwat_is_dictonary_shortcut_fr UNIQUE (shortcut_fr);
--- ALTER TABLE qwat_sys.dictionary_od_table ADD CONSTRAINT unq_qwat_is_dictonary_name_it UNIQUE (name_it);
--- ALTER TABLE qwat_sys.dictionary_od_table ADD CONSTRAINT unq_qwat_is_dictonary_shortcut_it UNIQUE (shortcut_it);
--- ALTER TABLE qwat_sys.dictionary_od_table ADD CONSTRAINT unq_qwat_is_dictonary_name_ro UNIQUE (name_ro);
--- ALTER TABLE qwat_sys.dictionary_od_table ADD CONSTRAINT unq_qwat_is_dictonary_shortcut_ro UNIQUE (shortcut_ro);

 

DROP TYPE IF EXISTS qwat_od.plantype;
CREATE TYPE qwat_od.plantype AS ENUM ('Leitungskataster','Werkinformation', 'GEP_Verband', 'GEP_Traegerschaft', 'PAA', 'SAA', 'kein_Plantyp_definiert');
CREATE TABLE qwat_sys.dictionary_od_field (
    id serial NOT NULL,
    class_id integer,
    attribute_id integer,
    table_name character varying(80),
    field_name character varying(80),
    field_name_en character varying(80),
    field_name_de character varying(100),
    field_name_fr character varying(100),
    field_name_it character varying(100),
    field_name_ro character varying(100),
    field_description_en text,
    field_description_de text,
    field_description_fr text,
    field_description_it text,
    field_description_ro text,
    field_mandatory qwat_od.plantype[],
    field_visible boolean,
    field_datatype character varying(40),
    field_unit_de character varying(20),
    field_unit_description_de character varying(90),
    field_unit_en character varying(20),
    field_unit_description_en character varying(90),
    field_unit_fr character varying(20),
    field_unit_description_fr character varying(90),
    field_unit_it character varying(20),
    field_unit_description_it character varying(90),
    field_unit_ro character varying(20),
    field_unit_description_ro character varying(90),
    field_min numeric,
    field_max numeric,
    CONSTRAINT is_dictionary_od_field_pkey PRIMARY KEY (id)
);



CREATE TABLE qwat_sys.dictionary_od_values (
  id serial NOT NULL,
  class_id integer,
  attribute_id integer,
  value_id integer,
  table_name character varying(80),
  field_name character varying(80),
  value_name character varying(100),
  value_name_en character varying(80),
  shortcut_en character(4),
  value_name_de character varying(100),
  shortcut_de character(4),
  value_name_fr character varying(100),
  shortcut_fr character(4),
  value_name_it character varying(100),
  shortcut_it character(4),
  value_name_ro character varying(100),
  shortcut_ro character(4),
  value_description_en text,
  value_description_de text,
  value_description_fr text,
  value_description_it text,
  value_description_ro text,
CONSTRAINT is_dictionary_od_values_pkey PRIMARY KEY (id)
);



CREATE UNIQUE INDEX in_dictionary_od_table ON qwat_sys.dictionary_od_table USING btree (tablename ASC NULLS LAST);
CREATE UNIQUE INDEX in_dictionary_od_field ON qwat_sys.dictionary_od_field USING btree (class_id ASC NULLS LAST, attribute_id ASC NULLS LAST);
CREATE UNIQUE INDEX in_dictionary_od_values ON qwat_sys.dictionary_od_values USING btree (class_id ASC NULLS LAST, attribute_id ASC NULLS LAST, value_id ASC NULLS LAST);
