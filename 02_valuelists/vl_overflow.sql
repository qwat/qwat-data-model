/*
	qWat - QGIS Water Module
	
	SQL file :: overflow
*/

DROP TABLE IF EXISTS qwat_vl.overflow CASCADE;
CREATE TABLE qwat_vl.overflow (id integer not null, CONSTRAINT "overflow_pk" PRIMARY KEY (id));

/* COLUMNS */
ALTER TABLE qwat_vl.overflow ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.overflow ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE qwat_vl.overflow ADD COLUMN value_fr varchar(30) default '' ;
ALTER TABLE qwat_vl.overflow ADD COLUMN value_ro varchar(30) default '' ;

/* CONTENT */
INSERT INTO qwat_vl.overflow (id,value_en,value_fr,value_ro) VALUES (2201,'dumped','en décharge','aruncată');
INSERT INTO qwat_vl.overflow (id,value_en,value_fr,value_ro) VALUES (2202,'collected','récupéré','recuperată');
