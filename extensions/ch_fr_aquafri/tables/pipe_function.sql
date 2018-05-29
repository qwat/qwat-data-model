CREATE TABLE qwat_ch_fr_aquafri.pipe_function
(
    id integer NOT NULL,
    code character varying(2),
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

--ALTER TABLE qwat_ch_fr_aquafri.pipe_function
--    OWNER to postgres;
	
	
	
COPY qwat_ch_fr_aquafri.pipe_function
FROM '/tmp/pipe_function.csv'
CSV HEADER;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.pipe_function TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.pipe_function TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.pipe_function TO qwat_manager;