/*
	qWat - QGIS Water Module
	
	SQL file :: distributors/companies tables
*/


CREATE TABLE qwat_od.distributor ( id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.distributor IS 'Companies and distributors list.';

/* Columns */
ALTER TABLE qwat_od.distributor ADD COLUMN name VARCHAR(30) ;

/* Constraints */
ALTER TABLE qwat_od.distributor ADD CONSTRAINT distributor_name UNIQUE (name);



