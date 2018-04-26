CREATE OR REPLACE VIEW qwat_sigip.vw_export_leak AS 
 SELECT leak.id,
    pipe.id AS pipe_id,
    leak.geometry
   FROM qwat_od.leak
     LEFT JOIN qwat_od.vw_export_pipe pipe ON leak.fk_pipe = pipe.id;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_sigip.vw_export_leak TO qwat_viewer;
GRANT ALL ON TABLE qwat_sigip.vw_export_leak TO qwat_user;
GRANT ALL ON TABLE qwat_sigip.vw_export_leak TO qwat_manager;
