/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber_type table
*/


/* CREATE */
CREATE TABLE qwat_vl.subscriber_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.subscriber_type ADD CONSTRAINT vl_subscriber_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.subscriber_type IS 'type for subscriber.';


/* VALUES */
INSERT INTO qwat_vl.subscriber_type (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'altul');
INSERT INTO qwat_vl.subscriber_type (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscut');
INSERT INTO qwat_vl.subscriber_type (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.subscriber_type (id, value_en, value_fr,short_fr,value_ro) VALUES (9401, 'Subscriber','Abonnement','abo','abonat');
INSERT INTO qwat_vl.subscriber_type (id, value_fr,short_fr,value_ro) VALUES (9402, 'Arrosage'  ,'arr','irigare/udare');
INSERT INTO qwat_vl.subscriber_type (id, value_en, value_fr,short_fr,value_ro) VALUES (9403, 'Fountain','Fontaine'  ,'font','fântână cişmea');
INSERT INTO qwat_vl.subscriber_type (id, value_en, value_fr,short_fr,value_ro) VALUES (9404, 'WC', 'WC'        ,'wc', 'WC');
INSERT INTO qwat_vl.subscriber_type (id, value_fr,short_fr,value_ro) VALUES (9405, 'Sprinkler' ,'spkr','stropitoare/sprinkler');




