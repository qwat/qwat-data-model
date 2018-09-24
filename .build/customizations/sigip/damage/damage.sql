CREATE TABLE IF NOT EXISTS qwat_od.damage
(
  id serial NOT NULL,
  fk_cause integer NOT NULL,
  fk_pipe integer,
  widespread_damage boolean NOT NULL,
  detection_date date,
  repair_date date,
  _repaired boolean,
  address text,
  pipe_replaced boolean,
  description text,
  repair text,
  geometry geometry(Point,:SRID),
  label_1_visible smallint DEFAULT 1,
  label_1_x double precision,
  label_1_y double precision,
  label_1_rotation double precision,
  label_1_text character varying(120),
  label_2_visible smallint DEFAULT 1,
  label_2_x double precision,
  label_2_y double precision,
  label_2_rotation double precision,
  label_2_text character varying(120),
  CONSTRAINT damage_pkey PRIMARY KEY (id)
);

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_od.damage TO qwat_viewer;
GRANT ALL ON TABLE qwat_od.damage TO qwat_user;
GRANT ALL ON TABLE qwat_od.damage TO qwat_manager;
COMMENT ON TABLE qwat_od.damage
IS 'pipe damage';
