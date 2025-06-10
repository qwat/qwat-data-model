-- add a distributor
INSERT INTO qwat_od.distributor (id, name) VALUES (1, 'Demo Distributor');

-- add a district
INSERT INTO qwat_od.district (id, name) VALUES (1, 'My district');

-- add a consumption zone
INSERT INTO qwat_od.consumptionzone(id, name) VALUES (1, 'A consumption zone');

-- add a pressure zone
INSERT INTO qwat_od.pressurezone (id, name, fk_distributor, fk_consumptionzone) VALUES (1, 'A pressure zone', 1, 1);

-- add a pipe between two nodes (1 and 2)
INSERT INTO qwat_od.pipe (id, fk_node_a, fk_node_b,
       fk_function, fk_installmethod, fk_material, fk_distributor, fk_precision, fk_bedding,
       fk_status, fk_watertype,
       geometry) VALUES (1, 1, 2,
       101, 101, 101, 1, 101, 101, 101, 101,
       st_setsrid('linestring(2530000 1138260 0,2530050 1138270 0)'::geometry, 2056));
       
-- all geom should be the same
SELECT 'test1', st_equals(geometry,geometry_alt1) IS TRUE, _geometry_alt1_used IS FALSE, st_equals(geometry,geometry_alt2) IS TRUE, _geometry_alt2_used IS FALSE from qwat_od.pipe;

-- update main geom, since they were equal and nothing specified, they should be kept the same
UPDATE qwat_od.pipe SET geometry = st_setsrid('linestring(2530001 1138260 0,2530050 1138270 0)'::geometry, 2056);
SELECT 'test2', st_equals(geometry,geometry_alt1) IS TRUE, _geometry_alt1_used IS FALSE, st_equals(geometry,geometry_alt2) IS TRUE, _geometry_alt2_used IS FALSE from qwat_od.pipe;

-- move main geom and say alt1 should not be moved along => main != 1, and main = 2
UPDATE qwat_od.pipe SET update_geometry_alt1 = false, geometry = st_setsrid('linestring(2530002 1138260 0,2530050 1138270 0)'::geometry, 2056);
SELECT 'test3', st_equals(geometry,geometry_alt1) IS FALSE, _geometry_alt1_used IS TRUE, st_equals(geometry,geometry_alt2) IS TRUE, _geometry_alt2_used IS FALSE from qwat_od.pipe;

-- move main geom and say alt1 should move along => main = 1, and main = 2
UPDATE qwat_od.pipe SET update_geometry_alt1 = true, geometry = st_setsrid('linestring(2530003 1138260 0,2530050 1138270 0)'::geometry, 2056);
SELECT 'test4', st_equals(geometry,geometry_alt1) IS TRUE, _geometry_alt1_used IS FALSE, st_equals(geometry,geometry_alt2) IS TRUE, _geometry_alt2_used IS FALSE from qwat_od.pipe;

-- move alt1 => main != 1 and main = 2
UPDATE qwat_od.pipe SET geometry_alt1 = st_setsrid('linestring(2530004 1138260 0,2530050 1138270 0)'::geometry, 2056);
SELECT 'test5', st_equals(geometry,geometry_alt1) IS FALSE, _geometry_alt1_used IS TRUE, st_equals(geometry,geometry_alt2) IS TRUE, _geometry_alt2_used IS FALSE from qwat_od.pipe;

-- restore the initial state
DELETE FROM qwat_od.valve;
DELETE FROM qwat_od.pipe;
DELETE FROM qwat_od.pressurezone;
DELETE FROM qwat_od.consumptionzone;
DELETE FROM qwat_od.district;
DELETE FROM qwat_od.distributor;

