
-- create an introduction point
INSERT INTO qwat_vl.part_type (id, value_fr) VALUES (999, 'Point d''introduction');;

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
