/*
    qWat - QGIS Water Module
    
    SQL file :: valve_function table
*/


/* CREATE */
CREATE TABLE qwat_vl.valve_function () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.valve_function ADD CONSTRAINT vl_valve_function_pk PRIMARY KEY (id);                    
COMMENT ON TABLE qwat_vl.valve_function IS 'Functions for valves';

/* COLUMNS*/
ALTER TABLE qwat_vl.valve_function ADD COLUMN schema_visible BOOLEAN NOT NULL default true;

/* VALUES */
INSERT INTO qwat_vl.valve_function (id, value_en, value_fr, value_ro )       VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.valve_function (id, value_en, value_fr, value_ro )       VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.valve_function (id, value_en, value_fr, value_ro )       VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro )                 VALUES (6101,                       'vanne de régulation',    'vană reglaj');
INSERT INTO qwat_vl.valve_function (id, value_fr, short_fr, value_ro )       VALUES (6102,                       'ventouse','Ve',          'aerisire');
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro )                 VALUES (6103,                       'vanne by-pass',          'vană by-pass');
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro, schema_visible ) VALUES (6104,                       'vanne d''ouvrage',       'vană deschidere' ,'false');
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro, schema_visible ) VALUES (6105,                       'vanne branchement',      'robinet concesie','false');
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro )                 VALUES (6106,                       'prise de secours',       '');
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro )                 VALUES (6107,                       'vanne incendie',         'vană incendiu');
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro )                 VALUES (6108,                       'vanne d''hydrant',       'vană hidrant');
INSERT INTO qwat_vl.valve_function (id, value_fr, short_fr,value_ro )        VALUES (6110,                       'vidange',         'Vi',  'vană golire');
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro)                  VALUES (6111,                       'vanne réseau',           'vană cu sertar');
INSERT INTO qwat_vl.valve_function (id, value_fr, short_fr, value_ro)        VALUES (6112,                       'vidange-ventouse','ViVe','golire-aerisire');
INSERT INTO qwat_vl.valve_function (id, value_en, value_fr, value_ro)        VALUES (6113, 'backflow prevention','antirefoulement',        'antiretur');
INSERT INTO qwat_vl.valve_function (id, value_en, value_fr, value_ro )       VALUES (6115, 'vent valve',         'jauge',                  'aerisire');

