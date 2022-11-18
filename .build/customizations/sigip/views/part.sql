CREATE OR REPLACE VIEW qwat_sigip.vw_export_part AS 
  SELECT part.id,
    ne.identification AS numero,
    ne.orientation,
    status.value_fr AS statut,
    district.name AS commune,
    pressurezone.name AS zonepression,
    "precision".value_fr AS "precision",
    part_type.value_fr AS part_type,
    distributor.name AS distributeur,
    node.geometry AS the_geom

  FROM qwat_od.part
    LEFT JOIN qwat_od.network_element ne ON part.id = ne.id
    LEFT JOIN qwat_od.node node ON part.id = node.id
    LEFT JOIN qwat_vl.status status ON ne.fk_status = status.id
    LEFT JOIN qwat_od.district district ON node.fk_district = district.id
    LEFT JOIN qwat_od.pressurezone pressurezone ON node.fk_pressurezone = pressurezone.id
    LEFT JOIN qwat_vl."precision" "precision" ON ne.fk_precision = "precision".id
    LEFT JOIN qwat_vl.part_type part_type ON part.fk_part_type = part_type.id
    LEFT JOIN qwat_vl.object_reference object_reference ON ne.fk_object_reference = object_reference.id
    LEFT JOIN qwat_od.distributor distributor ON ne.fk_distributor = distributor.id
    LEFT JOIN qwat_od.folder folder ON ne.fk_folder = folder.id
    LEFT JOIN qwat_vl.precisionalti precisionalti ON ne.fk_precisionalti = precisionalti.id;
