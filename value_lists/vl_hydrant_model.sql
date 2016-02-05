/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant_model_sup
*/

CREATE TABLE qwat_vl.hydrant_model_sup () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.hydrant_model_sup ADD CONSTRAINT vl_hydrant_model_sup_pk PRIMARY KEY (id);

/* VALUES */
INSERT INTO qwat_vl.hydrant_model_sup (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.hydrant_model_sup (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.hydrant_model_sup (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7201,'Hawle');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7202,'Hawle_H4');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7203,'Hinni');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7204,'Hinni_6000');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7205,'Hinni_6006');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7206,'VonRoll');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7207,'VonRoll_4105_Mod_1896');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7208,'VonRoll_4107_Mod_1935');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7209,'VonRoll_7500_Mod_1955');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7210,'VonRoll_7502_Mod_1970');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7211,'VonRoll_Hy_classic_Serie_5500');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7212,'VonRoll_Hy_plus_Serie_5700');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7213,'VonRoll_Hy_5000s_Serie_5400_Cobra');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7214,'VonRoll_Hy_deco_Mod_1896_Nostalgie');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7215,'VonRoll_Hytec_5601');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7216,'VonRoll_Hytec_5602');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7217,'VonRoll_Hytec_5603');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7218,'VonRoll_Hytec_5607');
INSERT INTO qwat_vl.hydrant_model_sup (id,value_fr) VALUES (7219,'VonRoll_5000_Mod_1989');


/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant_model_inf
*/



CREATE TABLE qwat_vl.hydrant_model_inf () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.hydrant_model_inf ADD CONSTRAINT vl_hydrant_model_inf_pk PRIMARY KEY (id);

/* VALUES */
INSERT INTO qwat_vl.hydrant_model_inf (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.hydrant_model_inf (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.hydrant_model_inf (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7301,'Hawle');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7302,'Hawle_H4');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7303,'Hinni');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7304,'Hinni_Standard');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7305,'Hinri_Double_fermeture');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7306,'VonRoll');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7307,'VonRoll_4105_Mod_1896');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7308,'VonRoll_4107_Mod_1935');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7309,'VonRolI_7500');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7310,'VonRoll_5500');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7311,'VonRoll_fix');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7312,'VonFloll_reglable');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7313,'VonRoll_vario');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7314,'VonRoll_ufFix');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7315,'VonRoll_varial');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7316,'VonRoll_1955');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7317,'VonRoll_1989_5000');
INSERT INTO qwat_vl.hydrant_model_inf (id,value_fr) VALUES (7318,'VonRoll_2007_5000');
