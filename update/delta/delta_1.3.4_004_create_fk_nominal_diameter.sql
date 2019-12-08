ALTER TABLE qwat_od.valve ADD column fk_nominal_diameter integer;

UPDATE qwat_od.valve
SET fk_nominal_diameter = (
CASE
WHEN diameter_nominal = '90/63' THEN 7008
WHEN diameter_nominal = '80' THEN 7009
WHEN diameter_nominal = '1 1/4''' THEN 7005
WHEN diameter_nominal = '125' THEN 7011
WHEN diameter_nominal = '2500' THEN 7037
WHEN diameter_nominal = '200/63' THEN 7008
WHEN diameter_nominal = '160-63' THEN 7008
WHEN diameter_nominal = '50' THEN 7007
WHEN diameter_nominal = '1 1/4"' THEN 7005
WHEN diameter_nominal = '160/63' THEN 7008
WHEN diameter_nominal = '63' THEN 7008
WHEN diameter_nominal = '250' THEN 7014
WHEN diameter_nominal = '1/2''' THEN 7002
WHEN diameter_nominal = '200' THEN 7013
WHEN diameter_nominal = '65' THEN 7008
WHEN diameter_nominal = '32' THEN 7005
WHEN diameter_nominal = '1"' THEN 7004
WHEN diameter_nominal = '70' THEN 7008
WHEN diameter_nominal = '1.5"' THEN 7006
WHEN diameter_nominal = '120' THEN 7011
WHEN diameter_nominal = '200/2"' THEN 7013
WHEN diameter_nominal = '3/4"' THEN 7003
WHEN diameter_nominal = '60' THEN 7008
WHEN diameter_nominal = '40' THEN 7006
WHEN diameter_nominal = '90' THEN 7009
WHEN diameter_nominal = '1,25"' THEN 7005
WHEN diameter_nominal = '1,25' THEN 7005
WHEN diameter_nominal = '150' THEN 7012
WHEN diameter_nominal = '1 1/2"' THEN 7006
WHEN diameter_nominal = '300' THEN 7015
WHEN diameter_nominal = '180' THEN 7012
WHEN diameter_nominal = '1,5"' THEN 7006
WHEN diameter_nominal = '100' THEN 7010
WHEN diameter_nominal = '250/2"' THEN 7014
WHEN diameter_nominal = '2"' THEN 7007
WHEN diameter_nominal = '125/63' THEN 7008
WHEN diameter_nominal = '2''' THEN 7007
WHEN diameter_nominal = '1.25"' THEN 7005
WHEN diameter_nominal = '63/63' THEN 7008
END );

ALTER TABLE qwat_od.valve DROP COLUMN diameter_nominal;

/*
 qWat - QGIS Water Module

 SQL file :: nominal_diameter table
*/


CREATE TABLE qwat_vl.nominal_diameter () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.nominal_diameter ADD CONSTRAINT vl_nominal_diameter_pk PRIMARY KEY (id);

/* Values */
INSERT INTO qwat_vl.nominal_diameter (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.nominal_diameter (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.nominal_diameter (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7002, true, '15', 'NPS: 1/2 DN: 15 OD: 21.3', '15', 'NPS: 1/2 DN: 15 OD: 21.3', '15', 'NPS: 1/2 DN: 15 OD: 21.3');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7003, true, '20', 'NPS: 3/4 DN: 20 OD: 26.7', '20', 'NPS: 3/4 DN: 20 OD: 26.7', '20', 'NPS: 3/4 DN: 20 OD: 26.7');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7004, true, '25', 'NPS: 1 DN: 25 OD: 33.4', '25', 'NPS: 1 DN: 25 OD: 33.4', '25', 'NPS: 1 DN: 25 OD: 33.4');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7005, true, '32', 'NPS: 1 1/4 DN: 32 OD: 42.16', '32', 'NPS: 1 1/4 DN: 32 OD: 42.16', '32', 'NPS: 1 1/4 DN: 32 OD: 42.16');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7006, true, '40', 'NPS: 1 1/2 DN: 40 OD: 48.26', '40', 'NPS: 1 1/2 DN: 40 OD: 48.26', '40', 'NPS: 1 1/2 DN: 40 OD: 48.26');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7007, true, '50', 'NPS: 2 DN: 50 OD: 60.3', '50', 'NPS: 2 DN: 50 OD: 60.3', '50', 'NPS: 2 DN: 50 OD: 60.3');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7008, true, '65', 'NPS: 2 1/2 DN: 65 OD: 73.03', '65', 'NPS: 2 1/2 DN: 65 OD: 73.03', '65', 'NPS: 2 1/2 DN: 65 OD: 73.03');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7009, true, '80', 'NPS: 3 DN: 80 OD: 88.9', '80', 'NPS: 3 DN: 80 OD: 88.9', '80', 'NPS: 3 DN: 80 OD: 88.9');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7010, true, '100', 'NPS: 4 DN: 100 OD: 114.3', '100', 'NPS: 4 DN: 100 OD: 114.3', '100', 'NPS: 4 DN: 100 OD: 114.3');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7011, true, '125', 'NPS: 5 DN: 125 OD: 141.3', '125', 'NPS: 5 DN: 125 OD: 141.3', '125', 'NPS: 5 DN: 125 OD: 141.3');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7012, true, '150', 'NPS: 6 DN: 150 OD: 168.28', '150', 'NPS: 6 DN: 150 OD: 168.28', '150', 'NPS: 6 DN: 150 OD: 168.28');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7013, true, '200', 'NPS: 6 DN: 150 OD: 168.28', '200', 'NPS: 6 DN: 150 OD: 168.28', '200', 'NPS: 6 DN: 150 OD: 168.28');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7014, true, '250', 'NPS: 10 DN: 250 OD: 273.05', '250', 'NPS: 10 DN: 250 OD: 273.05', '250', 'NPS: 10 DN: 250 OD: 273.05');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7015, true, '300', 'NPS: 12 DN: 300 OD: 323.85', '300', 'NPS: 12 DN: 300 OD: 323.85', '300', 'NPS: 12 DN: 300 OD: 323.85');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7016, true, '350', 'NPS: 14 DN: 350 OD: 355.6', '350', 'NPS: 14 DN: 350 OD: 355.6', '350', 'NPS: 14 DN: 350 OD: 355.6');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7017, true, '400', 'NPS: 16 DN: 400 OD: 406.4', '400', 'NPS: 16 DN: 400 OD: 406.4', '400', 'NPS: 16 DN: 400 OD: 406.4');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7018, true, '450', 'NPS: 18 DN: 450 OD: 457.2', '450', 'NPS: 18 DN: 450 OD: 457.2', '450', 'NPS: 18 DN: 450 OD: 457.2');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7019, true, '500', 'NPS: 20 DN: 500 OD: 508', '500', 'NPS: 20 DN: 500 OD: 508', '500', 'NPS: 20 DN: 500 OD: 508');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7020, true, '600', 'NPS: 24 DN: 600 OD: 609.6', '600', 'NPS: 24 DN: 600 OD: 609.6', '600', 'NPS: 24 DN: 600 OD: 609.6');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7021, true, '700', 'NPS: 28 DN: 700 OD: 711.2', '700', 'NPS: 28 DN: 700 OD: 711.2', '700', 'NPS: 28 DN: 700 OD: 711.2');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7022, true, '800', 'NPS: 32 DN: 800 OD: 812.8', '800', 'NPS: 32 DN: 800 OD: 812.8', '800', 'NPS: 32 DN: 800 OD: 812.8');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7023, true, '900', 'NPS: 36 DN: 900 OD: 914.4', '900', 'NPS: 36 DN: 900 OD: 914.4', '900', 'NPS: 36 DN: 900 OD: 914.4');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7024, true, '1000', 'NPS: 40 DN: 1000 OD: 1016', '1000', 'NPS: 40 DN: 1000 OD: 1016', '1000', 'NPS: 40 DN: 1000 OD: 1016');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7025, true, '1050', 'NPS: 42 DN: 1050 OD: 1066.8', '1050', 'NPS: 42 DN: 1050 OD: 1066.8', '1050', 'NPS: 42 DN: 1050 OD: 1066.8');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7026, true, '1100', 'NPS: 44 DN: 1100 OD: 1117.6', '1100', 'NPS: 44 DN: 1100 OD: 1117.6', '1100', 'NPS: 44 DN: 1100 OD: 1117.6');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7027, true, '1200', 'NPS: 48 DN: 1200 OD: 1219.2', '1200', 'NPS: 48 DN: 1200 OD: 1219.2', '1200', 'NPS: 48 DN: 1200 OD: 1219.2');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7028, true, '1300', 'NPS: 52 DN: 1300 OD: 1320.8', '1300', 'NPS: 52 DN: 1300 OD: 1320.8', '1300', 'NPS: 52 DN: 1300 OD: 1320.8');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7029, true, '1400', 'NPS: 56 DN: 1400 OD: 1422.4', '1400', 'NPS: 56 DN: 1400 OD: 1422.4', '1400', 'NPS: 56 DN: 1400 OD: 1422.4');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7030, true, '1500', 'NPS: 60 DN: 1500 OD: 1524', '1500', 'NPS: 60 DN: 1500 OD: 1524', '1500', 'NPS: 60 DN: 1500 OD: 1524');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7031, true, '1600', 'NPS: 64 DN: 1600 OD: 1625.6', '1600', 'NPS: 64 DN: 1600 OD: 1625.6', '1600', 'NPS: 64 DN: 1600 OD: 1625.6');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7032, true, '1700', 'NPS: 68 DN: 1700 OD: 1727.2', '1700', 'NPS: 68 DN: 1700 OD: 1727.2', '1700', 'NPS: 68 DN: 1700 OD: 1727.2');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7033, true, '1800', 'NPS: 72 DN: 1800 OD: 1828.8', '1800', 'NPS: 72 DN: 1800 OD: 1828.8', '1800', 'NPS: 72 DN: 1800 OD: 1828.8');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7034, true, '1900', 'NPS: 76 DN: 1900 OD: 1930.4', '1900', 'NPS: 76 DN: 1900 OD: 1930.4', '1900', 'NPS: 76 DN: 1900 OD: 1930.4');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7035, true, '2000', 'NPS: 80 DN: 2000 OD: 2032', '2000', 'NPS: 80 DN: 2000 OD: 2032', '2000', 'NPS: 80 DN: 2000 OD: 2032');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7036, true, '2200', 'NPS: 88 DN: 2200 OD: 2235.2', '2200', 'NPS: 88 DN: 2200 OD: 2235.2', '2200', 'NPS: 88 DN: 2200 OD: 2235.2');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7037, true, '2400', 'NPS: 96 DN: 2400 OD: 2438.4', '2400', 'NPS: 96 DN: 2400 OD: 2438.4', '2400', 'NPS: 96 DN: 2400 OD: 2438.4');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7038, true, '2600', 'NPS: 104 DN: 2600 OD: 2641.6', '2600', 'NPS: 104 DN: 2600 OD: 2641.6', '2600', 'NPS: 104 DN: 2600 OD: 2641.6');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7039, true, '2800', 'NPS: 112 DN: 2800 OD: 2844.8', '2800', 'NPS: 112 DN: 2800 OD: 2844.8', '2800', 'NPS: 112 DN: 2800 OD: 2844.8');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7040, true, '3000', 'NPS: 120 DN: 3000 OD: 3048', '3000', 'NPS: 120 DN: 3000 OD: 3048', '3000', 'NPS: 120 DN: 3000 OD: 3048');
INSERT INTO qwat_vl.nominal_diameter (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro) VALUES (7041, true, '3200', 'NPS: 128 DN: 3200 OD: 3251.2', '3200', 'NPS: 128 DN: 3200 OD: 3251.2', '3200', 'NPS: 128 DN: 3200 OD: 3251.2');


ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_nominal_diameter FOREIGN KEY (fk_nominal_diameter) REFERENCES qwat_vl.nominal_diameter(id) MATCH FULL; CREATE INDEX fki_valve_fk_nominal_diameter ON qwat_od.valve(fk_nominal_diameter);
