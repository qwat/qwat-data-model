
CREATE TABLE qwat_ch_fr_aquafri.precision
(
    id integer NOT NULL,
    code character varying(2),
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

	
COPY qwat_ch_fr_aquafri.precision
FROM '/tmp/precision.csv'
CSV HEADER;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.precision TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.precision TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.precision TO qwat_manager;