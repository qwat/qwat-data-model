/*

Classe I_VANNE 

 Nom_numero: le nom ou numéro distinctif de l’installation en question 
Fonction_vanne : son domaine des valeurs comprend : 
	 vanne hydrant (VH) : vanne de sectionnement sur la conduite de la borne hydrante 
	 vanne reseau (VR) : toute vanne de sectionnement de secteurs de réseau 
	 vanne raccordement (VA) : vanne de sectionnement sur la conduite de raccordement au réseau 
	 vanne vidange (VV) : vanne de vidange 
	 robinet de prélèvement (RO) : robinet à l’intérieur des ouvrages, ou point à l’intérieur d’un immeuble ou à l’extérieur (par exemple fontaine) utilisé pour le prélèvement d’échantillons d’eau potable pour l’analyse. 
	 vanne incendie (VI) : vanne incendie garantissant une réserve d’incendie 
	 vanne regulation (VG) : vanne de régulation de la pression et/ou du débit  clapet anti-retour (VC) 
Etat_connexion: Son domaine des valeurs comprend : 
	ouvert (OU) 
	ferme (FE) [VR] 
Type_transmission : Son domaine des valeurs comprend : 
	cable (CA) 
	radio (RA) 
	inexistant (IX) [VI] 
Centrale_id : code de la centrale principale 
Orisymbole : L’angle de rotation du symbole pour son orientation dans la direction du flux de l’eau. Les valeurs d’angle sont comprises entre 0° et 360° (degrés) dans le sens horaire et depuis le nord. 
Zone_pression : Code unique qui indique l’appartenance d’un objet à une zone de pression 

*/


CREATE OR REPLACE VIEW qwat_ch_fr_aquafri.i_vanne AS

	SELECT 
		valve.id AS OBJECTID,
		valve.identification AS Nom_numero,
		valve_function.code AS Fonction_vanne,
		
		CASE 
			WHEN valve.closed IS TRUE THEN 'FE' 
			WHEN valve.fk_valve_function = '6103' THEN 'FE' -- vanne bypass
			ELSE 'OU' 
		END AS Etat_connexion,
			
		CASE WHEN valve.fk_valve_actuation =  6404 THEN 'CA' END AS Type_transmission, --actuation type = telecommandé

		null AS Centrale_id,

		valve.year AS Annee_installation,
		precision.code AS Precision_plan,
		distributor.name AS Proprietaire,
		status.code AS Etat_exploitation,
		valve.remark AS Remarque,
		valve.orientation AS Orisymbole,
		pressurezone.name AS Zone_pression,		
		valve.fk_folder AS Dossier_id,		

		
		ST_Force2D(valve.geometry) AS geometry

		
    FROM qwat_od.valve 


		LEFT JOIN qwat_ch_fr_aquafri.valve_function valve_function ON valve.fk_valve_function = valve_function.id
		
		LEFT JOIN qwat_od.pressurezone pressurezone ON valve.fk_pressurezone = pressurezone.id
		LEFT JOIN qwat_ch_fr_aquafri.precision precision ON valve.fk_precision = precision.id
		LEFT JOIN qwat_ch_fr_aquafri.status status ON valve.fk_status = status.id
		LEFT JOIN qwat_od.distributor distributor ON valve.fk_distributor = distributor.id
	;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.i_vanne TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.i_vanne TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.i_vanne TO qwat_manager;