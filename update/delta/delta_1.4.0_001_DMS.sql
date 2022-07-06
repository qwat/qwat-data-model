CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE qwat_vl.document_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.document_type ADD CONSTRAINT vl_document_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.document_type IS 'document_type table';
ALTER TABLE qwat_vl.document_type ADD COLUMN active     boolean default true; /* determines if the actual document_type is active or not */
INSERT INTO qwat_vl.document_type (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.document_type (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.document_type (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');
INSERT INTO qwat_vl.document_type (id, active, value_en, value_fr) VALUES (8001, true, 'Picture', 'Picture');
INSERT INTO qwat_vl.document_type (id, active, value_en, value_fr) VALUES (8002, true, 'PDF', 'PDF');


CREATE TABLE qwat_od.document(
  id uuid DEFAULT gen_random_uuid() NOT NULL,
  identification text,
  path text NOT NULL,
  fk_document_type int
);
ALTER TABLE ONLY qwat_od.document ADD CONSTRAINT document_pkey PRIMARY KEY (id);


CREATE TABLE qwat_od.rel_document(
  id uuid DEFAULT gen_random_uuid() NOT NULL,
  fk_document uuid,
  object_class text,
  fk_object text
);
ALTER TABLE ONLY qwat_od.rel_document ADD CONSTRAINT rel_document_pkey PRIMARY KEY (id);

ALTER TABLE ONLY qwat_od.rel_document
  ADD CONSTRAINT fkey_od_document FOREIGN KEY (fk_document)
  REFERENCES qwat_od.document(id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY qwat_od.document
  ADD CONSTRAINT fkey_vl_document_type FOREIGN KEY (fk_document_type)
  REFERENCES qwat_vl.document_type(id) MATCH FULL DEFERRABLE INITIALLY DEFERRED;

