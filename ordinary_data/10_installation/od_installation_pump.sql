/*
	qWat - QGIS Water Module

	SQL file :: installation pump
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.installation_pump CASCADE;
CREATE TABLE qwat_od.installation_pump (id serial PRIMARY KEY);

COMMENT ON TABLE qwat_od.installation_pump IS '';

/* common columns to all installations*/
ALTER TABLE qwat_od.installation_pump ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN identification     varchar(25) default '';
ALTER TABLE qwat_od.installation_pump ADD COLUMN id_installation    integer                ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN id_status          integer not null       ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN id_distributor     integer not null       ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN id_remote          integer                ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN id_watertype       integer not null       ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN schema_visible     boolean not null default true ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN remark             text default '' ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN year smallint CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation_pump ADD COLUMN open_water_surface boolean default False  ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN parcel             varchar(30) default '' ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN eca                varchar(30) default '' ; COMMENT ON COLUMN qwat_od.installation_pump.eca IS 'fire brigade id';

/* LABELS */
SELECT qwat_od.fn_label_create_fields('installation_pump');

/* specific to pumps */
ALTER TABLE qwat_od.installation_pump ADD COLUMN id_type           smallint     ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN id_pipe_in        integer      ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN id_pipe_out       integer      ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN id_operating      smallint     ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN altitude          decimal(10,3);
ALTER TABLE qwat_od.installation_pump ADD COLUMN no_pumps          smallint     ;
ALTER TABLE qwat_od.installation_pump ADD COLUMN rejected_flow     decimal(10,2);
ALTER TABLE qwat_od.installation_pump ADD COLUMN manometric_height decimal(10,2);

/* geometry */
/*                                 ( table_name,    is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('installation_pump',true,    true,       true,             false,    true,          false);

/* Constraints */
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_id_installation FOREIGN KEY (id_installation) REFERENCES qwat_od.installation_building(id) MATCH SIMPLE; CREATE INDEX fki_installation_pump_id_installation ON qwat_od.installation_pump(id_installation);
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_id_status       FOREIGN KEY (id_status)       REFERENCES qwat_vl.status(id)                MATCH FULL;   CREATE INDEX fki_installation_pump_id_status       ON qwat_od.installation_pump(id_status)      ;
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES qwat_od.distributor(id)           MATCH FULL;   CREATE INDEX fki_installation_pump_id_distributor  ON qwat_od.installation_pump(id_distributor) ;
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_id_remote       FOREIGN KEY (id_remote)       REFERENCES qwat_vl.remote_type(id)           MATCH SIMPLE; CREATE INDEX fki_installation_pump_id_remote       ON qwat_od.installation_pump(id_remote)      ;
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_id_watertype    FOREIGN KEY (id_watertype)    REFERENCES qwat_vl.watertype(id)             MATCH FULL;   CREATE INDEX fki_installation_pump_watertype    ON qwat_od.installation_pump(id_watertype)   ;
/* specific */                                                                                                                                                                                                                                     
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_id_type     FOREIGN KEY (id_type)     REFERENCES qwat_vl.pump_type(id) MATCH FULL;   CREATE INDEX fki_installation_pump_vl_pump_type ON qwat_od.installation_pump(id_type)     ;
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_id_pipe_in  FOREIGN KEY (id_pipe_in)  REFERENCES qwat_od.pipe(id)      MATCH SIMPLE; CREATE INDEX fki_installation_pump_pipe_in   ON qwat_od.installation_pump(id_pipe_in)  ;
ALTER TABLE qwat_od.installation_pump ADD CONSTRAINT installation_pump_id_pipe_out FOREIGN KEY (id_pipe_out) REFERENCES qwat_od.pipe(id)      MATCH SIMPLE; CREATE INDEX fki_installation_pump_pipe_out  ON qwat_od.installation_pump(id_pipe_out) ;


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
	INNER JOIN      qwat_vl.status          ON status.id      = installation_pump.id_status
	INNER JOIN      qwat_od.distributor     ON distributor.id = installation_pump.id_distributor
	LEFT OUTER JOIN qwat_vl.remote_type     ON remote_type.id = installation_pump.id_remote
	INNER JOIN      qwat_vl.watertype       ON watertype.id   = installation_pump.id_watertype
	INNER JOIN      qwat_vl.pump_type       ON pump_type.id   = installation_pump.id_type;


