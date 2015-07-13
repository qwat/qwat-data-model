/*
	qWat - QGIS Water Module

	SQL file :: installation pressure control
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.installation_pressurecontrol (id serial PRIMARY KEY);

COMMENT ON TABLE qwat_od.installation_pressurecontrol IS '';

/* common columns to all installations*/
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN name               varchar(40)  ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN identification     varchar(25)  ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN fk_installation    integer                ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN fk_status          integer not null       ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN fk_distributor     integer not null       ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN fk_remote          integer                ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN fk_watertype       integer not null       ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN schema_visible     boolean not null default true ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN altitude      decimal(10,3)          ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN remark             text         ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN year               smallint    CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN year_end           smallint    CHECK (year_end IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN open_water_surface boolean     default false  ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN parcel             varchar(30)  ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN eca                varchar(30)  ;

/* LABELS */
SELECT qwat_od.fn_label_create_fields('installation_pressurecontrol');

/* specific to pressurecontrol */
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN fk_type            integer not null       ;

/* GEOMETRY */
/*                                 (table_name,                srid, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('installation_pressurecontrol', :SRID,true,    true,       true,             false,    true,          false);

/* CONSTRAINTS */
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_fk_installation FOREIGN KEY (fk_installation) REFERENCES qwat_od.installation_building(id) MATCH FULL; CREATE INDEX fki_installation_pressurecontrol_fk_installation ON qwat_od.installation_pressurecontrol(fk_installation);
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_fk_status       FOREIGN KEY (fk_status)       REFERENCES qwat_vl.status(id)                MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_fk_status       ON qwat_od.installation_pressurecontrol(fk_status)      ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_fk_distributor  FOREIGN KEY (fk_distributor)  REFERENCES qwat_od.distributor(id)           MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_fk_distributor  ON qwat_od.installation_pressurecontrol(fk_distributor) ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_fk_remote       FOREIGN KEY (fk_remote)       REFERENCES qwat_vl.remote_type(id)           MATCH FULL; CREATE INDEX fki_installation_pressurecontrol_fk_remote       ON qwat_od.installation_pressurecontrol(fk_remote)      ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_fk_watertype    FOREIGN KEY (fk_watertype)    REFERENCES qwat_vl.watertype(id)             MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_watertype       ON qwat_od.installation_pressurecontrol(fk_watertype)   ;
/* SPECIFIC */
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





