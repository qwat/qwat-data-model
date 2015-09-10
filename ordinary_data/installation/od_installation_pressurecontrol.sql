/*
	qWat - QGIS Water Module

	SQL file :: installation pressure control
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.installation_pressurecontrol ();

/* specific to pressurecontrol */
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN fkid NOT NULL REFERENCES qwat_od.installation(id) PRIMARY KEY ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN fk_type integer not null ;

/* CONSTRAINTS */
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_fk_type         FOREIGN KEY (fk_type)         REFERENCES qwat_vl.pressurecontrol_type(id)  MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_type            ON qwat_od.installation_pressurecontrol(fk_type)        ;

/* VIEW */
CREATE OR REPLACE VIEW qwat_od.vw_installation_pressurecontrol_fr AS
SELECT
	installation_pressurecontrol.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype,
	pressurecontrol_type.value_fr AS type
	FROM qwat_od.installation_pressurecontrol
	INNER JOIN      qwat_vl.status               ON status.id               = installation_pressurecontrol.fk_status
	INNER JOIN      qwat_od.distributor          ON distributor.id          = installation_pressurecontrol.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type          ON remote_type.id          = installation_pressurecontrol.fk_remote
	INNER JOIN      qwat_vl.watertype            ON watertype.id            = installation_pressurecontrol.fk_watertype
	INNER JOIN      qwat_vl.pressurecontrol_type ON pressurecontrol_type.id = installation_pressurecontrol.fk_type;





