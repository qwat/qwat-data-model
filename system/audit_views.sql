/* Audit views only for those having explicit triggers handling data editing*/

-- SELECT qwat_sys.audit_view('qwat_od.vw_consumptionzone', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_element_hydrant', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_element_installation', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_element_meter', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_element_part', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_element_samplingpoint', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_element_subscriber', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_export_hydrant', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_export_installation', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_export_meter', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_export_part', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_export_subscriber', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_export_valve', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_installation_chamber', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_installation_pressurecontrol', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_installation_pump', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_installation_source', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_installation_tank', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_installation_treatment', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_leak', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_node_element', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_pipe', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_pipe_child_parent', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_pipe_schema_merged', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_pipe_schema', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_pipe_schema_error', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_pipe_schema_visibleitems', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_printmap', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_protectionzone', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_qwat_installation', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_qwat_network_element', 'true'::boolean, '{}'::text[], '{id}'::text[]);
SELECT qwat_sys.audit_view('qwat_od.vw_qwat_node', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_remote', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_search_view', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_subscriber_pipe_relation', 'true'::boolean, '{}'::text[], '{id}'::text[]);
-- SELECT qwat_sys.audit_view('qwat_od.vw_valve_lines', 'true'::boolean, '{}'::text[], '{id}'::text[]);


