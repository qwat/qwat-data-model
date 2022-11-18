CREATE OR REPLACE VIEW qwat_sigip.vw_export_damage AS 
 SELECT damage.id,
    pipe.fk_parent AS pipe_id,
    damage.geometry
   FROM qwat_od.damage
     LEFT JOIN qwat_od.pipe ON damage.fk_pipe = pipe.id;
