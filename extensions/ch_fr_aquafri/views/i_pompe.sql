
/*
Classe I_POMPE 

Cette classe regroupe toutes les pompes, tant individuelles que les groupes de pompes. 
Nom: le nom distinctif et descriptif de l’installation en question 
Type_transmission : Son domaine des valeurs comprend : 
	cable (CA) 
	radio (RA) 
	inexistant (IX) 
Centrale_id : code de la station principale de commande du système (Centrale_ID), quand la valeur Type_transmission n’est pas IX 
Nbr_pompes : nombre total de pompes pour une seule zone de pression et un seul ouvrage 
Q_refoulement : débit nominal de refoulement, consistant en la somme des débits des pompes prévues pour le fonctionnement en parallèle (les débits de pompes à fonctionnement en alterné ne sont pas à sommer) 
Niv : niveau altimétrique des pompes [m.s.m.] 
H_mano : hauteur manométrique totale de la pompe, c’est-à-dire la somme de hauteur géométrique totale (différence d'altitude entre les deux niveaux), des pertes de charges et de la pression de refoulement à la sortie 
Orisymbole : L’angle de rotation du symbole pour son orientation dans la direction du flux de l’eau. Les valeurs d’angle sont comprises entre 0° et 360° (degrés) dans le sens horaire et depuis le nord. 
Zone_pression : Code unique qui indique l’appartenance d’un objet à une zone de pression 

*/

		
CREATE OR REPLACE VIEW qwat_ch_fr_aquafri.i_pompe AS

	SELECT 
		installation.id AS OBJECTID,
		COALESCE(installation.name, element.identification)  AS Nom,
		remote.code AS Type_transmission,
		null AS Centrale_id,
		installation.no_pumps AS Nbr_pompes,
		installation.rejected_flow::INTEGER AS Q_refoulement,
		element.altitude AS Niv,
		installation.manometric_height AS H_mano,
		element.year AS Annee_installation,
		distributor.name AS Proprietaire,
		status.code AS Etat_exploitation,
		element.remark AS Remarque,
		element.orientation AS Orisymbole,
		pressurezone.name AS Zone_pression,
		element.fk_folder AS Dossier_id,
		
		CASE 
			WHEN GeometryType(element.geometry) != 'POINT' THEN 
				ST_Force2D(ST_Centroid(element.geometry))
			ELSE
				ST_Force2D(element.geometry) 
		END AS geometry

		
FROM qwat_od.vw_qwat_installation installation
     JOIN qwat_od.vw_node_element element ON installation.id = element.id
	 
		LEFT JOIN qwat_od.pressurezone pressurezone ON element.fk_pressurezone = pressurezone.id
		LEFT JOIN qwat_ch_fr_aquafri.remote_type remote ON installation.fk_remote = remote.id
		LEFT JOIN qwat_ch_fr_aquafri.status status ON element.fk_status = status.id
		LEFT JOIN qwat_od.distributor distributor ON element.fk_distributor = distributor.id
	 
		WHERE
		installation.installation_type = 'pump'
	;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.i_pompe TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.i_pompe TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.i_pompe TO qwat_manager;