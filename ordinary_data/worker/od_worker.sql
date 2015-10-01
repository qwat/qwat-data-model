/*
	qWat - QGIS Water Module
	
	SQL file :: worker
*/

CREATE TABLE qwat_od.worker (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.worker IS 'Table for worker.';


/* COLUMNS */
ALTER TABLE qwat_od.worker ADD COLUMN last_name  text ;
ALTER TABLE qwat_od.worker ADD COLUMN first_name text ;
ALTER TABLE qwat_od.worker ADD COLUMN date_entry date;
ALTER TABLE qwat_od.worker ADD COLUMN date_end   date;
ALTER TABLE qwat_od.worker ADD COLUMN fk_type    integer[];
