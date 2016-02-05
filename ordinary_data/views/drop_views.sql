/* search view */
drop view qwat_od.vw_search_view;

/* export views */
drop view qwat_od.vw_export_hydrant;
drop view qwat_od.vw_export_installation;
drop view qwat_od.vw_export_valve;
drop view qwat_od.vw_export_hydrant;
drop view qwat_od.vw_export_meter;
drop view qwat_od.vw_export_part;
drop view qwat_od.vw_export_subscriber;

/* inheritance views*/
drop view if exists qwat_od.vw_qwat_node;
drop view if exists qwat_od.vw_qwat_installation;
drop view if exists qwat_od.vw_qwat_network_element;

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

drop view if exists qwat_od.vw_node_element;


drop type if exists qwat_od.installation_type;


