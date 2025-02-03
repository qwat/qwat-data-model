--Remove 16 as default nominal pressure
ALTER TABLE qwat_od.pipe ALTER COLUMN pressure_nominal DROP DEFAULT;