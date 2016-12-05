INSERT INTO qwat_od.distributor (id, name) VALUES (1, 'Demo Distributor');

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING (559980 149980 0, 559990 149990 0, 560000 150000 0)'), 21781), 4105, 101, 1, 1301, 1502, 101, 101, 101;

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING (560000 150000 0, 560010 150010 0, 560020 150020 0)'), 21781), 4105, 101, 1, 1301, 1502, 101, 101, 101;

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING (560000 150000 0, 559990 150010 0, 559980 150020 0)'), 21781), 4105, 101, 1, 1301, 1502, 101, 101, 101;

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING(559980 149980 0, 559979.975263114 149979.915516003 0, 559979.947476254 149979.823744764 0)'), 21781), 4105, 101, 1, 1301, 1502, 101, 101, 101;


INSERT INTO qwat_od.vw_element_hydrant (year, fk_distributor, fk_status, fk_provider,
            underground, altitude, fk_precisionalti, fk_precision, fk_object_reference, fk_model_sup, fk_model_inf, fk_material, fk_output,
            pressure_static, pressure_dynamic, flow,
            observation_date, observation_source,
            geometry)
    VALUES (2016, 1, 101, 101, 
            True, 9.5, 101, 101, 101, 101, 101, 101, 101,
            12.3, 12.3, 12.3,
            '2016/01/01', 'Test',
            st_setsrid('POINT(559980 149980 0)'::geometry,21781)
            );

INSERT INTO qwat_od.vw_element_hydrant (year, fk_distributor, fk_status, fk_provider,
            underground, altitude, fk_precisionalti, fk_precision, fk_object_reference, fk_model_sup, fk_model_inf, fk_material, fk_output,
            pressure_static, pressure_dynamic, flow,
            observation_date, observation_source,
            geometry)
    VALUES (2016, 1, 101, 101, 
            True, 9.5, 101, 101, 101, 101, 101, 101, 101,
            12.3, 12.3, 12.3,
            '2016/01/01', 'Test',
            st_setsrid('POINT(560000 150000 0)'::geometry,21781)
            );

INSERT INTO qwat_od.vw_element_hydrant (year, fk_distributor, fk_status, fk_provider,
            underground, altitude, fk_precisionalti, fk_precision, fk_object_reference, fk_model_sup, fk_model_inf, fk_material, fk_output,
            pressure_static, pressure_dynamic, flow,
            observation_date, observation_source,
            geometry)
    VALUES (2016, 1, 101, 101, 
            True, 9.5, 101, 101, 101, 101, 101, 101, 101,
            12.3, 12.3, 12.3,
            '2016/01/01', 'Test',
            st_setsrid('POINT(559980 150020 0)'::geometry,21781)
            );

-- The CALCULATED orientation
SELECT _pipe_orientation AS qwat_calculated_orientation FROM qwat_od.vw_element_hydrant order by id;

-- expected ?
-- SELECT degrees(ST_Azimuth(ST_GeomFromText('POINT(559980 149980)'), ST_GeomFromText('POINT(559990 149990)'))) AS real_orientation;
-- SELECT degrees(ST_Azimuth(ST_GeomFromText('POINT(560000 150000)'), ST_GeomFromText('POINT(559990 150010)'))) AS real_orientation;
-- SELECT (degrees(ST_Azimuth(ST_GeomFromText('POINT(559980 149980)'), ST_GeomFromText('POINT(559979.975263114 149979.915516003)'))) + degrees(ST_Azimuth(ST_GeomFromText('POINT(559979.975263114 149979.915516003)'), ST_GeomFromText('POINT(559979.947476254 149979.823744764)'))))/2 AS real_orientation;

-- restore the initial state
DELETE FROM qwat_od.vw_element_hydrant;
DELETE FROM qwat_od.pipe;
DELETE FROM qwat_od.node;
DELETE FROM qwat_od.distributor;

