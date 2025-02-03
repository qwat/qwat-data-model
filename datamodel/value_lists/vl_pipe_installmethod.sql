/*
	qWat - QGIS Water Module

	SQL file :: pressure vl_pipe_installmethod
*/


/* CREATE TABLE */
CREATE TABLE qwat_vl.pipe_installmethod () INHERITS ( qwat_vl.value_list_base );
ALTER TABLE qwat_vl.pipe_installmethod ADD CONSTRAINT vl_pipe_installmethod_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.pipe_installmethod IS 'Installation methods.';

/* VALUES */
INSERT INTO qwat_vl.pipe_installmethod (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.pipe_installmethod (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.pipe_installmethod (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4201,'En fouille','Excavare');   /*TB: F   => 1 */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4202,'Chemisé','Cămăşuire');      /*TB: CH  => 2 */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4203,'Air libre','Aer liber');    /*TB: AL  => 3 */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4204,'Sous pont','Sub pod');    /*TB: SP  => 4 */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4205,'Protégé','Protejată');      /*TB: PRO => 5 */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4206,'Bétoné','Betonată');       /*TB: B   => 6 */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4207,'Galerie','Galerie');      /*TB: G   => 7 */

/* SIA405 codes */
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'offener_Graben' WHERE value_fr = 'En fouille';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'offener_Graben' WHERE value_fr = 'Chemisé';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'freiliegend' WHERE value_fr = 'Air libre';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'freiliegend' WHERE value_fr = 'Sous pont';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'offener_Graben' WHERE value_fr = 'Protégé';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'offener_Graben' WHERE value_fr = 'Bétoné';
UPDATE qwat_vl.pipe_installmethod SET sia405code = 'grabenlos' WHERE value_fr = 'Galerie';
