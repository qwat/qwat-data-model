/*
	qWat - QGIS Water Module
	
	SQL file :: installation treatment
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.treatment ();

/* specific to treatment */
ALTER TABLE qwat_od.treatment ADD COLUMN id integer NOT NULL REFERENCES qwat_od.installation(id) PRIMARY KEY ;
ALTER TABLE qwat_od.treatment ADD COLUMN sanitization_uv               boolean      ;
ALTER TABLE qwat_od.treatment ADD COLUMN sanitization_chlorine_liquid  boolean      ;
ALTER TABLE qwat_od.treatment ADD COLUMN sanitization_chlorine_gazeous boolean      ;
ALTER TABLE qwat_od.treatment ADD COLUMN sanitization_ozone            boolean      ;
ALTER TABLE qwat_od.treatment ADD COLUMN filtration_membrane           boolean      ;
ALTER TABLE qwat_od.treatment ADD COLUMN filtration_sandorgravel       boolean      ;
ALTER TABLE qwat_od.treatment ADD COLUMN flocculation                  boolean      ;
ALTER TABLE qwat_od.treatment ADD COLUMN activatedcharcoal             boolean      ;
ALTER TABLE qwat_od.treatment ADD COLUMN settling                      boolean      ;
ALTER TABLE qwat_od.treatment ADD COLUMN treatment_capacity            decimal(10,2);

