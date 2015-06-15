/*
	qWat - QGIS Water Module
	
	SQL file :: worker
*/

DROP TABLE IF EXISTS qwat_od.worker CASCADE;
CREATE TABLE qwat_od.worker (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.worker IS 'Table for worker.';



/* COLUMNS */
ALTER TABLE qwat_od.worker ADD COLUMN name    varchar(40) default '';
ALTER TABLE qwat_od.worker ADD COLUMN date_entry    		date;
ALTER TABLE qwat_od.worker ADD COLUMN date_end	    		date;
ALTER TABLE qwat_od.worker ADD COLUMN fk_type    	   integer[];
