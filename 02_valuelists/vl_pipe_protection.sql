/*
	qWat - QGIS Water Module
	
	SQL file :: pipe protection detail
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat.vl_pipe_protection CASCADE;
CREATE TABLE qwat.vl_pipe_protection (id integer not null, CONSTRAINT "vl_pipe_protection_pk" PRIMARY KEY (id) );
COMMENT ON TABLE qwat.vl_pipe_protection IS 'Pipe prtoection details.';

ALTER TABLE qwat.vl_pipe_protection ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_pipe_protection ADD COLUMN value_en varchar(30) default '';
ALTER TABLE qwat.vl_pipe_protection ADD COLUMN value_fr varchar(30) default '';
ALTER TABLE qwat.vl_pipe_protection ADD COLUMN value_ro varchar(30) default '';

/* VALUES */
INSERT INTO qwat.vl_pipe_protection (id,value_fr,value_ro) VALUES (4302,'SOMO PVC','SOMO PVC');                			/* TB_id: 2  */
INSERT INTO qwat.vl_pipe_protection (id,value_fr,value_ro) VALUES (4304,'SOMO autre','SOMO de alt tip');              		/* TB_id: 4  */
INSERT INTO qwat.vl_pipe_protection (id,value_fr,value_ro) VALUES (4310,'SOMO PE','SOMO PE');                 			/* TB_id: 11 */
INSERT INTO qwat.vl_pipe_protection (id,value_fr,value_ro) VALUES (4301,'ancienne conduite AGG','conductă veche de OLG');   	/* TB_id: 10 */
INSERT INTO qwat.vl_pipe_protection (id,value_fr,value_ro) VALUES (4303,'ancienne conduite F','conductă veche Fontă');     	/* TB_id: 3  */
INSERT INTO qwat.vl_pipe_protection (id,value_fr,value_ro) VALUES (4305,'ancienne conduite TAC','conductă veche Azbociment');   /* TB_id: 6  */
INSERT INTO qwat.vl_pipe_protection (id,value_fr,value_ro) VALUES (4306,'ancienne conduite AC','conductă veche OL');    	/* TB_id: 5  */
INSERT INTO qwat.vl_pipe_protection (id,value_fr,value_ro) VALUES (4307,'ancienne conduite PE','conductă veche PE');    	/* TB_id: 7  */
INSERT INTO qwat.vl_pipe_protection (id,value_fr,value_ro) VALUES (4308,'ancienne conduite autre','conductă veche de alt tip'); /* TB_id: 8  */
INSERT INTO qwat.vl_pipe_protection (id,value_fr,value_ro) VALUES (4309,'dans tuyau ciment','în conductă ciment');       	/* TB_id: 9  */
INSERT INTO qwat.vl_pipe_protection (id,value_fr,value_ro) VALUES (4311,'flexible','flexibilă');                		/* TB_id: 12 */


