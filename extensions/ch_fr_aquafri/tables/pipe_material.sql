
CREATE TABLE qwat_ch_fr_aquafri.pipe_material
(
    id integer NOT NULL,
    code character varying(2),
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

	
COPY qwat_ch_fr_aquafri.pipe_material
FROM '/tmp/pipe_material.csv'
CSV HEADER;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.pipe_material TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.pipe_material TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.pipe_material TO qwat_manager;