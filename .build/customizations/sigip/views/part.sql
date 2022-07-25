CREATE OR REPLACE VIEW qwat_sigip.vw_export_part AS 
 SELECT vw_element_part.id,
    vw_element_part.identification AS numero,
    vw_element_part.orientation,
    status.value_fr AS statut,
    district.name AS commune,
    pressurezone.name AS zonepression,
    "precision".value_fr AS "precision",
    part_type.value_fr AS part_type,
    distributor.name AS distributeur,
    vw_element_part.geometry AS the_geom
   FROM qwat_od.vw_element_part
     LEFT JOIN qwat_vl.status status ON vw_element_part.fk_status = status.id
     LEFT JOIN qwat_od.district district ON vw_element_part.fk_pressurezone = district.id
     LEFT JOIN qwat_od.pressurezone pressurezone ON vw_element_part.fk_pressurezone = pressurezone.id
     LEFT JOIN qwat_vl."precision" "precision" ON vw_element_part.fk_precision = "precision".id
     LEFT JOIN qwat_vl.part_type part_type ON vw_element_part.fk_part_type = part_type.id
     LEFT JOIN qwat_vl.object_reference object_reference ON vw_element_part.fk_object_reference = object_reference.id
     LEFT JOIN qwat_od.distributor distributor ON distributor.id = ANY(vw_element_part.fk_distributor)
     LEFT JOIN qwat_od.folder folder ON vw_element_part.fk_folder = folder.id
     LEFT JOIN qwat_vl.precisionalti precisionalti ON vw_element_part.fk_precisionalti = precisionalti.id;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_sigip.vw_export_part TO qwat_viewer;
GRANT ALL ON TABLE qwat_sigip.vw_export_part TO qwat_user;
GRANT ALL ON TABLE qwat_sigip.vw_export_part TO qwat_manager;
