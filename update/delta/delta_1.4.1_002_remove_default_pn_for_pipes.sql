--Remove 16 as default nominal pressure
ALTER TABLE qwat_od.pipe ADD COLUMN pressure_nominal smallint;