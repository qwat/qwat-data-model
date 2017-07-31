CREATE TABLE IF NOT EXISTS qwat_sys.upgrades
(
  id serial NOT NULL,
  version character varying(50),
  description character varying(200) NOT NULL,
  type integer NOT NULL,
  script character varying(1000) NOT NULL,
  checksum character varying(32) NOT NULL,
  installed_by character varying(100) NOT NULL,
  installed_on timestamp without time zone NOT NULL DEFAULT now(),
  execution_time integer NOT NULL,
  success boolean NOT NULL,
  CONSTRAINT upgrades_pk PRIMARY KEY (id)
)
