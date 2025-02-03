-- View: qwat_network.vw_pipe_reference : contains pipes which are not in pipe_reference table

CREATE OR REPLACE VIEW qwat_network.vw_pipe_reference AS
 SELECT sp.id,
    sp.fk_node_a,
    sp.fk_node_b,
    sp.geometry,
    sp.fk_pipe
   FROM qwat_network.pipe_reference sp
UNION
 SELECT p.id,
    p.fk_node_a,
    p.fk_node_b,
    p.geometry,
    p.id AS fk_pipe
   FROM qwat_od.pipe p
  WHERE (p.id NOT IN ( SELECT pipe_reference.fk_pipe
           FROM qwat_network.pipe_reference));
