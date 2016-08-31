-- add a district
INSERT INTO qwat_od.district (id, name) VALUES (1, 'My district');

-- add a distributor
INSERT INTO qwat_od.distributor (id, name) VALUES (1, 'Demo Distributor');

-- add a consumption zone
INSERT INTO qwat_od.consumptionzone(id, name) VALUES (1, 'A consumption zone');

-- add a pressure zone
INSERT INTO qwat_od.pressurezone (id, name, fk_distributor, fk_consumptionzone) VALUES (1, 'A pressure zone', 1, 1);

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING (559980 149980 0, 559990 149990 0, 560000 150000 0)'), 21781), 4105, 101, 1, 1301, 1502, 101, 101, 101;

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING (560000 150000 0, 560010 150010 0, 560020 150020 0)'), 21781), 4105, 101, 1, 1301, 1502, 101, 101, 101;

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING (560000 150000 0, 559990 150010 0, 559980 150020 0)'), 21781), 4105, 101, 1, 1301, 1502, 101, 101, 101;

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING(559980 149980 0, 559979.975263114 149979.915516003 0, 559979.947476254 149979.823744764 0)'), 21781), 4105, 101, 1, 1301, 1502, 101, 101, 101;


INSERT INTO qwat_od.valve (id, fk_district, fk_pressurezone, fk_distributor,
       fk_precision, fk_precisionalti, fk_status, fk_valve_type, fk_valve_function, fk_valve_actuation, fk_object_reference,
       year, closed, fk_maintenance,altitude,schema_force_visible,
       geometry)
    VALUES (1, 1, 1, 1,
       101, 101, 101, 101, 6108, 101, 101,
       2016, True, '{1,2}', 9.5, True,
       st_setsrid('point(559990 149990 0)'::geometry,21781));

INSERT INTO qwat_od.valve (id, fk_district, fk_pressurezone, fk_distributor,
       fk_precision, fk_precisionalti, fk_status, fk_valve_type, fk_valve_function, fk_valve_actuation, fk_object_reference,
       year, closed, fk_maintenance,altitude,schema_force_visible,
       geometry)
    VALUES (2, 1, 1, 1,
       101, 101, 101, 101, 6108, 101, 101,
       2016, True, '{1,2}', 9.5, True,
       st_setsrid('point(560010 150010 0)'::geometry,21781));

INSERT INTO qwat_od.valve (id, fk_district, fk_pressurezone, fk_distributor,
       fk_precision, fk_precisionalti, fk_status, fk_valve_type, fk_valve_function, fk_valve_actuation, fk_object_reference,
       year, closed, fk_maintenance,altitude,schema_force_visible,
       geometry)
    VALUES (3, 1, 1, 1,
       101, 101, 101, 101, 6108, 101, 101,
       2016, True, '{1,2}', 9.5, True,
       st_setsrid('point(559990 150010 0)'::geometry,21781));

-- The CALCULATED orientation
SELECT orientation AS qwat_calculated_orientation FROM qwat_od.valve order by id;

-- restore the initial state
DELETE FROM qwat_od.valve;
DELETE FROM qwat_od.pipe;
DELETE FROM qwat_od.node;
DELETE FROM qwat_od.pressurezone;
DELETE FROM qwat_od.consumptionzone;
DELETE FROM qwat_od.district;
DELETE FROM qwat_od.distributor;