-- add a construction point
INSERT INTO qwat_dr.constructionpoint (id, geometry) 
    VALUES (1, ST_Setsrid('point(530000 140000 0)'::geometry,21781));

-- add a district
INSERT INTO qwat_od.district (id, name) VALUES (1, 'My district');

-- create pipe
-- add a distributor
INSERT INTO qwat_od.distributor (id, name) VALUES (1, 'Demo Distributor');

-- add a consumption zone
INSERT INTO qwat_od.consumptionzone(id, name) VALUES (1, 'A consumption zone');

-- add a pressure zone
INSERT INTO qwat_od.pressurezone (id, name, fk_distributor, fk_consumptionzone) VALUES (1, 'A pressure zone', 1, 1);

-- add the pipe
INSERT INTO qwat_od.pipe (id, fk_node_a, fk_node_b,
       fk_function, fk_installmethod, fk_material, fk_distributor, fk_precision, fk_bedding,
       fk_status, fk_watertype, geometry, year, fk_protection,schema_force_visible)
    VALUES (1, 1, 2, 101, 101, 101, 1, 101, 101, 101, 101,
       st_setsrid('linestring(530000 140000 0,530000 140010 0)'::geometry, 21781),
       2016, 101, True);

-- cut pipe in half
    -- insert the initial pipe
INSERT INTO qwat_od.pipe (fk_node_a, fk_node_b,
    fk_function, fk_installmethod, fk_material, fk_distributor, fk_precision, fk_bedding,
    fk_status, fk_watertype, geometry, year, fk_protection,schema_force_visible)
VALUES (1, 2, 101, 101, 101, 1, 101, 101, 101, 101,
    st_setsrid('linestring(730000 340000 0,830000 440000 0,930000 540000 0)'::geometry, 21781),
    2016, 101, True);
    -- update that pipe
UPDATE qwat_od.pipe SET geometry = st_setsrid('linestring(730000 340000 0,830000 440000 0)'::geometry, 21781) WHERE geometry = st_setsrid('linestring(730000 340000 0,830000 440000 0,930000 540000 0)'::geometry, 21781);
    -- create a new one
INSERT INTO qwat_od.pipe (fk_node_a, fk_node_b,
    fk_function, fk_installmethod, fk_material, fk_distributor, fk_precision, fk_bedding,
    fk_status, fk_watertype, geometry, year, fk_protection,schema_force_visible)
VALUES (1, 2, 101, 101, 101, 1, 101, 101, 101, 101,
    st_setsrid('linestring(830000 440000 0,930000 540000 0)'::geometry, 21781),
    2016, 101, True);

-- create an element part
INSERT INTO qwat_od.vw_element_part (year, _pipe_orientation, fk_part_type, fk_status, fk_distributor, fk_precision, geometry)
    SELECT 2016, 1.5, (SELECT id FROM qwat_vl.part_type WHERE value_fr = 'bouchon'), 101, 1, 101, st_setsrid('point(530000 140000 0)'::geometry, 21781);

-- create an introduction point
INSERT INTO qwat_vl.part_type (id, value_fr) VALUES (999, 'Point d''introduction');

INSERT INTO qwat_od.vw_element_part (year, _pipe_orientation, fk_part_type, fk_status, fk_distributor, fk_precision, geometry)
    SELECT 2016, 1.5, (SELECT id FROM qwat_vl.part_type WHERE value_fr = 'Point d''introduction'), 101, 1, 101, st_setsrid('point(630000 140000 0)'::geometry, 21781);

-- create valve
INSERT INTO qwat_od.valve (id, fk_district, fk_pressurezone, fk_distributor, fk_pipe,
       fk_precision, fk_precisionalti, fk_status, fk_valve_type, fk_valve_function, fk_valve_actuation, fk_object_reference,
       year, closed, fk_maintenance,altitude,schema_force_visible,
       geometry)
    VALUES (1, 1, 1, 1, 1,
       101, 101, 101, 101, 6108, 101, 101,
       2016, True, '{1,2}', 9.5, True,
       st_setsrid('point(530000 140010 0)'::geometry,21781));

-- create hydrante (create another pipe for that)
INSERT INTO qwat_od.pipe (id, fk_node_a, fk_node_b,
       fk_function, fk_installmethod, fk_material, fk_distributor, fk_precision, fk_bedding,
       fk_status, fk_watertype, geometry, year, fk_protection,schema_force_visible)
    VALUES (2, 1, 2, 101, 101, 101, 1, 101, 101, 101, 101,
       st_setsrid('linestring(630000 240000 0,630000 240010 0)'::geometry, 21781),
       2016, 101, True);

INSERT INTO qwat_od.vw_element_hydrant (year, fk_distributor, fk_status, fk_provider,
            underground, altitude, fk_precisionalti, fk_precision, fk_object_reference, fk_model_sup, fk_model_inf, fk_material, fk_output,
            pressure_static, pressure_dynamic, flow,
            observation_date, observation_source,
            geometry)
    VALUES (2016, 1, 101, 101, 
            True, 9.5, 101, 101, 101, 101, 101, 101, 101,
            12.3, 12.3, 12.3,
            '2016/01/01', 'sbe',
            st_setsrid('point(630000 240000 0)'::geometry,21781)
            );

-- create a leak
INSERT INTO qwat_od.leak (_repaired, detection_date, address, description,
            fk_cause, widespread_damage, pipe_replaced,repair, repair_date)
    VALUES (
        True, '2016/01/01', '22 av du 22', 'A description',
            101, True, True, 'Repaired', '2016/02/02'
            );

-- create an installation
INSERT INTO qwat_od.vw_element_installation (altitude, geometry, fk_distributor, installation_type, fk_status, fk_precision, fk_precisionalti, fk_watertype, fk_object_reference,
            name, year)
    VALUES (200, ST_SetSRID( ST_MakePoint( 400000, 400000, 0), 21781), 1, 'chamber', 101, 101, 101, 101, 101,
            'installation1', 2016);

-- create a cover
INSERT INTO qwat_od.cover (identification, form_dimension, fk_cover_type, circular, fk_installation, geometry)
    SELECT 'installation1', 15, 101, True, (SELECT id FROM qwat_od.vw_element_installation WHERE name = 'installation1'), ST_SetSRID( ST_MakePoint( 500000, 500000, 0), 21781);


-- installation bbox
-- TODO

-- detail installation
-- TODO 

-- relations
-- TODO

-- deletes
/*
DELETE FROM qwat_dr.constructionpoint;
DELETE FROM qwat_od.vw_element_part;
DELETE FROM qwat_od.valve;
DELETE FROM qwat_od.pipe;
DELETE FROM qwat_od.vw_element_hydrant;
DELETE FROM qwat_od.cover;
DELETE FROM qwat_od.vw_element_installation;
DELETE FROM qwat_od.network_element;
DELETE FROM qwat_od.distributor;
DELETE FROM qwat_od.leak;
*/
