/*
    qWat - QGIS Water Module
    
    SQL file :: pipe_function table
*/

/* CREATE */
CREATE TABLE qwat_vl.pipe_function () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.pipe_function ADD CONSTRAINT vl_pipe_function_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.pipe_function IS 'Function for pipe. Here is determined if pipe should be visible or not in the schematic view, but this can be overidden by the pipe attribute schema_force_visible.';

/* COLUMNS*/
ALTER TABLE qwat_vl.pipe_function ADD COLUMN schema_visible boolean not null default true;
ALTER TABLE qwat_vl.pipe_function ADD COLUMN major boolean not null default true;
ALTER TABLE qwat_vl.pipe_function ADD COLUMN code_sire smallint;

/* VALUES */
INSERT INTO qwat_vl.pipe_function (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.pipe_function (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.pipe_function (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.pipe_function (id,schema_visible,major,code_sire,value_fr,value_ro) VALUES (4101, true,  true,  2, 'Conduite de transport',      'Conductă de transport'      );
INSERT INTO qwat_vl.pipe_function (id,schema_visible,major,code_sire,value_fr,value_ro) VALUES (4102, false, true,  0, 'Conduite d''hydrant',        'Conductă de hidrant'        );
INSERT INTO qwat_vl.pipe_function (id,schema_visible,major,code_sire,value_fr,value_ro) VALUES (4103, false, false, 4, 'Conduite de vidange',        'Conductă de golire'         );
INSERT INTO qwat_vl.pipe_function (id,schema_visible,major,code_sire,value_fr,value_ro) VALUES (4105, true,  true,  2, 'Conduite de distribution',   'Conductă de distribuţie'    );
INSERT INTO qwat_vl.pipe_function (id,schema_visible,major,code_sire,value_fr,value_ro) VALUES (4106, false, false, 3, 'Branchement commun',         'Branşament comun'           );
INSERT INTO qwat_vl.pipe_function (id,schema_visible,major,code_sire,value_fr,value_ro) VALUES (4107, false, false, 2, 'By-pass',                    'By-pass'                    );
INSERT INTO qwat_vl.pipe_function (id,schema_visible,major,code_sire,value_fr,value_ro) VALUES (4108, false, false, 3, 'Branchement privé',          'Branşament privat'          );
INSERT INTO qwat_vl.pipe_function (id,schema_visible,major,code_sire,value_fr,value_ro) VALUES (4109, true , true , 2, 'Conduite de haute pression', 'Conductă de înaltă presiune');
INSERT INTO qwat_vl.pipe_function (id,schema_visible,major,code_sire,value_fr,value_ro) VALUES (4110, false, false, 1, 'Drain captant',              'Captare dren'               );
INSERT INTO qwat_vl.pipe_function (id,schema_visible,major,code_sire,value_fr,value_ro) VALUES (4111, true , true , 4, 'Trop plein',                 'Prea plin'                  );
INSERT INTO qwat_vl.pipe_function (id,schema_visible,major,code_sire,value_fr,value_ro) VALUES (4112, false, false, 4, 'Ventilation',                'Aerisire'                   );




