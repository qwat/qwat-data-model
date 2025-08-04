INSERT INTO qwat_od.distributor (id, name) SELECT 1, 'Test Distributor';
-- 1      2d geom with altitude 200
INSERT INTO qwat_od.vw_element_installation (altitude, geometry, fk_distributor, installation_type, fk_status, fk_precision, fk_precisionalti, fk_watertype, fk_object_reference)
VALUES (200, ST_SetSRID( ST_MakePoint( 2530060, 1138360, 0), 2056), '{1}', 'chamber', 101, 101, 101, 101, 101);
-- 2      2d geom with altitude NULL
INSERT INTO qwat_od.vw_element_installation (altitude, geometry, fk_distributor, installation_type, fk_status, fk_precision, fk_precisionalti, fk_watertype, fk_object_reference)
VALUES (NULL, ST_SetSRID( ST_MakePoint( 2530061, 1138361, 0), 2056), '{1}', 'chamber', 101, 101, 101, 101, 101);
-- 3      3d geom (z = 201) without separate altitude
INSERT INTO qwat_od.vw_element_installation (altitude, geometry, fk_distributor, installation_type, fk_status, fk_precision, fk_precisionalti, fk_watertype, fk_object_reference)
VALUES (NULL, ST_SetSRID( ST_MakePoint( 2530062, 1138362, 201), 2056), '{1}', 'chamber', 101, 101, 101, 101, 101);
-- 4      3d geom (z = 500) with different altitude (202)
INSERT INTO qwat_od.vw_element_installation (altitude, geometry, fk_distributor, installation_type, fk_status, fk_precision, fk_precisionalti, fk_watertype, fk_object_reference)
VALUES (202, ST_SetSRID( ST_MakePoint( 2530063, 1138362, 500), 2056), '{1}', 'chamber', 101, 101, 101, 101, 101);

SELECT 'Z', ST_Z(geometry) FROM qwat_od.node order by id;

DELETE FROM qwat_od.vw_element_installation;
DELETE FROM qwat_od.node;
DELETE FROM qwat_od.distributor;
