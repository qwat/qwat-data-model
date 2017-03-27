ALTER TABLE qwat_od.part
  DROP CONSTRAINT part_id_fkey,
  ADD CONSTRAINT  part_id_fkey FOREIGN KEY (id) REFERENCES qwat_od.network_element (id) MATCH SIMPLE;

UPDATE qwat_sys.versions SET version = '1.2.5';
