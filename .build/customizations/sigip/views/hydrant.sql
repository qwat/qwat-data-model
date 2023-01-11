CREATE OR REPLACE VIEW qwat_sigip.vw_export_hydrant AS 
  SELECT hydrant.id,
    ne.identification AS numero,
    ne.year AS annee,
    node.geometry AS the_geom,
    status.value_fr AS statut,
    district.name AS commune,
    pressurezone.name AS zonepression,
    distributor.name AS distributeur,
    "precision".value_fr AS "precision"
    
  FROM qwat_od.hydrant
    LEFT JOIN qwat_od.network_element ne ON hydrant.id = ne.id
    LEFT JOIN qwat_od.node node ON hydrant.id = node.id
    LEFT JOIN qwat_vl.status status ON ne.fk_status = status.id
    LEFT JOIN qwat_od.district district ON node.fk_district = district.id
    LEFT JOIN qwat_vl.hydrant_model_inf model_inf ON hydrant.fk_model_inf = model_inf.id
    LEFT JOIN qwat_od.pressurezone pressurezone ON ANY(node.fk_pressurezone) = pressurezone.id
    LEFT JOIN qwat_vl.hydrant_material material ON hydrant.fk_material = material.id
    LEFT JOIN qwat_vl."precision" "precision" ON ne.fk_precision = "precision".id
    LEFT JOIN qwat_vl.hydrant_model_sup model_sup ON hydrant.fk_model_sup = model_sup.id
    LEFT JOIN qwat_vl.object_reference object_reference ON ne.fk_object_reference = object_reference.id
    LEFT JOIN qwat_vl.hydrant_provider provider ON hydrant.fk_provider = provider.id
    LEFT JOIN qwat_od.distributor distributor ON ANY(ne.fk_distributor) = distributor.id
    LEFT JOIN qwat_vl.hydrant_output output ON hydrant.fk_output = output.id
    LEFT JOIN qwat_od.folder folder ON ne.fk_folder = folder.id
    LEFT JOIN qwat_vl.precisionalti precisionalti ON ne.fk_precisionalti = precisionalti.id;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_sigip.vw_export_hydrant TO qwat_viewer;
GRANT ALL ON TABLE qwat_sigip.vw_export_hydrant TO qwat_user;
GRANT ALL ON TABLE qwat_sigip.vw_export_hydrant TO qwat_manager;
