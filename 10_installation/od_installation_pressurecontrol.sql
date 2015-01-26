/*
	qWat - QGIS Water Module

	SQL file :: installation pressure control
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.installation_pressurecontrol CASCADE;
CREATE TABLE qwat_od.installation_pressurecontrol (id serial PRIMARY KEY);

COMMENT ON TABLE qwat_od.installation_pressurecontrol IS '';

/* common columns to all installations*/
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN name               varchar(40) default '' ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN identification     varchar(25) default '' ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN id_installation    integer                ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN id_status          integer not null       ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN id_distributor     integer not null       ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN id_remote          integer                ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN id_watertype       integer not null       ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN schema_visible     boolean not null default true ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN remark             text        default '' ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN year               smallint    CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN open_water_surface boolean     default false  ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN parcel             varchar(30)  default '';
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN eca                varchar(30)  default '';
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN label_remark        varchar(150) default '';
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN label_visible_1    smallint default 1;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN label_x_1       double precision default null;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN label_y_1       double precision default null;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN label_r_1       double precision default null;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN label_visible_2 smallint default 1;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN label_x_2       double precision default null;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN label_y_2       double precision default null;
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN label_r_2       double precision default null;
/* specific to pressurecontrol */
ALTER TABLE qwat_od.installation_pressurecontrol ADD COLUMN id_type            integer not null       ;


/* GEOMETRY */
/*                                 (table_name,                is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('installation_pressurecontrol',true,    true,       true,             false,    true,          false);

/* CONSTRAINTS */
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_installation FOREIGN KEY (id_installation) REFERENCES qwat_od.installation_building(id) MATCH SIMPLE; CREATE INDEX fki_installation_pressurecontrol_id_installation ON qwat_od.installation_pressurecontrol(id_installation);
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_status       FOREIGN KEY (id_status)       REFERENCES qwat_vl.status(id)                MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_id_status       ON qwat_od.installation_pressurecontrol(id_status)      ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES qwat_od.distributor(id)           MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_id_distributor  ON qwat_od.installation_pressurecontrol(id_distributor) ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_remote       FOREIGN KEY (id_remote)       REFERENCES qwat_vl.remote_type(id)                MATCH SIMPLE; CREATE INDEX fki_installation_pressurecontrol_id_remote       ON qwat_od.installation_pressurecontrol(id_remote)      ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_watertype    FOREIGN KEY (id_watertype)    REFERENCES qwat_vl.watertype(id)             MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_watertype    ON qwat_od.installation_pressurecontrol(id_watertype)   ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_label_visible_1 FOREIGN KEY (label_visible_1) REFERENCES qwat_vl.visible(vl_code_int)      MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_labelvisible_1  ON qwat_od.installation_pressurecontrol(label_visible_1) ;
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_label_visible_2 FOREIGN KEY (label_visible_2) REFERENCES qwat_vl.visible(vl_code_int)      MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_labelvisible_2  ON qwat_od.installation_pressurecontrol(label_visible_2) ;
/* SPECIFIC */
ALTER TABLE qwat_od.installation_pressurecontrol ADD CONSTRAINT installation_pressurecontrol_id_type         FOREIGN KEY (id_type)         REFERENCES qwat_vl.pressurecontrol(id)       MATCH FULL;   CREATE INDEX fki_installation_pressurecontrol_type         ON qwat_od.installation_pressurecontrol(id_type)        ;


/* VIEW */
CREATE OR REPLACE VIEW qwat_od.vw_installation_pressurecontrol_fr AS
SELECT
	installation_pressurecontrol.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype,
	pressurecontrol.value_fr AS type
	FROM qwat_od.installation_pressurecontrol
	INNER JOIN      qwat_vl.status          ON status.id          = installation_pressurecontrol.id_status
	INNER JOIN      qwat_od.distributor     ON distributor.id     = installation_pressurecontrol.id_distributor
	LEFT OUTER JOIN qwat_vl.remote_type     ON remote_type.id     = installation_pressurecontrol.id_remote
	INNER JOIN      qwat_vl.watertype       ON watertype.id       = installation_pressurecontrol.id_watertype
	INNER JOIN      qwat_vl.pressurecontrol ON pressurecontrol.id = installation_pressurecontrol.id_type;





