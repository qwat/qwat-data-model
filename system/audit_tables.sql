/* Audit */
CREATE OR REPLACE FUNCTION qwat_sys._list_audit_tables() RETURNS text[] AS $body$
DECLARE
    tables_to_audit text[];
BEGIN
    tables_to_audit := ARRAY[
        --qwat_dr
        'qwat_dr.annotationline',
        'qwat_dr.annotationpoint',
        'qwat_dr.constructionpoint',
        'qwat_dr.dimension_distance',
        'qwat_dr.dimension_orientation',
        --qwat_od
        'qwat_od.distributor',
        'qwat_od.district',
        'qwat_od.folder',
        'qwat_od.leak',
        'qwat_od.pipe',
        'qwat_od.printmap',
        'qwat_od.protectionzone',
        'qwat_od.remote',
        'qwat_od.surveypoint',
        'qwat_od.valve',
        -- qwat_vl
        'qwat_vl.cistern',
        'qwat_vl.hydrant_provider',
        'qwat_vl.hydrant_material',
        'qwat_vl.leak_cause',
        'qwat_vl.overflow',
        'qwat_vl.pipe_function',
        'qwat_vl.pipe_installmethod',
        'qwat_vl.pipe_material',
        'qwat_vl.pipe_protection',
        'qwat_vl.precision',
        'qwat_vl.pressurecontrol_type',
        'qwat_vl.protectionzone_type',
        'qwat_vl.pump_type',
        'qwat_vl.remote_type',
        'qwat_vl.source_quality',
        'qwat_vl.source_type',
        'qwat_vl.status',
        'qwat_vl.subscriber_type',
        'qwat_vl.survey_type',
        'qwat_vl.tank_firestorage',
        'qwat_vl.valve_function',
        'qwat_vl.valve_maintenance',
        'qwat_vl.valve_actuation',
        'qwat_vl.valve_type',
        'qwat_vl.visible'];
    return tables_to_audit;
END
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys._list_audit_tables() IS $body$
Return the tables to be audited.
$body$;

CREATE OR REPLACE FUNCTION qwat_sys.activate_audit_tables() RETURNS void AS $body$
BEGIN
    PERFORM qwat_sys.audit_table(t) FROM unnest(qwat_sys._list_audit_tables()) t;
END
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys.activate_audit_tables() IS $body$
Activate auditing of tables.
$body$;

CREATE OR REPLACE FUNCTION qwat_sys.deactivate_audit_tables() RETURNS void AS $body$
BEGIN
    PERFORM qwat_sys.unaudit_table(t) FROM unnest(qwat_sys._list_audit_tables()) t;
END
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys.deactivate_audit_tables() IS $body$
Deactivate auditing of tables.
$body$;


DO $$
BEGIN
    PERFORM qwat_sys.activate_audit_tables();
END
$$;
