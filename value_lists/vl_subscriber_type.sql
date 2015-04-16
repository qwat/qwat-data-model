/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber_type table
*/


/* CREATE */
DROP TABLE IF EXISTS qwat_vl.subscriber_type CASCADE;
CREATE TABLE qwat_vl.subscriber_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.subscriber_type ADD CONSTRAINT vl_subscriber_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.subscriber_type IS 'type for subscriber.';


/* VALUES */
INSERT INTO qwat_vl.subscriber_type (id, value_fr,short_fr,value_ro) VALUES (9401, 'Abonnement','abo','abonat');
INSERT INTO qwat_vl.subscriber_type (id, value_fr,short_fr,value_ro) VALUES (9402, 'Arrosage'  ,'arr','irigare/udare');
INSERT INTO qwat_vl.subscriber_type (id, value_fr,short_fr,value_ro) VALUES (9403, 'Fontaine'  ,'font','fântană');
INSERT INTO qwat_vl.subscriber_type (id, value_fr,short_fr,value_ro) VALUES (9404, 'WC'        ,'wc', 'WC');
INSERT INTO qwat_vl.subscriber_type (id, value_fr,short_fr,value_ro) VALUES (9405, 'Sprinkler' ,'spkr','stropitoare/sprinkler');
