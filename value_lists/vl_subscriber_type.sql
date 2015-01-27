/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber_type table
*/


/* CREATE */
DROP TABLE IF EXISTS qwat_vl.subscriber_type CASCADE;
CREATE TABLE qwat_vl.subscriber_type ( id integer not null, CONSTRAINT "subscriber_type_pk" PRIMARY KEY (id) );
COMMENT ON TABLE qwat_vl.subscriber_type IS 'type for subscriber.';

/* COLUMNS*/
ALTER TABLE qwat_vl.subscriber_type ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.subscriber_type ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE qwat_vl.subscriber_type ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE qwat_vl.subscriber_type ADD COLUMN value_ro VARCHAR(30) default '';
ALTER TABLE qwat_vl.subscriber_type ADD COLUMN short_fr VARCHAR(6) default '';
ALTER TABLE qwat_vl.subscriber_type ADD COLUMN short_en VARCHAR(6) default '';
ALTER TABLE qwat_vl.subscriber_type ADD COLUMN short_ro VARCHAR(6) default '';

/* VALUES */
INSERT INTO qwat_vl.subscriber_type (id, value_fr,short_fr,value_ro) VALUES (9401, 'Abonnement','abo','abonat');
INSERT INTO qwat_vl.subscriber_type (id, value_fr,short_fr,value_ro) VALUES (9402, 'Arrosage'  ,'arr','irigare/udare');
INSERT INTO qwat_vl.subscriber_type (id, value_fr,short_fr,value_ro) VALUES (9403, 'Fontaine'  ,'font','fântană');
INSERT INTO qwat_vl.subscriber_type (id, value_fr,short_fr,value_ro) VALUES (9404, 'WC'        ,'wc', 'WC');
INSERT INTO qwat_vl.subscriber_type (id, value_fr,short_fr,value_ro) VALUES (9405, 'Sprinkler' ,'spkr','stropitoare/sprinkler');
