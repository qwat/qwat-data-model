/* Audit */
DO $$
BEGIN
PERFORM qwat_sys.audit_table('qwat_dr.annotationline');
PERFORM qwat_sys.audit_table('qwat_dr.annotationpoint');
PERFORM qwat_sys.audit_table('qwat_dr.constructionpoint');
PERFORM qwat_sys.audit_table('qwat_dr.dimension_distance');
PERFORM qwat_sys.audit_table('qwat_dr.dimension_orientation');

PERFORM qwat_sys.audit_table('qwat_od.distributor');
PERFORM qwat_sys.audit_table('qwat_od.district');
PERFORM qwat_sys.audit_table('qwat_od.hydrant');
PERFORM qwat_sys.audit_table('qwat_od.installation');
PERFORM qwat_sys.audit_table('qwat_od.pressurecontrol');
PERFORM qwat_sys.audit_table('qwat_od.pump');
PERFORM qwat_sys.audit_table('qwat_od.source');
PERFORM qwat_sys.audit_table('qwat_od.treatment');
PERFORM qwat_sys.audit_table('qwat_od.tank');
PERFORM qwat_sys.audit_table('qwat_od.chamber');
PERFORM qwat_sys.audit_table('qwat_od.leak');
PERFORM qwat_sys.audit_table('qwat_od.meter');
PERFORM qwat_sys.audit_table('qwat_od.pipe');
PERFORM qwat_sys.audit_table('qwat_od.pressurezone');
PERFORM qwat_sys.audit_table('qwat_od.printmap');
PERFORM qwat_sys.audit_table('qwat_od.protectionzone');
PERFORM qwat_sys.audit_table('qwat_od.samplingpoint');
PERFORM qwat_sys.audit_table('qwat_od.subscriber');
PERFORM qwat_sys.audit_table('qwat_od.subscriber_reference');
PERFORM qwat_sys.audit_table('qwat_od.surveypoint');
PERFORM qwat_sys.audit_table('qwat_od.valve');

PERFORM qwat_sys.audit_table('qwat_vl.cistern');
PERFORM qwat_sys.audit_table('qwat_vl.hydrant_provider');
PERFORM qwat_sys.audit_table('qwat_vl.hydrant_material');
PERFORM qwat_sys.audit_table('qwat_vl.leak_cause');
PERFORM qwat_sys.audit_table('qwat_vl.overflow');
PERFORM qwat_sys.audit_table('qwat_vl.pipe_function');
PERFORM qwat_sys.audit_table('qwat_vl.pipe_installmethod');
PERFORM qwat_sys.audit_table('qwat_vl.pipe_material');
PERFORM qwat_sys.audit_table('qwat_vl.pipe_protection');
PERFORM qwat_sys.audit_table('qwat_vl.precision');
PERFORM qwat_sys.audit_table('qwat_vl.pressurecontrol_type');
PERFORM qwat_sys.audit_table('qwat_vl.protectionzone_type');
PERFORM qwat_sys.audit_table('qwat_vl.pump_type');
PERFORM qwat_sys.audit_table('qwat_vl.remote_type');
PERFORM qwat_sys.audit_table('qwat_vl.source_quality');
PERFORM qwat_sys.audit_table('qwat_vl.source_type');
PERFORM qwat_sys.audit_table('qwat_vl.status');
PERFORM qwat_sys.audit_table('qwat_vl.subscriber_type');
PERFORM qwat_sys.audit_table('qwat_vl.survey_type');
PERFORM qwat_sys.audit_table('qwat_vl.tank_firestorage');
PERFORM qwat_sys.audit_table('qwat_vl.valve_function');
PERFORM qwat_sys.audit_table('qwat_vl.valve_maintenance');
PERFORM qwat_sys.audit_table('qwat_vl.valve_actuation');
PERFORM qwat_sys.audit_table('qwat_vl.valve_type');
PERFORM qwat_sys.audit_table('qwat_vl.visible');
END
$$;
