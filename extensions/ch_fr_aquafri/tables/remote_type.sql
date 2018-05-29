

CREATE TABLE qwat_ch_fr_aquafri.remote_type
(
    id integer NOT NULL,
    code character varying(2),
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

	
COPY qwat_ch_fr_aquafri.remote_type
FROM '/tmp/remote_type.csv'
CSV HEADER;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.remote_type TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.remote_type TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.remote_type TO qwat_manager;