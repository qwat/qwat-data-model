/*
	qWat - QGIS Water Module

	SQL file :: installation pump
*/


/* CREATE TABLE */
CREATE TABLE qwat_od.installation_pump ();

/* specific to pumps */
ALTER TABLE qwat_od.installation_pump ADD COLUMN id integer NOT NULL REFERENCES qwat_od.installation(id) PRIMARY KEY ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN fk_pump_type      smallint     ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN fk_pipe_in        integer      ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN fk_pipe_out       integer      ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN fk_operating      smallint     ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN no_pumps          smallint     ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN rejected_flow     decimal(10,2);
ALTER TABLE qwat_od.installation_pump ADD COLUMN manometric_height decimal(10,2);

/* Constraints */                                                                                                                                                                                                                                
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_fk_type     FOREIGN KEY (fk_pump_type) REFERENCES qwat_vl.pump_type(id) MATCH FULL; CREATE INDEX fki_installation_pump_vl_pump_type ON qwat_od.installation_pump(fk_pump_type)     ;
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_fk_pipe_in  FOREIGN KEY (fk_pipe_in)   REFERENCES qwat_od.pipe(id)      MATCH FULL; CREATE INDEX fki_installation_pump_pipe_in   ON qwat_od.installation_pump(fk_pipe_in)  ;
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_fk_pipe_out FOREIGN KEY (fk_pipe_out)  REFERENCES qwat_od.pipe(id)      MATCH FULL; CREATE INDEX fki_installation_pump_pipe_out  ON qwat_od.installation_pump(fk_pipe_out) ;

/* EDITABE VIEW */
SELECT qwat_sys.fn_installation_view_create('installation_pump', ARRAY['fk_pump_type','fk_pipe_in','fk_pipe_out','fk_operating','no_pumps','rejected_flow','manometric_height']);

/* EXPORT VIEW */
CREATE OR REPLACE VIEW qwat_od.vw_installation_pump_fr AS
SELECT
	i.*,
	status.value_fr      AS status,
	status.active        AS active,
	distributor.name     AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr   AS watertype,
	pump_type.value_fr   AS type
	FROM qwat_od.vw_edit_installation_pump i
	INNER JOIN      qwat_vl.status          ON status.id      = i.fk_status
	INNER JOIN      qwat_od.distributor     ON distributor.id = i.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type     ON remote_type.id = i.fk_remote
	INNER JOIN      qwat_vl.watertype       ON watertype.id   = i.fk_watertype
	-- specific
	INNER JOIN      qwat_vl.pump_type       ON pump_type.id   = i.fk_pump_type;


