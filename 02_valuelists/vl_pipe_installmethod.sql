/*
	qWat - QGIS Water Module
	
	SQL file :: pressure vl_pipe_installmethod
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_vl.pipe_installmethod CASCADE;
CREATE TABLE qwat_vl.pipe_installmethod (id integer not null, CONSTRAINT "vl_pipe_installmethod_pk" PRIMARY KEY (id) );
COMMENT ON TABLE qwat_vl.pipe_installmethod IS 'Installation methods.';

/* COLUMNS */
ALTER TABLE qwat_vl.pipe_installmethod ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.pipe_installmethod ADD COLUMN value_en varchar(30) default '';
ALTER TABLE qwat_vl.pipe_installmethod ADD COLUMN value_fr varchar(30) default '';
ALTER TABLE qwat_vl.pipe_installmethod ADD COLUMN value_ro varchar(30) default '';

/* VALUES */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4201,'En fouille','Excavare');   /*TB: F   => 1 */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4202,'Chemisé','Cămăşuire');      /*TB: CH  => 2 */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4203,'Air libre','Aer liber');    /*TB: AL  => 3 */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4204,'Sous pont','Sub pod');    /*TB: SP  => 4 */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4205,'Protégé','Protejată');      /*TB: PRO => 5 */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4206,'Bétoné','Betonată');       /*TB: B   => 6 */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4207,'Galerie','Galerie');      /*TB: G   => 7 */
INSERT INTO qwat_vl.pipe_installmethod (id,value_fr,value_ro) VALUES (4208,'Inconnu','Necunoscut');      /*TB: I   => 8 */


