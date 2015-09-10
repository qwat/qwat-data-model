/*
	qWat - QGIS Water Module

	SQL file :: installation pump
*/


/* CREATE TABLE */
CREATE TABLE qwat_od.installation_pump ();

/* specific to pumps */
ALTER TABLE qwat_od.installation_pump ADD COLUMN id NOT NULL REFERENCES qwat_od.installation(id) PRIMARY KEY ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN fk_type           smallint     ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN fk_pipe_in        integer      ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN fk_pipe_out       integer      ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN fk_operating      smallint     ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN altitude          decimal(10,3);
ALTER TABLE qwat_od.installation_pump ADD COLUMN no_pumps          smallint     ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN rejected_flow     decimal(10,2);
ALTER TABLE qwat_od.installation_pump ADD COLUMN manometric_height decimal(10,2);

/* Constraints */                                                                                                                                                                                                                                
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_fk_type     FOREIGN KEY (fk_type)     REFERENCES qwat_vl.pump_type(id) MATCH FULL;   CREATE INDEX fki_installation_pump_vl_pump_type ON qwat_od.installation_pump(fk_type)     ;
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_fk_pipe_in  FOREIGN KEY (fk_pipe_in)  REFERENCES qwat_od.pipe(id)      MATCH FULL; CREATE INDEX fki_installation_pump_pipe_in   ON qwat_od.installation_pump(fk_pipe_in)  ;
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_fk_pipe_out FOREIGN KEY (fk_pipe_out) REFERENCES qwat_od.pipe(id)      MATCH FULL; CREATE INDEX fki_installation_pump_pipe_out  ON qwat_od.installation_pump(fk_pipe_out) ;


/* VIEW */
CREATE OR REPLACE VIEW qwat_od.vw_installation_pump_fr AS
SELECT
	installation_pump.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype,
	pump_type.value_fr AS type
	FROM qwat_od.installation_pump
	INNER JOIN      qwat_vl.status          ON status.id      = installation_pump.fk_status
	INNER JOIN      qwat_od.distributor     ON distributor.id = installation_pump.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type     ON remote_type.id = installation_pump.fk_remote
	INNER JOIN      qwat_vl.watertype       ON watertype.id   = installation_pump.fk_watertype
	INNER JOIN      qwat_vl.pump_type       ON pump_type.id   = installation_pump.fk_type;


