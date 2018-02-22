/* Audit views only for those having explicit triggers handling data editing*/
CREATE OR REPLACE FUNCTION qwat_sys._list_audit_views() RETURNS text[] AS $body$
DECLARE
    views_to_audit text[];
BEGIN
    views_to_audit := ARRAY[
        'qwat_od.vw_consumptionzone',
        'qwat_od.vw_element_hydrant',
        'qwat_od.vw_element_installation',
        'qwat_od.vw_element_meter',
        'qwat_od.vw_element_part',
        'qwat_od.vw_element_samplingpoint',
        'qwat_od.vw_element_subscriber',
        'qwat_od.vw_protectionzone',
        'qwat_od.vw_qwat_installation',
        'qwat_od.vw_qwat_network_element',
        'qwat_od.vw_qwat_node'];
    return views_to_audit;
END
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys._list_audit_views() IS $body$
Return the views to be audited.
$body$;

CREATE OR REPLACE FUNCTION qwat_sys.activate_audit_views() RETURNS void AS $body$
BEGIN
    PERFORM qwat_sys.audit_view(t, 'true'::boolean, '{}'::text[], '{id}'::text[])
            FROM unnest(qwat_sys._list_audit_views()) t;
END
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys.activate_audit_views() IS $body$
Activate auditing of views.
$body$;

CREATE OR REPLACE FUNCTION qwat_sys.deactivate_audit_views() RETURNS void AS $body$
BEGIN
    PERFORM qwat_sys.unaudit_view(t) FROM unnest(qwat_sys._list_audit_views()) t;
END
$body$
LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_sys.deactivate_audit_views() IS $body$
Deactivate auditing of views.
$body$;


DO $$
BEGIN
    PERFORM qwat_sys.activate_audit_views();
END
$$;
