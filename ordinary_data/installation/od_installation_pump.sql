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


