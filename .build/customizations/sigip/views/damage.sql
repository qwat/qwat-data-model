CREATE OR REPLACE VIEW qwat_sigip.vw_export_damage AS 
 SELECT damage.id,
    pipe.fk_parent AS pipe_id,
    damage.geometry
   FROM qwat_od.damage
     LEFT JOIN qwat_od.vw_export_pipe pipe ON damage.fk_pipe = pipe.id;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_sigip.vw_export_damage TO qwat_viewer;
GRANT ALL ON TABLE qwat_sigip.vw_export_damage TO qwat_user;
GRANT ALL ON TABLE qwat_sigip.vw_export_damage TO qwat_manager;
