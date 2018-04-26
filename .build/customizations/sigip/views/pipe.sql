CREATE OR REPLACE VIEW qwat_sigip.vw_export_pipe AS 
 SELECT pipe.id,
    pipe.year AS annee_const,
    pipe.year_rehabilitation AS annee_rehab,
    pipe.year_end AS annee_fin,
    pipe.tunnel_or_bridge AS tunnel_pont,
    pipe.pressure_nominal AS pression_nominale,
    pipe.remark AS remarque,
    pipe._length2d AS longueur,
    pipe.geometry AS the_geom,
    status.value_fr AS statut,
    function.value_fr AS function,
    installmethod.value_fr AS method_install,
    district.name AS commune,
    pressurezone.name AS zone_pression,
    material._displayname_fr AS materiau,
    material.diameter_nominal AS diam_nominal,
    material.diameter_internal AS diam_interne,
    material.diameter_external AS diam_externe,
    "precision".value_fr AS "precision",
    protection.value_fr AS protection,
    distributor.name AS distributeur
   FROM qwat_od.pipe
     LEFT JOIN qwat_vl.status status ON pipe.fk_status = status.id
     LEFT JOIN qwat_vl.pipe_function function ON pipe.fk_function = function.id
     LEFT JOIN qwat_vl.pipe_installmethod installmethod ON pipe.fk_installmethod = installmethod.id
     LEFT JOIN qwat_od.district district ON pipe.fk_district = district.id
     LEFT JOIN qwat_od.pressurezone pressurezone ON pipe.fk_pressurezone = pressurezone.id
     LEFT JOIN qwat_vl.pipe_material material ON pipe.fk_material = material.id
     LEFT JOIN qwat_vl."precision" "precision" ON pipe.fk_precision = "precision".id
     LEFT JOIN qwat_vl.pipe_protection protection ON pipe.fk_protection = protection.id
     LEFT JOIN qwat_od.distributor distributor ON pipe.fk_distributor = distributor.id
     LEFT JOIN qwat_od.folder folder ON pipe.fk_folder = folder.id
     LEFT JOIN qwat_od.node node_b ON pipe.fk_node_b = node_b.id
     LEFT JOIN qwat_od.node node_a ON pipe.fk_node_a = node_a.id;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_sigip.vw_export_pipe TO qwat_viewer;
GRANT ALL ON TABLE qwat_sigip.vw_export_pipe TO qwat_user;
GRANT ALL ON TABLE qwat_sigip.vw_export_pipe TO qwat_manager;
