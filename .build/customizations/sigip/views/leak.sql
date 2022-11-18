CREATE OR REPLACE VIEW qwat_sigip.vw_export_leak AS 
 SELECT leak.id,
    pipe.id AS pipe_id,
    leak.geometry
   FROM qwat_od.leak
     LEFT JOIN qwat_od.pipe pipe ON leak.fk_pipe = pipe.id;