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
       st_setsrid('linestring(530000 138260 0,530050 138270 0)'::geometry, 21781));
       
SELECT st_equals(geometry,geometry_alt1), st_equals(geometry,geometry_alt2), _geometry_alt1_used, _geometry_alt2_used from qwat_od.pipe;

UPDATE qwat_od.pipe SET geometry = st_setsrid('linestring(530001 138260 0,530050 138270 0)'::geometry, 21781);
       
SELECT st_equals(geometry,geometry_alt1), st_equals(geometry,geometry_alt2), _geometry_alt1_used, _geometry_alt2_used from qwat_od.pipe;     

UPDATE qwat_od.pipe SET geometry = st_setsrid('linestring(530000 138260 0,530050 138270 0)'::geometry, 21781);  
     
SELECT st_equals(geometry,geometry_alt1), st_equals(geometry,geometry_alt2), _geometry_alt1_used, _geometry_alt2_used from qwat_od.pipe;  
 
UPDATE qwat_od.pipe SET update_geometry_alt1 = true, geometry = st_setsrid('linestring(530001 138260 0,530050 138270 0)'::geometry, 21781); 

SELECT st_equals(geometry,geometry_alt1), st_equals(geometry,geometry_alt2), _geometry_alt1_used, _geometry_alt2_used from qwat_od.pipe; 

-- restore the initial state
DELETE FROM qwat_od.vw_element_valve;
DELETE FROM qwat_od.pipe;
DELETE FROM qwat_od.pressurezone;
DELETE FROM qwat_od.consumptionzone;
DELETE FROM qwat_od.district;
DELETE FROM qwat_od.distributor;

