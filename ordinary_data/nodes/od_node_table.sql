/*
	qWat - QGIS Water Module
	
	SQL file :: node tables
	
	it is used to know which elements might be on a node
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.node_table (id integer not null, CONSTRAINT node_table_pk PRIMARY KEY (id) );
COMMENT ON TABLE qwat_od.node_table IS 'the table node_table contains the names of the tables (i.e. layers) that are typically considered as nodes.
		   node_type will be used as for the type in the node table if overwrite is true.
		   overwrite determines if the object type will be used instead of the computed node type.';

/* columns */
ALTER TABLE qwat_od.node_table ADD COLUMN table_name varchar(60);
ALTER TABLE qwat_od.node_table ADD COLUMN node_type  varchar(60);
ALTER TABLE qwat_od.node_table ADD COLUMN overwrite  boolean default false not null; COMMENT ON COLUMN qwat_od.node_table.overwrite IS 'if true, the type will be affected to the node even if two pipes are on it. e.g. useful for meters (node should be meter and not a two_XXXX).';

/* fill */
INSERT INTO qwat_od.node_table (id,table_name,node_type) VALUES (9161,'installation'   , 'installation');
INSERT INTO qwat_od.node_table (id,table_name,node_type) VALUES (9168,'valve'  , 'valve');
INSERT INTO qwat_od.node_table (id,table_name,node_type) VALUES (9169,'hydrant', 'hydrant');
INSERT INTO qwat_od.node_table (id,table_name,node_type) VALUES (9170,'part', 'part');


