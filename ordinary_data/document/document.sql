/*
	qWat - QGIS Water Module

	SQL file :: document table
*/


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
