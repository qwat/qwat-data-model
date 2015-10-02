/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/

CREATE TABLE qwat_od.part ();
COMMENT ON TABLE qwat_od.part IS 'Table for installation parts. Inherits from node.';

/* COLUMNS */
ALTER TABLE qwat_od.part ADD COLUMN id integer NOT NULL REFERENCES qwat_od.part(id) PRIMARY KEY;
ALTER TABLE qwat_od.part ADD COLUMN fk_part_type integer not null ;
ALTER TABLE qwat_od.part ADD COLUMN fk_pipe integer;

/* CONSTRAINTS */
ALTER TABLE qwat_od.part ADD CONSTRAINT part_fk_type FOREIGN KEY (fk_part_type) REFERENCES qwat_vl.part_type(id) MATCH FULL; CREATE INDEX fki_part_fk_type ON qwat_od.part(fk_part_type) ;


/* ASSIGN PIPE TRIGGER */
CREATE OR REPLACE FUNCTION qwat_od.ft_part_insert() RETURNS TRIGGER AS
$BODY$
	BEGIN
		IF NEW.fk_pipe IS NULL THEN
			NEW.fk_pipe := qwat_od.fn_pipe_get_id(node.geometry) FROM qwat_od.node WHERE node.id = NEW.id;
		END IF;
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_od.ft_part_insert() IS 'Trigger: when inserting a part, get a pipe if not given. Do a BEFORE trigger, part will be update..';
CREATE TRIGGER part_insert_trigger
	BEFORE INSERT ON qwat_od.part
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_part_insert();
COMMENT ON TRIGGER part_insert_trigger ON qwat_od.part IS 'Trigger: when inserting a part, get a pipe if not given. Do a BEFORE trigger, part will be update.';




CREATE OR REPLACE FUNCTION qwat_od.ft_part_node_update() RETURNS TRIGGER AS
$BODY$
	DECLARE
		_old_pipe integer;
	BEGIN
		-- this will be fired for every node, although not every node is a part
		UPDATE qwat_od.vw_element_part SET fk_pipe = qwat_od.fn_pipe_get_id(geometry) WHERE id = NEW.id; -- TODO prompt user to move it or not
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_part_node_update() IS 'Trigger: when moving a part, update the corresponding pipe. Do an AFTER trigger since it will update part after updating the node.';

CREATE TRIGGER part_pipe_update_trigger
	AFTER UPDATE OF geometry ON qwat_od.node
	FOR EACH ROW
	WHEN ( ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
	EXECUTE PROCEDURE qwat_od.ft_part_node_update();
COMMENT ON TRIGGER part_pipe_update_trigger ON qwat_od.node IS 'Trigger: when moving a part, update the corresponding pipe. Do an AFTER trigger since it will update part after updating the node.';




