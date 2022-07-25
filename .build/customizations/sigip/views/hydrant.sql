CREATE OR REPLACE VIEW qwat_sigip.vw_export_hydrant AS 
 SELECT vw_element_hydrant.id,
    vw_element_hydrant.identification AS numero,
    vw_element_hydrant.year AS annee,
    vw_element_hydrant.geometry AS the_geom,
    status.value_fr AS statut,
    district.name AS commune,
    pressurezone.name AS zonepression,
    distributor.name AS distributeur,
    "precision".value_fr AS "precision"
   FROM qwat_od.vw_element_hydrant
     LEFT JOIN qwat_vl.status status ON vw_element_hydrant.fk_status = status.id
     LEFT JOIN qwat_od.district district ON vw_element_hydrant.fk_district = district.id
     LEFT JOIN qwat_vl.hydrant_model_inf model_inf ON vw_element_hydrant.fk_model_inf = model_inf.id
     LEFT JOIN qwat_od.pressurezone pressurezone ON vw_element_hydrant.fk_pressurezone = pressurezone.id
     LEFT JOIN qwat_vl.hydrant_material material ON vw_element_hydrant.fk_material = material.id
     LEFT JOIN qwat_vl."precision" "precision" ON vw_element_hydrant.fk_precision = "precision".id
     LEFT JOIN qwat_vl.hydrant_model_sup model_sup ON vw_element_hydrant.fk_model_sup = model_sup.id
     LEFT JOIN qwat_vl.object_reference object_reference ON vw_element_hydrant.fk_object_reference = object_reference.id
     LEFT JOIN qwat_vl.hydrant_provider provider ON vw_element_hydrant.fk_provider = provider.id
     LEFT JOIN qwat_od.distributor distributor ON distributor.id = ANY(vw_element_hydrant.fk_distributor)
     LEFT JOIN qwat_vl.hydrant_output output ON vw_element_hydrant.fk_output = output.id
     LEFT JOIN qwat_od.folder folder ON vw_element_hydrant.fk_folder = folder.id
     LEFT JOIN qwat_vl.precisionalti precisionalti ON vw_element_hydrant.fk_precisionalti = precisionalti.id;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_sigip.vw_export_hydrant TO qwat_viewer;
GRANT ALL ON TABLE qwat_sigip.vw_export_hydrant TO qwat_user;
GRANT ALL ON TABLE qwat_sigip.vw_export_hydrant TO qwat_manager;
