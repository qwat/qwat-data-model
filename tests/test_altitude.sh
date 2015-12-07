
set -e

./init_qwat.sh -p qwat_test -d --demo


# should output  200 0 201 202

echo "

INSERT INTO qwat_od.distributor (name) SELECT 'Test Distributor';
-- 1      2d geom with altitude 200
INSERT INTO qwat_od.vw_element_installation (altitude, geometry, fk_distributor, installation_type, fk_status, fk_precision, fk_precisionalti, fk_watertype, fk_object_reference)
VALUES (200, ST_SetSRID( ST_MakePoint( 400000, 400000), 21781), 1, 'chamber', 101, 101, 101, 101, 101);
-- 2      2d geom with altitude NULL
INSERT INTO qwat_od.vw_element_installation (altitude, geometry, fk_distributor, installation_type, fk_status, fk_precision, fk_precisionalti, fk_watertype, fk_object_reference)
VALUES (NULL, ST_SetSRID( ST_MakePoint( 400001, 400001), 21781), 1, 'chamber', 101, 101, 101, 101, 101);
-- 3      3d geom (z = 201) without separate altitude
INSERT INTO qwat_od.vw_element_installation (altitude, geometry, fk_distributor, installation_type, fk_status, fk_precision, fk_precisionalti, fk_watertype, fk_object_reference)
VALUES (NULL, ST_SetSRID( ST_MakePoint( 400002, 400002, 201), 21781), 1, 'chamber', 101, 101, 101, 101, 101);
-- 4      3d geom (z = 500) with different altitude (202)
INSERT INTO qwat_od.vw_element_installation (altitude, geometry, fk_distributor, installation_type, fk_status, fk_precision, fk_precisionalti, fk_watertype, fk_object_reference)
VALUES (202, ST_SetSRID( ST_MakePoint( 400003, 400003, 500), 21781), 1, 'chamber', 101, 101, 101, 101, 101);

SELECT ST_z(geometry) FROM qwat_od.node;

" > cmd.sql

export PGSERVICE=qwat_test

psql -f cmd.sql
