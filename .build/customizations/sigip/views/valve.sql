CREATE OR REPLACE VIEW qwat_sigip.vw_export_valve AS 
 SELECT valve.id,
    valve.identification AS numero,
    distributor.name AS distributeur,
    pressurezone.name AS zonepression,
    valve_function.value_fr AS fonction,
    status.value_fr AS statut,
    "precision".value_fr AS "precision",
    valve_actuation.value_fr AS actionnement,
    district.name AS commune,
    valve._pipe_orientation AS orientation,
    valve.geometry AS the_geom
   FROM qwat_od.valve valve
     LEFT JOIN qwat_vl.status status ON valve.fk_status = status.id
     LEFT JOIN qwat_od.district district ON valve.fk_district = district.id
     LEFT JOIN qwat_od.pressurezone pressurezone ON valve.fk_pressurezone = pressurezone.id
     LEFT JOIN qwat_vl.valve_function valve_function ON valve.fk_valve_function = valve_function.id
     LEFT JOIN qwat_vl."precision" "precision" ON valve.fk_precision = "precision".id
     LEFT JOIN qwat_od.distributor distributor ON valve.fk_distributor = distributor.id
     LEFT JOIN qwat_vl.valve_type valve_type ON valve.fk_valve_type = valve_type.id
     LEFT JOIN qwat_vl.object_reference object_reference ON valve.fk_object_reference = object_reference.id
     LEFT JOIN qwat_vl.valve_actuation valve_actuation ON valve.fk_valve_actuation = valve_actuation.id;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_sigip.vw_export_valve TO qwat_viewer;
GRANT ALL ON TABLE qwat_sigip.vw_export_valve TO qwat_user;
GRANT ALL ON TABLE qwat_sigip.vw_export_valve TO qwat_manager;
