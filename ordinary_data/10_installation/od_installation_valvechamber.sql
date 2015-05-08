	/*
	qWat - QGIS Water Module

	SQL file :: installation pressure control
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.installation_valvechamber CASCADE;
CREATE TABLE qwat_od.installation_valvechamber (id serial PRIMARY KEY);

COMMENT ON TABLE qwat_od.installation_valvechamber IS '';

/* common columns to all installations*/
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN identification     varchar(25) default '' ;
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN fk_installation    integer                ;
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN fk_status          integer not null       ;
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN fk_distributor     integer not null       ;
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN fk_remote          integer                ;
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN fk_watertype       integer not null       ;
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN schema_visible     boolean not null default true ;
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN remark             text        default '' ;
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN year               smallint    CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN open_water_surface boolean     default false  ;
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN parcel             varchar(30) default '' ;
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN eca                varchar(30) default '' ;

/* LABELS */
SELECT qwat_od.fn_label_create_fields('installation_valvechamber');

/* specific to pressurecontrol */
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN networkseparation  boolean               ;
ALTER TABLE qwat_od.installation_valvechamber ADD COLUMN meter              boolean               ;


/* geometry */
/*                                 ( table_name,            is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('installation_valvechamber',true,    true,       true,             false,    true,          false);

/* Constraints */
ALTER TABLE qwat_od.installation_valvechamber ADD CONSTRAINT installation_valvechamber_fk_installation FOREIGN KEY (fk_installation) REFERENCES qwat_od.installation_building(id) MATCH SIMPLE; CREATE INDEX fki_installation_valvechamber_fk_installation ON qwat_od.installation_valvechamber(fk_installation);
ALTER TABLE qwat_od.installation_valvechamber ADD CONSTRAINT installation_valvechamber_fk_status       FOREIGN KEY (fk_status)       REFERENCES qwat_vl.status(id)                MATCH FULL;   CREATE INDEX fki_installation_valvechamber_fk_status       ON qwat_od.installation_valvechamber(fk_status)      ;
ALTER TABLE qwat_od.installation_valvechamber ADD CONSTRAINT installation_valvechamber_fk_distributor  FOREIGN KEY (fk_distributor)  REFERENCES qwat_od.distributor(id)           MATCH FULL;   CREATE INDEX fki_installation_valvechamber_fk_distributor  ON qwat_od.installation_valvechamber(fk_distributor) ;
ALTER TABLE qwat_od.installation_valvechamber ADD CONSTRAINT installation_valvechamber_fk_remote       FOREIGN KEY (fk_remote)       REFERENCES qwat_vl.remote_type(id)           MATCH SIMPLE; CREATE INDEX fki_installation_valvechamber_fk_remote       ON qwat_od.installation_valvechamber(fk_remote)      ;
ALTER TABLE qwat_od.installation_valvechamber ADD CONSTRAINT installation_valvechamber_fk_watertype    FOREIGN KEY (fk_watertype)    REFERENCES qwat_vl.watertype(id)             MATCH FULL;   CREATE INDEX fki_installation_valvechamber_watertype    ON qwat_od.installation_valvechamber(fk_watertype)   ;

/* VIEW */
CREATE OR REPLACE VIEW qwat_od.vw_installation_valvechamber_fr AS
SELECT
	installation_valvechamber.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype
	FROM qwat_od.installation_valvechamber
	INNER JOIN      qwat_vl.status          ON status.id          = installation_valvechamber.fk_status
	INNER JOIN      qwat_od.distributor     ON distributor.id     = installation_valvechamber.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type     ON remote_type.id     = installation_valvechamber.fk_remote
	INNER JOIN      qwat_vl.watertype       ON watertype.id       = installation_valvechamber.fk_watertype;
