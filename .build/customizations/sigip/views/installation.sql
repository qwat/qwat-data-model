CREATE OR REPLACE VIEW qwat_sigip.vw_export_installation AS 
  SELECT installation.id,
    ne.identification,
    node._pipe_orientation AS orientation,
    installation.name AS nom,
    CASE
      WHEN chamber.id IS NOT NULL THEN 'chamber'::qwat_od.installation_type
      WHEN pressurecontrol.id IS NOT NULL THEN 'pressurecontrol'::qwat_od.installation_type
      WHEN pump.id IS NOT NULL THEN 'pump'::qwat_od.installation_type
      WHEN source.id IS NOT NULL THEN 'source'::qwat_od.installation_type
      WHEN tank.id IS NOT NULL THEN 'tank'::qwat_od.installation_type
      WHEN treatment.id IS NOT NULL THEN 'treatment'::qwat_od.installation_type
      ELSE 'installation'::qwat_od.installation_type
    END AS installation_type,
    status.value_fr AS statut,
    district.name AS commune,
    pressurezone.name AS pressurezone_name,
    "precision".value_fr AS "precision",
    vw_element_installation.geometry_polygon AS the_geom
    
   FROM qwat_od.vw_element_installation
     LEFT JOIN qwat_vl.status status ON vw_element_installation.fk_status = status.id
     LEFT JOIN qwat_vl.watertype watertype ON vw_element_installation.fk_watertype = watertype.id
     LEFT JOIN qwat_vl.pump_type pump_type ON vw_element_installation.fk_pump_type = pump_type.id
     LEFT JOIN qwat_vl.object_reference object_reference ON vw_element_installation.fk_object_reference = object_reference.id
     LEFT JOIN qwat_vl.cistern cistern2 ON vw_element_installation.cistern2_fk_type = cistern2.id
     LEFT JOIN qwat_vl."precision" "precision" ON vw_element_installation.fk_precision = "precision".id
     LEFT JOIN qwat_vl.tank_firestorage tank_firestorage ON vw_element_installation.fk_tank_firestorage = tank_firestorage.id
     LEFT JOIN qwat_vl.cistern cistern1 ON vw_element_installation.cistern1_fk_type = cistern1.id
     LEFT JOIN qwat_vl.source_type source_type ON vw_element_installation.fk_source_type = source_type.id
     LEFT JOIN qwat_vl.source_quality source_quality ON vw_element_installation.fk_source_quality = source_quality.id
     LEFT JOIN qwat_od.distributor distributor ON distributor.id = ANY(vw_element_installation.fk_distributor)
     LEFT JOIN qwat_vl.overflow overflow ON vw_element_installation.fk_overflow = overflow.id
     LEFT JOIN qwat_vl.pressurecontrol_type pressurecontrol_type ON vw_element_installation.fk_pressurecontrol_type = pressurecontrol_type.id
     LEFT JOIN qwat_vl.remote_type remote ON vw_element_installation.fk_remote = remote.id
     LEFT JOIN qwat_od.district district ON vw_element_installation.fk_district = district.id
     LEFT JOIN qwat_od.pressurezone pressurezone ON pressurezone.id = ANY(vw_element_installation.fk_pressurezone)
     LEFT JOIN qwat_od.folder folder ON vw_element_installation.fk_folder = folder.id
     LEFT JOIN qwat_vl.precisionalti precisionalti ON vw_element_installation.fk_precisionalti = precisionalti.id
     LEFT JOIN qwat_vl.pump_operating pump_operating ON vw_element_installation.fk_pump_operating = pump_operating.id;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_sigip.vw_export_installation TO qwat_viewer;
GRANT ALL ON TABLE qwat_sigip.vw_export_installation TO qwat_user;
GRANT ALL ON TABLE qwat_sigip.vw_export_installation TO qwat_manager;
