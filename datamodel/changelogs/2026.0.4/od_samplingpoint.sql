/*
	qWat - QGIS Water Module
	
	SQL file :: samplingpoint table
*/


/* create */
CREATE TABLE qwat_od.samplingpoint ();
COMMENT ON TABLE qwat_od.samplingpoint IS 'Table for sampling points. Inherits from node.';

ALTER TABLE qwat_od.samplingpoint ADD COLUMN id integer NOT NULL REFERENCES qwat_od.network_element(id) PRIMARY KEY;







 
