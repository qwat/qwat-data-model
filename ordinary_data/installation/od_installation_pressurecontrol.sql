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

/* EDITABE VIEW */
SELECT qwat_sys.fn_installation_view_create('installation_pressurecontrol', ARRAY['fk_pressurecontrol_type']);

/* EXPORT VIEW */
CREATE OR REPLACE VIEW qwat_od.vw_installation_pressurecontrol_fr AS
SELECT
	i.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype,
	pressurecontrol_type.value_fr AS type
	FROM qwat_od.vw_edit_installation_pressurecontrol i
	INNER JOIN      qwat_vl.status               ON status.id               = i.fk_status
	INNER JOIN      qwat_od.distributor          ON distributor.id          = i.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type          ON remote_type.id          = i.fk_remote
	INNER JOIN      qwat_vl.watertype            ON watertype.id            = i.fk_watertype
	-- specific
	INNER JOIN      qwat_vl.pressurecontrol_type ON pressurecontrol_type.id = i.fk_pressurecontrol_type;





