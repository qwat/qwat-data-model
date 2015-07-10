/*
	qWat - QGIS Water Module

	SQL file :: valve table
*/

/* create */
DROP TABLE IF EXISTS qwat_od.valve CASCADE;
CREATE TABLE qwat_od.valve (id serial , CONSTRAINT valve_pk PRIMARY KEY (id));
COMMENT ON TABLE qwat_od.valve IS 'Table for valve.';


/* columns */
ALTER TABLE qwat_od.valve ADD COLUMN identification          varchar(20) ;
ALTER TABLE qwat_od.valve ADD COLUMN fk_distributor    		 integer not null ;
ALTER TABLE qwat_od.valve ADD COLUMN fk_type           		 integer not null ;
ALTER TABLE qwat_od.valve ADD COLUMN fk_function       		 integer not null ;
ALTER TABLE qwat_od.valve ADD COLUMN fk_status         		 integer not null ;
ALTER TABLE qwat_od.valve ADD COLUMN fk_actuation      		 integer not null ;
ALTER TABLE qwat_od.valve ADD COLUMN fk_node_precision       integer not null ;
ALTER TABLE qwat_od.valve ADD COLUMN fk_node_precisionalti   integer not null ;
ALTER TABLE qwat_od.valve ADD COLUMN fk_handle_precision     integer ;
ALTER TABLE qwat_od.valve ADD COLUMN fk_handle_precisionalti integer ;
ALTER TABLE qwat_od.valve ADD COLUMN fk_maintenance    		 integer[];
ALTER TABLE qwat_od.valve ADD COLUMN fk_locationtype 		 integer[];
ALTER TABLE qwat_od.valve ADD COLUMN fk_folder               integer ;
ALTER TABLE qwat_od.valve ADD COLUMN diameter_nominal 		 varchar(10) ;
ALTER TABLE qwat_od.valve ADD COLUMN year              		 smallint CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.valve ADD COLUMN year_end                smallint CHECK (year_end IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.valve ADD COLUMN closed            		 boolean  	        default false ;
ALTER TABLE qwat_od.valve ADD COLUMN networkseparation 		 boolean       	default false ;
ALTER TABLE qwat_od.valve ADD COLUMN node_altitude_real      decimal(10,3)  ;
ALTER TABLE qwat_od.valve ADD COLUMN handle_altitude_real    decimal(10,3)  ;
ALTER TABLE qwat_od.valve ADD COLUMN remark                  text ;

/* schema view */
SELECT qwat_od.fn_enable_schemaview('valve');

/* geometry                  (table_name, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('valve',true    ,false,        true,             true,       true,          true);

ALTER TABLE qwat_od.valve ADD COLUMN geometry_handle geometry(Point,:SRID);

/* LABELS */
SELECT qwat_od.fn_label_create_fields('valve');

/* constraints */
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_distributor FOREIGN KEY (fk_distributor) REFERENCES qwat_od.distributor(id)     MATCH FULL; CREATE INDEX fki_valve_fk_distributor ON qwat_od.valve(fk_distributor)  ;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_type        FOREIGN KEY (fk_type)        REFERENCES qwat_vl.valve_type(id)      MATCH FULL; CREATE INDEX fki_valve_fk_type        ON qwat_od.valve(fk_type)         ;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_function    FOREIGN KEY (fk_function)    REFERENCES qwat_vl.valve_function(id)  MATCH FULL; CREATE INDEX fki_valve_fk_function    ON qwat_od.valve(fk_function)     ;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_status      FOREIGN KEY (fk_status)      REFERENCES qwat_vl.status(id)          MATCH FULL; CREATE INDEX fki_valve_fk_status      ON qwat_od.valve(fk_status)       ;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_actuation   FOREIGN KEY (fk_actuation)   REFERENCES qwat_vl.valve_actuation(id) MATCH FULL; CREATE INDEX fki_valve_fk_actuation   ON qwat_od.valve(fk_actuation)    ;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_folder      FOREIGN KEY (fk_folder)      REFERENCES qwat_od.folder(id)          MATCH FULL; CREATE INDEX fki_valve_fk_folder      ON qwat_od.valve(fk_folder);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_node_precision       FOREIGN KEY (fk_node_precision)       REFERENCES qwat_vl.precision(id)     MATCH FULL; CREATE INDEX fki_valve_fk_node_precision       ON qwat_od.valve(fk_node_precision)      ;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_node_precisionalti   FOREIGN KEY (fk_node_precisionalti)   REFERENCES qwat_vl.precisionalti(id) MATCH FULL; CREATE INDEX fki_valve_fk_node_precisionalti   ON qwat_od.valve(fk_node_precisionalti)  ;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_handle_precision     FOREIGN KEY (fk_handle_precision)     REFERENCES qwat_vl.precision(id)     MATCH FULL; CREATE INDEX fki_valve_fk_handle_precision     ON qwat_od.valve(fk_handle_precision)    ;
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_handle_precisionalti FOREIGN KEY (fk_handle_precisionalti) REFERENCES qwat_vl.precisionalti(id) MATCH FULL; CREATE INDEX fki_valve_fk_handle_precisionalti ON qwat_od.valve(fk_handle_precisionalti);


/* cannot create constraint on arrays yet
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_maintenance FOREIGN KEY (fk_maintenance) REFERENCES qwat_vl.valve_maintenance(id) MATCH FULL ; CREATE INDEX fki_valve_fk_maintenance ON qwat_od.valve(fk_maintenance) ;
*/
	
	



