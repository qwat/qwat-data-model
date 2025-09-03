-- add a protection_tube
--INSERT INTO qwat_od.protection_tube (id, name) VALUES (1, 'Demo protection_tube');
INSERT INTO qwat_od.protection_tube (name_number, material, nominal_diameter, outside_diameter, lenght, installation_year, horizontal_positioning, status, sur_plus_cover, condition, remark, geometry3d_geometry) 
VALUES ('Demo protection_tube', 9438 ,'800', 805, '', 2024, 9443, 9448,2.3, 'test protection tube added',ST_Force3D(ST_GeomFromText('LINESTRINGZ(540900.2686702100 152955.4115092800 0, 540900.4100672200 152952.3142217600 0)',21781)));



UPDATE qwat_od.protection_tube SET geometry = st_setsrid('linestring(530000 148260 0, 530001 148260 0)'::geometry, 21781) where id=11;

-- restore the initial state
DELETE FROM qwat_od.protection_tube
