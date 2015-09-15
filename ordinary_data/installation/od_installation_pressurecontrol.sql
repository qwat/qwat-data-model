/*
	qWat - QGIS Water Module

	SQL file :: installation pressure control
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.installation_pressurecontrol ();

/* specific to pressurecontrol */
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN id integer NOT NULL REFERENCES qwat_od.installation(id) PRIMARY KEY ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN fk_pressurecontrol_type integer not null ;

/* CONSTRAINTS */
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_fk_type FOREIGN KEY (fk_pressurecontrol_type) REFERENCES qwat_vl.pressurecontrol_type(id) MATCH FULL; CREATE INDEX fki_installation_pressurecontrol_type ON qwat_od.installation_pressurecontrol(fk_pressurecontrol_type);



