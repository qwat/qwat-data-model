-- Table: qwat_network.pipe_reference : contains each pipe section with source node and end node
CREATE TABLE qwat_network.pipe_reference
(
    id serial,
    fk_pipe integer,
    fk_node_a integer,
    fk_node_b integer,
    geometry geometry,
    CONSTRAINT pipe_reference_pkey PRIMARY KEY (id),
    CONSTRAINT pipe_reference_fk_pipe_fkey FOREIGN KEY (fk_pipe)
        REFERENCES qwat_od.pipe (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;
    
-- Index: pipe_reference_fk_pipe_idx

CREATE INDEX pipe_reference_fk_pipe_idx
    ON qwat_network.pipe_reference USING btree
    (fk_pipe)
    TABLESPACE pg_default;
