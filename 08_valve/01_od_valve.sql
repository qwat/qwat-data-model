/*
	qWat - QGIS Water Module

	SQL file :: valve table
*/

/* create */
DROP TABLE IF EXISTS qwat_od.valve CASCADE;
CREATE TABLE qwat_od.valve (id serial , CONSTRAINT valve_pk PRIMARY KEY (id));
COMMENT ON TABLE qwat_od.valve IS 'Table for valve.';


/* columns */
ALTER TABLE qwat_od.valve ADD COLUMN identification         varchar(20) default '';
ALTER TABLE qwat_od.valve ADD COLUMN id_type                integer not null ;
ALTER TABLE qwat_od.valve ADD COLUMN id_function            integer not null ;
ALTER TABLE qwat_od.valve ADD COLUMN id_status              integer not null ; 
ALTER TABLE qwat_od.valve ADD COLUMN id_precision           integer not null ;
ALTER TABLE qwat_od.valve ADD COLUMN id_precisionalti       integer not null ;
ALTER TABLE qwat_od.valve ADD COLUMN id_maintenance         integer[];
ALTER TABLE qwat_od.valve ADD COLUMN diameter_nominal       varchar(10) default '';
ALTER TABLE qwat_od.valve ADD COLUMN year                   smallint CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.valve ADD COLUMN closed                 boolean       default false ;
ALTER TABLE qwat_od.valve ADD COLUMN networkseparation      boolean       default false ;
ALTER TABLE qwat_od.valve ADD COLUMN altitude_real          decimal(10,3)  ;
ALTER TABLE qwat_od.valve ADD COLUMN remark                 text          default '';
ALTER TABLE qwat_od.valve ADD COLUMN labelremark            varchar(150) default '';
ALTER TABLE qwat_od.valve ADD COLUMN label_visible_1        smallint default 1;
ALTER TABLE qwat_od.valve ADD COLUMN label_x_1              double precision default null;
ALTER TABLE qwat_od.valve ADD COLUMN label_y_1              double precision default null;
ALTER TABLE qwat_od.valve ADD COLUMN label_r_1              double precision default null;
ALTER TABLE qwat_od.valve ADD COLUMN label_visible_2        smallint default 1;
ALTER TABLE qwat_od.valve ADD COLUMN label_x_2              double precision default null;
ALTER TABLE qwat_od.valve ADD COLUMN label_y_2              double precision default null;
ALTER TABLE qwat_od.valve ADD COLUMN label_r_2              double precision default null;


/* schema view */
SELECT qwat_od.fn_enable_schemaview('valve','valve_function','id_function');

/* geometry                  (table_name, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('valve',true    ,false,        true,             true,       true,          true);

/* constraints */
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_id_type          FOREIGN KEY (id_type)          REFERENCES qwat_vl.valve_type(id)       MATCH FULL; CREATE INDEX fki_valve_id_type          ON qwat_od.valve(id_type)         ;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_id_function      FOREIGN KEY (id_function)      REFERENCES qwat_vl.valve_function(id)   MATCH FULL; CREATE INDEX fki_valve_id_function      ON qwat_od.valve(id_function)     ;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_id_status        FOREIGN KEY (id_status)        REFERENCES qwat_vl.status(id)           MATCH FULL; CREATE INDEX fki_valve_id_status        ON qwat_od.valve(id_status)       ;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_id_precision     FOREIGN KEY (id_precision)     REFERENCES qwat_vl.precision(id)        MATCH FULL; CREATE INDEX fki_valve_id_precision     ON qwat_od.valve(id_precision)    ;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_id_precisionalti FOREIGN KEY (id_precisionalti) REFERENCES qwat_vl.precisionalti(id)    MATCH FULL; CREATE INDEX fki_valve_id_precisionalti ON qwat_od.valve(id_precisionalti);
ALTER TABLE qwat_od.valve ADD CONSTRAINT pipe_label_visible_1    FOREIGN KEY (label_visible_1)   REFERENCES qwat_vl.visible(vl_code_int) MATCH FULL; CREATE INDEX fki_valve_label_visible_1   ON qwat_od.valve(label_visible_1)  ;
ALTER TABLE qwat_od.valve ADD CONSTRAINT pipe_label_visible_2    FOREIGN KEY (label_visible_2)   REFERENCES qwat_vl.visible(vl_code_int) MATCH FULL; CREATE INDEX fki_valve_label_visible_2   ON qwat_od.valve(label_visible_2)  ;
/* cannot create constraint on arrays yet
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_id_maintenance FOREIGN KEY (id_maintenance) REFERENCES qwat_vl.valve_maintenance(id) MATCH SIMPLE ; CREATE INDEX fki_valve_id_maintenance ON qwat_od.valve(id_maintenance) ;
*/





