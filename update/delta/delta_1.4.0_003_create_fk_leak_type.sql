ALTER TABLE qwat_od.leak ADD column fk_type integer;

/*
 qWat - QGIS Water Module

 SQL file :: leak_type table
*/


CREATE TABLE qwat_vl.leak_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.leak_type ADD CONSTRAINT vl_leak_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.leak_type IS 'leak types';


/* Values */
INSERT INTO qwat_vl.leak_type (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.leak_type (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.leak_type (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.leak_type (id, vl_active, value_en, value_fr, value_ro) VALUES (9201, true,'rupture (break, breakage)', 'rupture (cassure, bris)','ruptură (spargere, rupere)');
INSERT INTO qwat_vl.leak_type (id, vl_active, value_en, value_fr, value_ro) VALUES (9202, true,'crack', 'fissure','fisură');
INSERT INTO qwat_vl.leak_type (id, vl_active, value_en, value_fr, value_ro) VALUES (9203, true,'hole', 'trou','gaură');
INSERT INTO qwat_vl.leak_type (id, vl_active, value_en, value_fr, value_ro) VALUES (9204, true,'default', 'défaut','defect');



ALTER TABLE qwat_od.leak ADD CONSTRAINT leak_fk_type FOREIGN KEY (fk_type) REFERENCES qwat_vl.leak_type(id) MATCH FULL; CREATE INDEX fki_leak_type ON qwat_od.leak(fk_type);
