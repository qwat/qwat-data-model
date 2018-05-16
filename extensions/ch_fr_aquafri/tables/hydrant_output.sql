

CREATE TABLE qwat_ch_fr_aquafri.hydrant_output
(
    id integer NOT NULL,
    code character varying(20),
	nbr_sorties integer,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

	
COPY qwat_ch_fr_aquafri.hydrant_output
FROM '/tmp/hydrant_output.csv'
CSV HEADER;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.hydrant_output TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.hydrant_output TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.hydrant_output TO qwat_manager;