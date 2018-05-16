
/*
Classe O_CHAMBRE 
Cette classe regroupe toutes les chambres, sauf les chambres de captages. Une chambre 
est un ouvrage enterré et fermé permettant l’accès à des personnes pour des opérations 
d’exploitation et de maintenance. Comme les fonctions d’une chambre peuvent être plurielles 
et diverses, il est décidé, par souci d’homogénéité sur l’ensemble du canton, de définir un 
nombre restreint de types de chambres. Les fonctionnalités d’une chambre sont ensuite 
précisées à l’aide des installations qu’elle contient. Les attributs uniques à cette classe sont : 
 

Nom : le nom distinctif et descriptif de l’infrastructure en question 
Fonction_chambre : son domaine des valeurs comprend : 
	 livraison unilaterale (LU) : chambre de livraison d’eau unidirectionnelle à un autre distributeur (donc changement de propriétaire), contenant une ou plusieurs installations, mais en tout cas une livraison 
	 livraison reciproque (LR) : chambre de livraison d’eau bidirectionnelle avec un autre distributeur (donc changement de propriétaire), pouvant également contenir d’autres installations 
	 chambre (CG) : chambre générique, contenant une ou plusieurs installations, à l’exception de la livraison. 
Mesure_plan : Pour toute(s) mesure(s) planifiée(s) sur l’ouvrage en question 
Orisymbole : L’angle de rotation du symbole pour son orientation dans la direction du flux de l’eau. Les valeurs d’angle sont comprises entre 0° et 360° (degrés) dans le sens horaire et depuis le nord. 

*/



CREATE OR REPLACE VIEW qwat_ch_fr_aquafri.o_chambre AS

	SELECT 
		installation.id AS OBJECTID,
		COALESCE(installation.name, element.identification)  AS Nom,

		'CG' AS Fonction_chambre,
		--CASE WHEN networkseparation IS TRUE THEN 'VA' ELSE 'CG' END AS Fonction_chambre, --specific for mgi
		year AS Annee_construction,
		precision.code AS Precision_plan,
		distributor.name AS Proprietaire,
		status.code AS Etat_exploitation,
		null AS Mesure_plan,
		element.remark AS Remarque,
		element.orientation AS Orisymbole,
		element.fk_folder AS Dossier_id,
		
		CASE 
			WHEN GeometryType(element.geometry) != 'POINT' THEN 
				ST_Force2D(ST_Centroid(element.geometry))
			ELSE
				ST_Force2D(element.geometry) 
		END AS geometry

		
FROM qwat_od.vw_qwat_installation installation
     JOIN qwat_od.vw_node_element element ON installation.id = element.id
	 
		LEFT JOIN qwat_ch_fr_aquafri.precision precision ON element.fk_precision = precision.id
		LEFT JOIN qwat_ch_fr_aquafri.status status ON element.fk_status = status.id
		LEFT JOIN qwat_od.distributor distributor ON element.fk_distributor = distributor.id
	 
		WHERE
		installation.installation_type = 'chamber'
	;
	
GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.o_chambre TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.o_chambre TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.o_chambre TO qwat_manager;