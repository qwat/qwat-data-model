/*
	qWat - QGIS Water Module

	SQL file :: valve table
*/

/* create */
CREATE TABLE qwat_od.valve ();
COMMENT ON TABLE qwat_od.valve IS 'Table for valve. Inherits from node.';

/* columns */
ALTER TABLE qwat_od.valve ADD COLUMN id integer NOT NULL REFERENCES qwat_od.node(id) PRIMARY KEY;
ALTER TABLE qwat_od.valve ADD COLUMN fk_valve_type     		 integer not null;
ALTER TABLE qwat_od.valve ADD COLUMN fk_valve_function       integer not null;
ALTER TABLE qwat_od.valve ADD COLUMN fk_actuation      		 integer not null;
ALTER TABLE qwat_od.valve ADD COLUMN fk_pipe                 integer ;
ALTER TABLE qwat_od.valve ADD COLUMN fk_handle_precision     integer;
ALTER TABLE qwat_od.valve ADD COLUMN fk_handle_precisionalti integer;
ALTER TABLE qwat_od.valve ADD COLUMN fk_maintenance    		 integer[]; --TODO should use n:m relations!
ALTER TABLE qwat_od.valve ADD COLUMN diameter_nominal 		 varchar(10);
ALTER TABLE qwat_od.valve ADD COLUMN closed            		 boolean default false;
ALTER TABLE qwat_od.valve ADD COLUMN networkseparation 		 boolean default false;
ALTER TABLE qwat_od.valve ADD COLUMN node_altitude           decimal(10,3);
ALTER TABLE qwat_od.valve ADD COLUMN handle_altitude         decimal(10,3);
ALTER TABLE qwat_od.valve ADD COLUMN handle_geometry         geometry(PointZ,:SRID);


/* constraints */
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_type      FOREIGN KEY (fk_valve_type)     REFERENCES qwat_vl.valve_type(id)      MATCH FULL; CREATE INDEX fki_valve_fk_type      ON qwat_od.valve(fk_valve_type);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_function  FOREIGN KEY (fk_valve_function) REFERENCES qwat_vl.valve_function(id)  MATCH FULL; CREATE INDEX fki_valve_fk_function  ON qwat_od.valve(fk_valve_function);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_actuation FOREIGN KEY (fk_actuation)      REFERENCES qwat_vl.valve_actuation(id) MATCH FULL; CREATE INDEX fki_valve_fk_actuation ON qwat_od.valve(fk_actuation);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_pipe      FOREIGN KEY (fk_pipe)           REFERENCES qwat_od.pipe(id)            MATCH FULL; CREATE INDEX fki_valve_fk_pipe      ON qwat_od.valve(fk_pipe);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_handle_precision     FOREIGN KEY (fk_handle_precision)     REFERENCES qwat_vl.precision(id)     MATCH FULL; CREATE INDEX fki_valve_fk_handle_precision     ON qwat_od.valve(fk_handle_precision);
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_handle_precisionalti FOREIGN KEY (fk_handle_precisionalti) REFERENCES qwat_vl.precisionalti(id) MATCH FULL; CREATE INDEX fki_valve_fk_handle_precisionalti ON qwat_od.valve(fk_handle_precisionalti);

/* cannot create constraint on arrays yet
ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_maintenance FOREIGN KEY (fk_maintenance) REFERENCES qwat_vl.valve_maintenance(id) MATCH FULL; CREATE INDEX fki_valve_fk_maintenance ON qwat_od.valve(fk_maintenance);
*/


/* NODE TRIGGER */
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_node_set_type() RETURNS TRIGGER AS
$BODY$
	BEGIN
		PERFORM qwat_od.fn_node_set_type(NEW.id);
	RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_node_set_type() IS 'Trigger: set-type of node after inserting a valve (to get orientation).';

CREATE TRIGGER valve_node_set_type
	AFTER INSERT ON qwat_od.valve
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_valve_node_set_type();
COMMENT ON TRIGGER valve_node_set_type ON qwat_od.valve IS 'Trigger: set-type of node after inserting a valve (to get orientation).';



/* GET PIPE TRIGGER */
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_pipe() RETURNS TRIGGER AS
$BODY$
	BEGIN
		IF TG_OP = 'INSERT' THEN -- i.e. working on valve table
			IF NEW.fk_pipe IS NULL THEN
				NEW.fk_pipe = qwat_od.fn_pipe_get_id(node.geometry) FROM qwat_od.node WHERE node.id = NEW.id;
			END IF;
		ELSIF TG_OP = 'UPDATE' THEN -- i.e. working on node table
			-- this will be fired for every node, although not every node is valve
			UPDATE qwat_od.valve SET fk_pipe = qwat_od.fn_pipe_get_id(node.geometry) WHERE valve.id = NEW.id;
		END IF;
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_pipe() IS 'Trigger: update the associate pipe of valve after insert/upate. Since valve inherits from node, it needs to join the table. INSERT trigger is perfromed BEFORE on valve, while UPDATE is performed AFTER on node.';

CREATE TRIGGER valve_pipe_insert_trigger
	BEFORE INSERT ON qwat_od.valve
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_valve_pipe();
COMMENT ON TRIGGER valve_pipe_insert_trigger ON qwat_od.valve IS 'Trigger: when inserting a valve, get a pipe if not given. Do a BEFORE trigger, valve will be update.';

CREATE TRIGGER valve_pipe_update_trigger
	AFTER UPDATE OF geometry ON qwat_od.node
	FOR EACH ROW
	WHEN ( ST_AsBinary(NEW.geometry) <> ST_AsBinary(OLD.geometry) )
	EXECUTE PROCEDURE qwat_od.ft_valve_pipe();
COMMENT ON TRIGGER valve_pipe_update_trigger ON qwat_od.node IS 'Trigger: when moving a valve, update the corresponding pipe. Do an AFTER trigger since it will update valve after updating the node.';


/* HANDLE ALTITUDE TRIGGER */
CREATE OR REPLACE FUNCTION qwat_od.ft_valve_handle_altitude() RETURNS TRIGGER AS
$BODY$
	BEGIN
		-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
		IF TG_OP = 'INSERT' THEN
			IF NEW.handle_altitude IS NULL THEN
				NEW.handle_altitude := ST_Z(NEW.handle_geometry);
			END IF;
			IF ST_Z(NEW.handle_geometry) IS NULL THEN
				NEW.handle_geometry := ST_MakePoint( ST_X(NEW.handle_geometry), ST_Y(NEW.handle_geometry), handle_altitude );
			END IF;
		ELSIF TG_OP = 'UPDATE' THEN
			IF NEW.handle_altitude <> OLD.handle_altitude THEN
				NEW.handle_geometry := ST_MakePoint( ST_X(NEW.handle_geometry), ST_Y(NEW.handle_geometry), handle_altitude );
			ELSIF ST_Z(NEW.handle_geometry) <> ST_Z(OLD.handle_geometry) THEN
				NEW.handle_altitude := ST_Z(NEW.handle_geometry);
			END IF;
		END IF;
	RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_valve_handle_altitude() IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';

CREATE TRIGGER valve_handle_altitude_update_trigger
	BEFORE UPDATE OF handle_altitude, handle_geometry ON qwat_od.valve
	FOR EACH ROW
	WHEN (NEW.handle_altitude <> OLD.handle_altitude OR ST_Z(NEW.handle_geometry) <> ST_Z(OLD.handle_geometry))
	EXECUTE PROCEDURE qwat_od.ft_valve_handle_altitude();
COMMENT ON TRIGGER valve_handle_altitude_update_trigger ON qwat_od.valve IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';

CREATE TRIGGER valve_handle_altitude_insert_trigger
	BEFORE INSERT ON qwat_od.valve
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_valve_handle_altitude();
COMMENT ON TRIGGER valve_handle_altitude_insert_trigger ON qwat_od.valve IS 'Trigger: when updating, check if altitude or Z value of geometry changed and synchronize them.';
