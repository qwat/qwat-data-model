/*

Classe I_MESURE 
Cette classe regroupe quelques installations de mesures.  

Nom_numero: le nom ou numéro distinctif de l’installation en question 
Type_mesure : son domaine des valeurs comprend : 
	 debitmetre (DM) : toutes les installations de mesure de débit dans le réseau de transport et de distribution, à l’exception des compteurs sur les raccordements privés 
	 turbidimetre (TM) : mesure de la turbidite, pas dans Qwat
	 chlorimetre (CM) : mesure du chlore residuel, pas dans Qwat 
Type_transmission : Son domaine des valeurs comprend : 
	cable (CA) 
	radio (RA) 
	inexistant (IX) [TM] 
Centrale_id : code de la centrale principale 
Zone_pression : Code unique qui indique l’appartenance d’un objet à une zone de pression 
*/


	 
	 CREATE OR REPLACE VIEW qwat_ch_fr_aquafri.i_mesure AS

		SELECT 
		
			element.id AS OBJECTID,
			element.identification AS Nom_numero,
			
			'DM' AS Type_mesure,
			
			null AS Type_transmission,
			null AS Centrale_id,
			
			element.year AS Annee_installation,
			distributor.name AS Proprietaire,
			status.code AS Etat_exploitation,
			element.remark AS Remarque,
			pressurezone.name AS Zone_pression,		
			element.fk_folder AS Dossier_id,	
			
			CASE 
				WHEN GeometryType(element.geometry) != 'POINT' THEN 
					ST_Force2D(ST_Centroid(element.geometry))
				ELSE
					ST_Force2D(element.geometry) 
			END AS geometry
			
		 FROM qwat_od.part part
			JOIN qwat_od.vw_node_element element ON part.id = element.id
			 
			LEFT JOIN qwat_od.pressurezone pressurezone ON element.fk_pressurezone = pressurezone.id
			LEFT JOIN qwat_ch_fr_aquafri.status status ON element.fk_status = status.id
			LEFT JOIN qwat_od.distributor distributor ON element.fk_distributor = distributor.id
			
			WHERE part.fk_part_type = 9210 -- débitmètre
			;
	
GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.i_mesure TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.i_mesure TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.i_mesure TO qwat_manager;