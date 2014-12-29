/*
	qWat - QGIS Water Module
	
	SQL file :: overflow
*/

DROP TABLE IF EXISTS qwat.vl_overflow CASCADE;
CREATE TABLE qwat.vl_overflow (id integer not null, CONSTRAINT "vl_overflow_pk" PRIMARY KEY (id));

/* COLUMNS */
ALTER TABLE qwat.vl_overflow ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_overflow ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE qwat.vl_overflow ADD COLUMN value_fr varchar(30) default '' ;
ALTER TABLE qwat.vl_overflow ADD COLUMN value_ro varchar(30) default '' ;

/* CONTENT */
INSERT INTO qwat.vl_overflow (id,value_en,value_fr,value_ro) VALUES (2201,'dumped','en décharge','aruncată');
INSERT INTO qwat.vl_overflow (id,value_en,value_fr,value_ro) VALUES (2202,'collected','récupéré','recuperată');
