-- restore the initial state
DELETE FROM qwat_od.valve;
DELETE FROM qwat_od.pipe;
DELETE FROM qwat_od.node;
DELETE FROM qwat_od.pressurezone;
DELETE FROM qwat_od.consumptionzone;
DELETE FROM qwat_od.district;
DELETE FROM qwat_od.distributor;

-- add a district
INSERT INTO qwat_od.district (id, name) VALUES (1, 'My district');

-- add a distributor
INSERT INTO qwat_od.distributor (id, name) VALUES (1, 'Demo Distributor');

-- add a consumption zone
INSERT INTO qwat_od.consumptionzone(id, name) VALUES (1, 'A consumption zone');

-- add a pressure zone
INSERT INTO qwat_od.pressurezone (id, name, fk_distributor, fk_consumptionzone) VALUES (1, 'A pressure zone', 1, 1);

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING (2559980 1149980 0, 2559990 1149990 0, 2560000 1150000 0)'), 2056), 4105, 101, 1, 1301, 1502, 101, 101, 101;

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING (2560000 1150000 0, 2560010 1150010 0, 2560020 1150020 0)'), 2056), 4105, 101, 1, 1301, 1502, 101, 101, 101;

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING (2560000 1150000 0, 2559990 1150010 0, 2559980 1150020 0)'), 2056), 4105, 101, 1, 1301, 1502, 101, 101, 101;

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING(2559980 1149980 0, 2559979.975263114 1149979.915516003 0, 2559979.947476254 1149979.823744764 0)'), 2056), 4105, 101, 1, 1301, 1502, 101, 101, 101;


INSERT INTO qwat_od.valve (id, fk_district, fk_pressurezone, fk_distributor,
       fk_precision, fk_precisionalti, fk_status, fk_valve_type, fk_valve_function, fk_valve_actuation, fk_object_reference,
       year, closed, fk_maintenance,altitude,schema_force_visible,
       geometry)
    VALUES (1, 1, 1, 1,
       101, 101, 101, 101, 6108, 101, 101,
       2016, True, '{1,2}', 9.5, True,
       st_setsrid('point(2559990 1149990 0)'::geometry,2056));

INSERT INTO qwat_od.valve (id, fk_district, fk_pressurezone, fk_distributor,
       fk_precision, fk_precisionalti, fk_status, fk_valve_type, fk_valve_function, fk_valve_actuation, fk_object_reference,
       year, closed, fk_maintenance,altitude,schema_force_visible,
       geometry)
    VALUES (2, 1, 1, 1,
       101, 101, 101, 101, 6108, 101, 101,
       2016, True, '{1,2}', 9.5, True,
       st_setsrid('point(2560010 1150010 0)'::geometry,2056));


-- The CALCULATED
SELECT id, _valve_count FROM qwat_od.pipe order by id;

UPDATE qwat_od.valve SET geometry =  st_setsrid('point(2559990 1150010 0)'::geometry,2056) WHERE id = 2;

SELECT id, _valve_count FROM qwat_od.pipe order by id;

INSERT INTO qwat_od.valve (id, fk_district, fk_pressurezone, fk_distributor,
       fk_precision, fk_precisionalti, fk_status, fk_valve_type, fk_valve_function, fk_valve_actuation, fk_object_reference,
       year, closed, fk_maintenance,altitude,schema_force_visible,
       geometry)
    VALUES (3, 1, 1, 1,
       101, 101, 101, 101, 6108, 101, 101,
       2016, True, '{1,2}', 9.5, True,
       st_setsrid('point(2560010 1150010 0)'::geometry,2056));

SELECT id, _valve_count FROM qwat_od.pipe order by id;

DELETE FROM qwat_od.valve WHERE id = 2;

SELECT id, _valve_count FROM qwat_od.pipe order by id;


-- restore the initial state
DELETE FROM qwat_od.valve;
DELETE FROM qwat_od.pipe;
DELETE FROM qwat_od.node;
DELETE FROM qwat_od.pressurezone;
DELETE FROM qwat_od.consumptionzone;
DELETE FROM qwat_od.district;
DELETE FROM qwat_od.distributor;
