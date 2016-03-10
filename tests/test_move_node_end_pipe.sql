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
       st_setsrid('linestring(530000 140000 0,530000 140010 0)'::geometry, 21781));
       

-- insert a valve at the start of the pipe
INSERT INTO qwat_od.vw_element_valve (fk_district, fk_pressurezone, fk_distributor, fk_pipe,
       fk_precision, fk_precisionalti, fk_status, fk_valve_type, fk_valve_function, fk_valve_actuation,
       geometry)
       VALUES (1, 1, 1, 1,
       101, 101, 101, 101, 6108, 101,
       st_setsrid('point(530000 140000 0)'::geometry,21781));
      
-- move valve away 
UPDATE qwat_od.vw_element_valve set geometry = st_setsrid('point(530001 140000 0)'::geometry,21781) where geometry = st_setsrid('point(530000 140000 0)'::geometry,21781);
