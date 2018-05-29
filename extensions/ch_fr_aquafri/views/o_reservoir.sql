
/*
Classe O_RESERVOIR 
Cette classe regroupe tous les ouvrages de stockage de l’eau potable. Comme certains réservoirs regroupent plusieurs cuves raccordées en parallèle ou à la suite, la différentiation 
se fait par cuve, c’est-à-dire que chaque cuve représente un objet distinct, même en cas de cuves concentriques, pour autant que les cuves soient séparées hydrauliquement. Les 
attributs uniques à cette classe sont : 


Nom : le nom distinctif et descriptif de l’infrastructure en question 
Type_reservoir : son domaine des valeurs comprend : 
	 reservoir (RS) : réservoir de tête 
	 reservoir avec STAP (RA) : réservoir avec station de pompage vers un niveau supérieur 
	 bassin avec STAP (RB) : station de pompage depuis un bassin d’accumulation à la pression atmosphérique 
Niv_eau : niveau d’eau maximal [m.s.m.] 
V_utilisation : volume dévolu à la fluctuation journalière normale, ou dans le cas du bassin avec STAP (RB), du volume d’accumulation total [m³] 
V_securite : volume dévolu à la couverture d’incidents comme une panne électrique, une pompe défectueuse ou encore le nettoyage d’une chambre de captage, etc. interrompant momentanément l’alimentation du réservoir [m³] 
V_incendie : volume dévolu à la défense incendie et hydrauliquement indépendant [m³] [RS ; RA] 
Annee_renovation : année d’importantes rénovations sur une ou plusieurs composantes essentielles de l’ouvrage, ayant comme conséquence une prolongation notoire de la durée d’exploitation technique de l’ouvrage. Il s’agit de modifications importantes de la structure et/ou du fonctionnement, hors mesures d’entretien et de modifications d’ordre mineur. 
Mesure_plan : Pour toute(s) mesure(s) planifiée(s) sur l’ouvrage en question 
Zone_pression : Code unique qui indique l’appartenance d’un objet à une zone de pression 

*/


CREATE OR REPLACE VIEW qwat_ch_fr_aquafri.o_reservoir AS

	SELECT 
		installation.id AS OBJECTID,
		COALESCE(installation.name, element.identification)  AS Nom,

		'RS' AS Type_reservoir,
		
		altitude_overflow AS Niv_eau,
		
		storage_supply::INTEGER AS V_utilisation,
		null AS V_securite, --add in Qwat datamodel ?
		storage_fire::INTEGER AS V_incendie,
				
		year AS Annee_construction,
		null AS Annee_renovation,
		precision.code AS Precision_plan,
		distributor.name AS Proprietaire,
		status.code AS Etat_exploitation,
		null AS Mesure_plan,
		element.remark AS Remarque,
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
		LEFT JOIN qwat_ch_fr_aquafri.precision precision ON element.fk_precision = precision.id
		LEFT JOIN qwat_ch_fr_aquafri.status status ON element.fk_status = status.id
		LEFT JOIN qwat_od.distributor distributor ON element.fk_distributor = distributor.id
	 
		WHERE
		installation.installation_type = 'tank'
	;
	
	
GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.o_reservoir TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.o_reservoir TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.o_reservoir TO qwat_manager;