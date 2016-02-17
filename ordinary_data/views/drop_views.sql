
/* schematic */
drop view if exists qwat_od.vw_pipe_schema;
drop view if exists qwat_od.vw_pipe_schema_visibleitems;
drop view if exists qwat_od.vw_pipe_schema_merged;
drop view if exists qwat_od.vw_pipe_schema_error;
drop view if exists qwat_od.vw_pressurezone_simplified;

/* draw lines */
drop view if exists qwat_od.vw_subscriber_pipe_relation;
drop view if exists qwat_od.vw_valve_lines;
drop view if exists qwat_od.vw_pipe_child_parent;

/* export views */
drop view if exists qwat_od.vw_search_view;

drop view if exists qwat_od.vw_export_hydrant;
drop view if exists qwat_od.vw_export_installation;
drop view if exists qwat_od.vw_export_meter;
drop view if exists qwat_od.vw_export_part;
drop view if exists qwat_od.vw_export_subscriber;
drop view if exists qwat_od.vw_export_valve;

drop view if exists qwat_od.vw_remote;
drop view if exists qwat_od.vw_pipe;
drop view if exists qwat_od.vw_leak;
drop view if exists qwat_od.vw_consumptionzone;
drop view if exists qwat_od.vw_printmap;
drop view if exists qwat_od.vw_protectionzone;

/* inheritance views*/
drop view if exists qwat_od.vw_element_hydrant;
drop view if exists qwat_od.vw_element_installation;
drop view if exists qwat_od.vw_element_meter;
drop view if exists qwat_od.vw_element_part;
drop view if exists qwat_od.vw_element_samplingpoint;
drop view if exists qwat_od.vw_element_subscriber;
drop view if exists qwat_od.vw_element_valve;

drop view if exists qwat_od.vw_installation_chamber;
drop view if exists qwat_od.vw_installation_pressurecontrol;
drop view if exists qwat_od.vw_installation_pump;
drop view if exists qwat_od.vw_installation_source;
drop view if exists qwat_od.vw_installation_tank;
drop view if exists qwat_od.vw_installation_treatment;

drop view if exists qwat_od.vw_qwat_node;
drop view if exists qwat_od.vw_qwat_network_element;
drop view if exists qwat_od.vw_qwat_installation;

drop view if exists qwat_od.vw_node_element;

drop type if exists qwat_od.installation_type;


