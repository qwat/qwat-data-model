

-- add missing code_sire column to qwat_vl.remote_type
-- this is specific to extension/ch_vd_sire

BEGIN;

ALTER TABLE qwat_vl.remote_type ADD COLUMN code_sire smallint;

UPDATE qwat_vl.remote_type SET code_sire = 0 where id = 1201;
UPDATE qwat_vl.remote_type SET code_sire = 1 where id = 1202;
UPDATE qwat_vl.remote_type SET code_sire = 2 where id = 1203;
UPDATE qwat_vl.remote_type SET code_sire = 3 where id = 1204;
UPDATE qwat_vl.remote_type SET code_sire = 5 where id = 1205;
UPDATE qwat_vl.remote_type SET code_sire = 4 where id = 1206;
UPDATE qwat_vl.remote_type SET code_sire = 5 where id = 1207;

COMMIT;
