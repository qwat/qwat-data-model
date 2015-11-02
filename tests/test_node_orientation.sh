
set -e

./init_qwat.sh -p qwat_test -d


echo "

INSERT INTO qwat_od.distributor (name) VALUES ('Demo Distributor');

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING (559980 149980, 559990 149990, 560000 150000)'), 21781), 4105, 101, 1, 1301, 1502, 101, 101, 101;

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING (560000 150000, 560010 150010, 560020 150020)'), 21781), 4105, 101, 1, 1301, 1502, 101, 101, 101;

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING (560000 150000, 559990 150010, 559980 150020)'), 21781), 4105, 101, 1, 1301, 1502, 101, 101, 101;

INSERT INTO qwat_od.pipe (geometry, fk_function, fk_material, fk_distributor, fk_status, fk_watertype, fk_installmethod, fk_precision, fk_bedding)
SELECT ST_SetSRID(ST_GeomFromText('LINESTRING(559980 149980, 559979.975263114 149979.915516003, 559979.947476254 149979.823744764)'), 21781), 4105, 101, 1, 1301, 1502, 101, 101, 101;


INSERT INTO qwat_od.vw_element_valve (geometry, fk_distributor, fk_status, fk_valve_type, fk_valve_function, fk_actuation)
SELECT ST_SetSRID(ST_GeomFromText('POINT(559990 149990)'), 21781), 1, 1301, 101, 101, 101;

INSERT INTO qwat_od.vw_element_valve (geometry, fk_distributor, fk_status, fk_valve_type, fk_valve_function, fk_actuation)
SELECT ST_SetSRID(ST_GeomFromText('POINT(559990 150010)'), 21781), 1, 1301, 101, 101, 101;

INSERT INTO qwat_od.vw_element_valve (geometry, fk_distributor, fk_status, fk_valve_type, fk_valve_function, fk_actuation)
SELECT ST_SetSRID(ST_GeomFromText('POINT(559979.975263114 149979.915516003)'), 21781), 1, 1301, 101, 101, 101;

-- The CALCULATED orientation
--SELECT id, _pipe_orientation AS qwat_calculated_orientation FROM qwat_od.vw_element_valve;


-- What the orientation SHOULD BE
--SELECT 5 AS id, degrees(ST_Azimuth(ST_GeomFromText('POINT(559980 149980)'), ST_GeomFromText('POINT(559990 149990)'))) AS real_orientation;
--SELECT 6 AS id, degrees(ST_Azimuth(ST_GeomFromText('POINT(560000 150000)'), ST_GeomFromText('POINT(559990 150010)'))) AS real_orientation;
--SELECT 8 AS id, (degrees(ST_Azimuth(ST_GeomFromText('POINT(559980 149980)'), ST_GeomFromText('POINT(559979.975263114 149979.915516003)'))) + degrees(ST_Azimuth(ST_GeomFromText('POINT(559979.975263114 149979.915516003)'), ST_GeomFromText('POINT(559979.947476254 149979.823744764)'))))/2 AS real_orientation;

" > cmd.sql

export PGSERVICE=qwat_test

psql -f cmd.sql
