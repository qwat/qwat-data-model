/*
Classe I_REDUCTEUR 
Cette classe regroupe toutes les installations de réductions de pression. 

Nom: le nom distinctif et descriptif de l’installation en question 
Type_transmission : Son domaine des valeurs comprend : 
	cable (CA) 
	radio (RA) 
	inexistant (IX) 
Type_reducteur : son domaine des valeurs comprend : 
	 reducteur pression (RE) : dispositif de réduction de la pression, avec pression résiduelle de sortie supérieure à la pression atmosphérique 
	 brise charge (BC) : chambre de réduction de la charge à la pression atmosphérique 
Niv : niveau altimétrique de l’installation [m.s.m.] 
H_sortie : niveau de charge à la sortie du réducteur [m.s.m.] 
Orisymbole : L’angle de rotation du symbole pour son orientation dans la direction du flux de l’eau. Les valeurs d’angle sont comprises entre 0° et 360° (degrés) dans le sens horaire et depuis le nord. 
Zone_pression : Code unique qui indique l’appartenance d’un objet à une zone de pression 
*/


		
CREATE OR REPLACE VIEW qwat_ch_fr_aquafri.i_reducteur AS

	SELECT 
		installation.id AS OBJECTID,
		COALESCE(installation.name, element.identification)  AS Nom,
		
		CASE WHEN fk_pressurecontrol_type = 2801 THEN 
			'RE' -- réducteur
		ELSE 
			'BC' --coupe-pression
		END AS Type_reducteur,
		element.altitude AS Niv,
		null AS H_sortie, --add in qwat datamodel ?

		remote.code AS Type_transmission,
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
		installation.installation_type = 'pressurecontrol'
		AND
		fk_pressurecontrol_type IN (2801,2802) -- réducteur, coupe-pression
		
	;
	
GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.i_reducteur TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.i_reducteur TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.i_reducteur TO qwat_manager;