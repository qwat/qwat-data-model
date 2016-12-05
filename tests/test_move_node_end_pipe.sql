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

-- insert an hydrant at the start of the pipe
INSERT INTO qwat_od.vw_element_hydrant (year, fk_distributor, fk_status, fk_provider,
            underground, altitude, fk_precisionalti, fk_precision, fk_object_reference, fk_model_sup, fk_model_inf, fk_material, fk_output,
            pressure_static, pressure_dynamic, flow,
            observation_date, observation_source,
            geometry)
    VALUES (2016, 1, 101, 101, 
            True, 9.5, 101, 101, 101, 101, 101, 101, 101,
            12.3, 12.3, 12.3,
            '2016/01/01', 'Test',
            st_setsrid('POINT(530000 140000 0)'::geometry,21781)
            );

-- move hydrant away
UPDATE qwat_od.vw_element_hydrant set geometry = st_setsrid('point(530001 140000 0)'::geometry,21781) where geometry = st_setsrid('point(530000 140000 0)'::geometry,21781);

-- restore the initial state
DELETE FROM qwat_od.vw_element_hydrant;
DELETE FROM qwat_od.pipe;
DELETE FROM qwat_od.pressurezone;
DELETE FROM qwat_od.consumptionzone;
DELETE FROM qwat_od.district;
DELETE FROM qwat_od.distributor;