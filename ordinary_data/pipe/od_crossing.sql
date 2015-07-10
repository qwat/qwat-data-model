CREATE TABLE qwat_od.crossing
(
  id serial NOT NULL,
  disabled boolean NOT NULL DEFAULT false,
  controled boolean NOT NULL DEFAULT false,
  hide_pipe smallint NOT NULL DEFAULT 1,
  _pipe1_id integer,
  _pipe2_id integer,
  _pipe1_angle double precision,
  _pipe2_angle double precision,
  CONSTRAINT crossing_pkey PRIMARY KEY (id),
  CONSTRAINT crossing_pipe1 FOREIGN KEY (_pipe1_id)
      REFERENCES qwat_od.pipe (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT crossing_pipe2 FOREIGN KEY (_pipe2_id)
      REFERENCES qwat_od.pipe (id) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

ALTER qwat_od.crossing TABLE ADD COLUMN geometry geometry('POINT',:SRID);

CREATE OR REPLACE FUNCTION qwat_od.ft_controled_crossing()
RETURNS trigger AS
$BODY$
	BEGIN
		NEW.controled = true;
		RETURN NEW;
	END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER tr_controled_crossing
BEFORE UPDATE ON qwat_od.crossing
FOR EACH ROW
WHEN (NEW.hide_pipe != OLD.hide_pipe)
EXECUTE PROCEDURE qwat_od.ft_controled_crossing();

CREATE OR REPLACE RULE rl_crossing_delete
	AS ON DELETE TO qwat_od.pipe
	DO ALSO DELETE FROM qwat_od.crossing WHERE _pipe1_id = OLD.id OR _pipe2_id = OLD.id;

