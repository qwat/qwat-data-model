ALTER TABLE qwat_od.subscriber_reference
  DROP CONSTRAINT subscriber_reference_fk_subscriber,
  ADD CONSTRAINT  subscriber_reference_fk_subscriber FOREIGN KEY (fk_subscriber) REFERENCES qwat_od.subscriber (id) MATCH FULL ON DELETE CASCADE;

ALTER TABLE qwat_od.meter
  DROP CONSTRAINT meter_fk_pipe,
  ADD  CONSTRAINT meter_fk_pipe FOREIGN KEY (fk_pipe) REFERENCES qwat_od.pipe(id) MATCH FULL ON DELETE CASCADE;

ALTER TABLE qwat_od.pipe
  DROP CONSTRAINT pipe_fk_parent,
  ADD CONSTRAINT pipe_fk_parent FOREIGN KEY (fk_parent) REFERENCES qwat_od.pipe (id) MATCH FULL ON DELETE SET NULL;

UPDATE qwat_sys.versions SET version = '1.2.4';
