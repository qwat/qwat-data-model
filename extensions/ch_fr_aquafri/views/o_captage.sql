
/*

Classe O_CAPTAGE 

Nom : le nom distinctif et descriptif de l’infrastructure en question 
Type_captage : son domaine des valeurs comprend : 
	 captage source (SO) : toute chambre de captage de source (en tant qu’eau apparaissant à la surface terrestre sans être relevée artificiellement) réceptrice d’un ou plusieurs drains de captage 
	 chambre de rassemblement (CR) : chambre recevant l’eau de chambres de captage de sources situées à l’amont, ainsi que de drains de captages arrivant directement dans la chambre 
	 puits vertical (PV) : puits d’eau souterraine à drain filtrant vertical 
	 puits horizontal (PH) : puits d’eau souterraine à drains filtrants horizontaux 
	 captage surface (CS) : les captages d’eaux de surface (majoritairement en lac) 
Niv_eau : pour les captages de source et les chambres de rassemblement, c’est le niveau d’eau de la mise en charge au départ de la chambre vers la chambre suivante ou vers le réservoir / STAP [m.s.m.] [SO ; CR] 
Niv_nappe : pour les puits d’eau souterraine, le niveau minimal de la nappe sous le niveau du terrain [m.s.m.] [PV ; PH] 
Prof_puits : profondeur du puits [m] [PV ; PH] 
Prof_crepine : pour les captages d’eaux de surface, la profondeur moyenne de la crépine de captage sous le niveau de l’eau [m.] [CS] 
Nbr_drains : le nombre de drains aboutissant dans la chambre, et pour les puits à drains horizontaux, le nombre de drains radiaux (à cumuler s’ils sont répartis sur plusieurs niveaux) [SO ; CR ; PH] 
Diam_puits : diamètre du tube filtrant ou du puits [mm] [PV ; PH] 
Q_min : débit d’étiage moyen du ou des drains arrivant dans la chambre [l/min] [SO ; CR] 
Q_moy : débit moyen du ou des drains arrivant dans la chambre [l/min]  [SO ; CR] 
Q_max : débit maximal moyen du ou des drains arrivant dans la chambre [l/min] [SO ; CR] 
Q_concession : pour les captages d’eau publique, le débit de concession [l/min] 
Annee_renovation : année d’importantes rénovations sur une ou plusieurs composantes essentielles de l’ouvrage, ayant comme conséquence une prolongation notoire de la durée d’exploitation technique de l’ouvrage. Il s’agit de modifications importantes de la structure et/ou du fonctionnement, hors mesures d’entretien et de modifications d’ordre mineur. 
Mesure_plan : Pour toute(s) mesure(s) planifiée(s) sur l’ouvrage en question 
Zone_pression : Code unique qui indique l’appartenance d’un objet à une zone de 
*/



		
CREATE OR REPLACE VIEW qwat_ch_fr_aquafri.o_captage AS

	SELECT 
		installation.id AS OBJECTID,
		COALESCE(installation.name, element.identification)  AS Nom,

		CASE 
			WHEN gathering_chamber = true THEN 'CR' -- chambre de rassemblement
			WHEN fk_pressurecontrol_type =2803 THEN 'CR' -- chambre de rassemblement
			ELSE source_type.code
		END as Type_captage,

		null AS Niv_eau,
		null AS Niv_nappe,
		null AS Prof_puits,
		null AS Prof_crepine,
		null AS Nbr_drains,
		null AS Diam_puits,
		installation.flow_lowest::INTEGER AS Q_min,
		installation.flow_average::INTEGER AS Q_moy,
		null AS Q_max,
		installation.flow_concession AS Q_concession,
		year AS Annee_construction,
		null AS Annee_renovation,
		
		
		precision.code AS Precision_plan,
		distributor.name AS Proprietaire,
		status.code AS Etat_exploitation,
		null AS Mesure_plan,
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
	 
		LEFT JOIN qwat_ch_fr_aquafri.source_type source_type ON installation.fk_source_type = source_type.id
		LEFT JOIN qwat_od.pressurezone pressurezone ON element.fk_pressurezone = pressurezone.id
		LEFT JOIN qwat_ch_fr_aquafri.remote_type remote ON installation.fk_remote = remote.id
		LEFT JOIN qwat_ch_fr_aquafri.precision precision ON element.fk_precision = precision.id
		LEFT JOIN qwat_ch_fr_aquafri.status status ON element.fk_status = status.id
		LEFT JOIN qwat_od.distributor distributor ON element.fk_distributor = distributor.id
	 
		WHERE
		installation.installation_type = 'source'
		OR
		installation.installation_type = 'pressurecontrol' AND fk_pressurecontrol_type =2803 -- rassemblement
	;
	
GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.o_captage TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.o_captage TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.o_captage TO qwat_manager;