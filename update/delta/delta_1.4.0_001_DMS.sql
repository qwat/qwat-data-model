CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE qwat_od.document(
  id uuid DEFAULT gen_random_uuid() NOT NULL,
  identification text NOT NULL,
  path text,
  type text
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
