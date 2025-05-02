/*
	qWat - QGIS Water Module
	
	SQL file :: pipe protection detail
*/


/* CREATE TABLE */
CREATE TABLE qwat_vl.pipe_protection () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.pipe_protection ADD CONSTRAINT vl_pipe_protection_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.pipe_protection IS 'Pipe protection details.';


/* VALUES */
INSERT INTO qwat_vl.pipe_protection (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.pipe_protection (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.pipe_protection (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro, description_ro) VALUES (4302,'SOMO PVC','SOMO PVC', 'SOMO este o marcă dispărută a grupului Bouygues, nefolosită în Ro');                                 /* TB_id: 2  */
INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro,description_ro) VALUES (4304,'SOMO autre','SOMO de alt tip', 'SOMO este o marcă dispărută a grupului Bouygues, nefolosită în Ro');                        /* TB_id: 4  */
INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro, description_fr, description_ro) VALUES (4310,'SOMO PE','SOMO PE', 'SOMO est une ancienne marque disparue du groupe Bouygues qui ne caractérisait pas vraiment un type de tuyau, même si, dans la mémoire collective des années 80-90, cela voulait plutôt désigner, à tort, les tuyaux PE-câbles… ', 'SOMO este o marcă dispărută a grupului Bouygues, nefolosită în Ro'
);                                   /* TB_id: 11 */
INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro) VALUES (4301,'ancienne conduite AGG','conductă veche de OLG');       /* TB_id: 10 */
INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro) VALUES (4303,'ancienne conduite F','conductă veche Fontă');          /* TB_id: 3  */
INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro) VALUES (4305,'ancienne conduite TAC','conductă veche Azbociment');   /* TB_id: 6  */
INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro) VALUES (4306,'ancienne conduite AC','conductă veche OL');            /* TB_id: 5  */
INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro) VALUES (4307,'ancienne conduite PE','conductă veche PE');            /* TB_id: 7  */
INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro) VALUES (4308,'ancienne conduite autre','conductă veche de alt tip'); /* TB_id: 8  */
INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro) VALUES (4309,'dans tuyau ciment','în conductă ciment');              /* TB_id: 9  */
INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro) VALUES (4311,'flexible','flexibilă');                                /* TB_id: 12 */
INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro) VALUES (4313,'conduite AC','conductă OL');                           /* TB_id: 13 */
INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro) VALUES (4314,'conduite PE','conductă PE');                           /* TB_id: 14 */
INSERT INTO qwat_vl.pipe_protection (id,value_fr,value_ro) VALUES (4315,'conduite PVC','conductă PVC');                         /* TB_id: 15 */




