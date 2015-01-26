/*
	qWat - QGIS Water Module
	
	SQL file :: node tables
	
	it is used to know which elements might be on a node
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.node_table CASCADE;
CREATE TABLE qwat_od.node_table (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.node IS' 		   the table node_table contains the names of the tables (i.e. layers) that are typically considered as nodes.
		   node_type will be used as for the type in the node table if overwrite is true.
		   overwrite determines if the object type will be used instead of the computed node type.';

/* columns */
ALTER TABLE qwat_od.node_table ADD COLUMN table_name varchar(60);
ALTER TABLE qwat_od.node_table ADD COLUMN node_type  varchar(60);
ALTER TABLE qwat_od.node_table ADD COLUMN overwrite  boolean default false not null; COMMENT ON COLUMN qwat_od.node_table.overwrite IS 'if true, the type will be affected to the node even if two pipes are on it. e.g. useful for meters (node should be meter and not a two_XXXX).';

/* fill */
INSERT INTO qwat_od.node_table (table_name,node_type) VALUES ('installation_building'       , 'installation');
INSERT INTO qwat_od.node_table (table_name,node_type) VALUES ('installation_pressurecontrol', 'installation');
INSERT INTO qwat_od.node_table (table_name,node_type) VALUES ('installation_pump'           , 'installation');
INSERT INTO qwat_od.node_table (table_name,node_type) VALUES ('installation_source'         , 'installation');
INSERT INTO qwat_od.node_table (table_name,node_type) VALUES ('installation_tank'           , 'installation');
INSERT INTO qwat_od.node_table (table_name,node_type) VALUES ('installation_treatment'      , 'installation');
INSERT INTO qwat_od.node_table (table_name,node_type) VALUES ('installation_valvechamber'   , 'installation');
INSERT INTO qwat_od.node_table (table_name,node_type) VALUES ('valve'  , 'valve');
INSERT INTO qwat_od.node_table (table_name,node_type) VALUES ('hydrant', 'hydrant');


