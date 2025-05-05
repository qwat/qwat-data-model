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

-- add a node to the pipe's start
INSERT INTO qwat_od.vw_element_hydrant (year, fk_distributor, fk_status, fk_provider,
            underground, altitude, fk_precisionalti, fk_precision, fk_object_reference, fk_model_sup, fk_model_inf, fk_material, fk_output,
            pressure_static, pressure_dynamic, flow,
            observation_date, observation_source,
            geometry)
    VALUES (2016, '{1}', 101, 101, 
            True, 9.5, 101, 101, 101, 101, 101, 101, 101,
            12.3, 12.3, 12.3,
            '2016/01/01', 'Test',
            st_setsrid('POINT(2530000 1138260 0)'::geometry,2056)
            );

-- Now we have 3 vertices on the pipe
--SELECT 'num_points_after_add1', st_numpoints(geometry) FROM qwat_od.pipe WHERE id = 1;

-- add a node to the pipe's end
INSERT INTO qwat_od.vw_element_hydrant (year, fk_distributor, fk_status, fk_provider,
            underground, altitude, fk_precisionalti, fk_precision, fk_object_reference, fk_model_sup, fk_model_inf, fk_material, fk_output,
            pressure_static, pressure_dynamic, flow,
            observation_date, observation_source,
            geometry)
    VALUES (2016, '{1}', 101, 101, 
            True, 9.5, 101, 101, 101, 101, 101, 101, 101,
            12.3, 12.3, 12.3,
            '2016/01/01', 'Test',
            st_setsrid('POINT(2530050 1138270 0)'::geometry,2056)
            );

-- Now we have 4 vertices on the pipe
--SELECT 'num_points_after_add2', st_numpoints(geometry) FROM qwat_od.pipe WHERE id = 1;

-- Add a valve on the pipe
INSERT INTO qwat_od.valve (id, fk_district, fk_pressurezone, fk_distributor, fk_pipe,
       fk_precision, fk_precisionalti, fk_status, fk_valve_type, fk_valve_function, fk_valve_actuation, fk_object_reference,
       year, closed, fk_maintenance,altitude,schema_force_visible,
       geometry)
    VALUES (1, 1, 1, 1, 1,
       101, 101, 101, 101, 6108, 101, 101,
       2016, True, '{1,2}', 9.5, True,
       st_setsrid('point(2530025 1138265 0)'::geometry,2056));

-- Now we have 3 vertices on the pipe
SELECT 'num_points_after_add1', st_numpoints(geometry) FROM qwat_od.pipe WHERE id = 1;

-- What if the intersection test fails but the valve is close enough to the pipe ?
INSERT INTO qwat_od.valve (id, fk_district, fk_pressurezone, fk_distributor, fk_pipe,
       fk_precision, fk_precisionalti, fk_status, fk_valve_type, fk_valve_function, fk_valve_actuation, fk_object_reference,
       year, closed, fk_maintenance,altitude,schema_force_visible,
       geometry)
    VALUES (2, 1, 1, 1, 1,
       101, 101, 101, 101, 6108, 101, 101,
       2016, True, '{1,2}', 9.5, True,
       st_setsrid('point(2530025.2 1138265.04 0)'::geometry,2056));

-- Another point added
SELECT 'num_points_after_add2', st_numpoints(geometry) FROM qwat_od.pipe WHERE id = 1;

-- insert two pipes with the second one starting very close to the end of the first (1e-8)
-- this should not result in a recursive trigger call
SELECT 'new pipe close to the previous';
INSERT INTO qwat_od.pipe (id,
       fk_function, fk_installmethod, fk_material, fk_distributor, fk_precision, fk_bedding, fk_status, fk_watertype,
       geometry) VALUES
       (14428,
       101, 101, 101, 1, 101, 101, 101, 101,
       ST_GeomFromText('LINESTRINGZ(2540899.7448098600 1152955.6844859300 0, 2540900.2686702100 1152955.4115092600 0)',2056)
);

INSERT INTO qwat_od.pipe (id,
       fk_function, fk_installmethod, fk_material, fk_distributor, fk_precision, fk_bedding, fk_status, fk_watertype,
       geometry) VALUES
       (14296,
       101, 101, 101, 1, 101, 101, 101, 101,
       ST_GeomFromText('LINESTRINGZ(2540900.2686702100 1152955.4115092800 0, 2540900.4100672200 1152952.3142217600 0)',2056)
       --                                                          ^
       --       Here is the small distance to the last end point --+
);
SELECT 'new pipe close to the previous - end';

-- test removing one start or end vertex of a pipe
-- this should not cause a trigger error
INSERT INTO qwat_od.pipe (id, fk_node_a, fk_node_b,
       fk_function, fk_installmethod, fk_material, fk_distributor, fk_precision, fk_bedding,
       fk_status, fk_watertype,
       geometry) VALUES (11, 1, 2,
       101, 101, 101, 1, 101, 101, 101, 101,
       st_setsrid('linestring(2530000 1148260 0, 2530001 1148260 0, 2530002 1148270 0)'::geometry, 2056));

UPDATE qwat_od.pipe SET geometry = st_setsrid('linestring(2530000 1148260 0, 2530001 1148260 0)'::geometry, 2056) where id=11;

-- restore the initial state
DELETE FROM qwat_od.valve;
DELETE FROM qwat_od.vw_element_hydrant;
DELETE FROM qwat_od.pipe;
DELETE FROM qwat_od.pressurezone;
DELETE FROM qwat_od.consumptionzone;
DELETE FROM qwat_od.district;
DELETE FROM qwat_od.distributor;
