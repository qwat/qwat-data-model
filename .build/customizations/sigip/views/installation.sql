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
    installation.geometry_polygon AS the_geom

   FROM qwat_od.installation
     LEFT JOIN qwat_od.network_element ne ON installation.id = ne.id
     LEFT JOIN qwat_od.node node ON installation.id = node.id
     LEFT JOIN qwat_vl.status status ON ne.fk_status = status.id
     LEFT JOIN qwat_vl.watertype watertype ON installation.fk_watertype = watertype.id
     LEFT JOIN qwat_vl."precision" "precision" ON ne.fk_precision = "precision".id
     LEFT JOIN qwat_od.distributor distributor ON ne.fk_distributor = distributor.id
     LEFT JOIN qwat_od.district district ON node.fk_district = district.id
     LEFT JOIN qwat_od.pressurezone pressurezone ON node.fk_pressurezone = pressurezone.id
     LEFT JOIN qwat_od.folder folder ON ne.fk_folder = folder.id
     LEFT JOIN qwat_vl.precisionalti precisionalti ON ne.fk_precisionalti = precisionalti.id

     LEFT JOIN qwat_od.chamber chamber ON installation.id = chamber.id
     LEFT JOIN qwat_od.pressurecontrol pressurecontrol ON installation.id = pressurecontrol.id
     LEFT JOIN qwat_od.pump pump ON installation.id = pump.id
     LEFT JOIN qwat_od.source source ON installation.id = source.id
     LEFT JOIN qwat_od.tank tank ON installation.id = tank.id
     LEFT JOIN qwat_od.treatment treatment ON installation.id = treatment.id;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_sigip.vw_export_installation TO qwat_viewer;
GRANT ALL ON TABLE qwat_sigip.vw_export_installation TO qwat_user;
GRANT ALL ON TABLE qwat_sigip.vw_export_installation TO qwat_manager;
