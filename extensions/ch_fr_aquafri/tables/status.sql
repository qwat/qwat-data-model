
CREATE TABLE qwat_ch_fr_aquafri.status
(
    id integer NOT NULL,
    code character varying(2),
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

	
COPY qwat_ch_fr_aquafri.status
FROM '/tmp/status.csv'
CSV HEADER;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.status TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.status TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.status TO qwat_manager;