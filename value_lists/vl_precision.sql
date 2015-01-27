/*
	qWat - QGIS Water Module
	
	SQL file :: pressure precision
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_vl.precision CASCADE;
CREATE TABLE qwat_vl.precision (id integer not null, CONSTRAINT "precision_pk" PRIMARY KEY (id) );
COMMENT ON TABLE qwat_vl.precision IS 'pressure precision.';

/* COLUMNS */
ALTER TABLE qwat_vl.precision ADD COLUMN vl_active      boolean default true;
ALTER TABLE qwat_vl.precision ADD COLUMN value_en       varchar(30) default '';
ALTER TABLE qwat_vl.precision ADD COLUMN value_fr       varchar(30) default '';
ALTER TABLE qwat_vl.precision ADD COLUMN value_ro       varchar(30) default '';
ALTER TABLE qwat_vl.precision ADD COLUMN description_en varchar(30) default '';
ALTER TABLE qwat_vl.precision ADD COLUMN description_fr varchar(30) default '';
ALTER TABLE qwat_vl.precision ADD COLUMN description_ro varchar(30) default '';
ALTER TABLE qwat_vl.precision ADD COLUMN code_sire      smallint ;

/* VALUES */
INSERT INTO qwat_vl.precision (id,code_sire,value_en,value_fr,value_ro) VALUES (1101,1, 'Unprecise',	'Imprécis',	'Imprecisă');	/*TB: IP => 1 */
INSERT INTO qwat_vl.precision (id,code_sire,value_en,value_fr,value_ro) VALUES (1102,0, 'Precise',    	'Précis',	'Precisă');	/*TB: P  => 2 */
INSERT INTO qwat_vl.precision (id,code_sire,value_en,value_fr,value_ro) VALUES (1103,1, 'Localized',  	'Localisé',	'Localizată');	/*TB: L  => 3 */
INSERT INTO qwat_vl.precision (id,code_sire,value_en,value_fr,value_ro) VALUES (1104,1, 'Digitalized', 	'Digitalisé',	'Digitizată');	/*TB: D  => 4 */
INSERT INTO qwat_vl.precision (id,code_sire,value_en,value_fr,value_ro) VALUES (1105,1, 'Unknown',     	'Inconnu',	'Necunoscută');	/*TB: I  => 5 */


