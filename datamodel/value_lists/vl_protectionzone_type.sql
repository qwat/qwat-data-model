/*
	qWat - QGIS Water Module
	
	SQL file :: protectionzone_type table
*/

/* CREATE */
CREATE TABLE qwat_vl.protectionzone_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.protectionzone_type ADD CONSTRAINT vl_protectionzone_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.protectionzone_type
  IS 'type of protection zone.

Specifc to Switzerland:

Groundwater protection zones are the most incisive tool available for planning purposes. Zones of this kind are to be designated around all groundwater wells serving the public interest.

In the groundwater protection zones surrounding drinking water installations (groundwater wells, artificial recharge facilities), significant restrictions are imposed on human activities. The regulations become less stringent as one moves from the centre to the periphery:

1. Wellhead protection zone S1
The zone S1 comprises the area immediately surrounding a groundwater well or artificial recharge facility (at least 10 m around the well and around the collection system). In this zone, only construction work and activities connected with drinking water supply are permitted. The aim is to prevent damage to the facilities or direct contamination of the water abstracted. The zone S1 should therefore be purchased and fenced in by the drinking water supplier.

2. Inner protection zone S2
The inner protection zone S2 is primarily designed to prevent contamination of drinking water with pathogenic microorganisms and to ensure that groundwater flows are not adversely affected or obstructed as they approach the well.

In this zone, the spreading of liquid manure is therefore prohibited, as are the infiltration of wastewater and the construction of buildings and installations.

3. Outer protection zone S3
The outer protection zone is designed to ensure that, in the event of an accident, sufficient time and space are available to ward off any hazards to drinking water. Thus, facilities that pose a hazard to groundwater (e.g. petrol stations) are not allowed to be located in zone S3. Wastewater seepage and gravel extraction are likewise prohibited in this area.

Source: http://www.bafu.admin.ch/grundwasser/07483/07485/10037/index.html?lang=en';

/* CONTENT */
INSERT INTO qwat_vl.protectionzone_type (id, short_en, value_en, short_fr, value_fr, short_ro, value_ro ) VALUES (101, 'Other', 'Other', 'Autre', 'Autre', 'Alta', 'Alta');
INSERT INTO qwat_vl.protectionzone_type (id, short_en, value_en, short_fr, value_fr, short_ro, value_ro ) VALUES (102, 'Unknown', 'Unknown', 'Inconnu', 'Inconnu', 'Nec.', 'Necunoscută');
INSERT INTO qwat_vl.protectionzone_type (id, short_en, value_en, short_fr, value_fr, short_ro, value_ro ) VALUES (103, 'To determ.', 'To be determined', 'À dét.', 'à déterminer','De det.', 'De determinat');

INSERT INTO qwat_vl.protectionzone_type (id,short_en,value_en,short_fr,value_fr,short_ro,value_ro) VALUES (9501,'S1','S1 protection zone','S1','Zone de protection S1','S1','Zonă de protecţie S1');
INSERT INTO qwat_vl.protectionzone_type (id,short_en,value_en,short_fr,value_fr,short_ro,value_ro) VALUES (9502,'S2','S2 protection zone','S2','Zone de protection S2','S2','Zonă de protecţie S2');
INSERT INTO qwat_vl.protectionzone_type (id,short_en,value_en,short_fr,value_fr,short_ro,value_ro) VALUES (9503,'S3','S3 protection zone','S3','Zone de protection S3','S3','Zonă de protecţie S3');
INSERT INTO qwat_vl.protectionzone_type (id,short_en,value_en,short_fr,value_fr,short_ro,value_ro) VALUES (9504,'PP','Protection perimeter','PP','Périmètre de protection','PP','Perimetru de protecţie');
INSERT INTO qwat_vl.protectionzone_type (id,short_en,value_en,short_fr,value_fr,short_ro,value_ro) VALUES (9505,'Zo','Surface Water protection zone','Zo','Zone de protection des eaux de surface','Zo','Zonă de protecţie a apelor de suprafaţă');




