/*

-- O_CONDUITE 

Fonction_conduite :
	conduite drainante (DR) : conduite ou canalisation destinée au captage d’eau de sources ou puits horizontaux par drainage. 
	conduite de captage (CC) : conduite ou canalisation non drainante (à la suite de la partie drainante) destinée à l’acheminement de l’eau jusqu’à la chambre ou au puits horizontal. 
	conduite de transport (CT) : conduites servant au transport de l’eau entre les sites de production, de pompage et de stockage, avec peu ou pas de distribution en chemin. 
	conduite de distribution (CD) : toutes les conduites servant à la distribution. 
	conduite de branchement (CB) : conduites (en général privées) entre la conduite de distribution et l’installation intérieure d’un immeuble. 
	conduite de hydrant (CH) : conduite entre la vanne de séparation sur la conduite de distribution et la borne hydrante 
	conduite de vidange (CV) : conduite de vidange d’un ouvrage quelconque. 
	conduite interne (CI) : conduite, à l’intérieur des ouvrages, construite pour la topologie lorsque la géométrie du set de données livré fait défaut. 
	conduite de sprinkler (SP) : conduite de raccordement d’un bâtiment équipé d’une installation sprinkler, depuis la conduite de distribution jusqu’à l’entrée du bâtiment 
Type_materiau : 
	inconnu (IN) 
	fibrociment (FI) 
	beton (BE) 
	fonte (FO) 
	fonte_grise (FG) 
	fonte_ductile (FD) 
	resine_epoxy (RE) 
	polypropylene (PP) 
	pvc (PV) 
	polyethylene (PE) 
	acier (AC) 
	autre (AU) 
Subtype_materiau : selon la dénomination du catalogue de données de la recommandation GW1002 de la SSIGE (cf. D Annexe). 
Diam_interieur : [mm] 
Diam_exterieur : pour tuyaux en matière plastique [mm] 
P_admise : pression nominale (PN), qui correspondant à une pression d’eau dans le tuyau maintenue constante à 20 °C pendant 50 ans sans défaillance [bar] 
Mesure_plan : Pour toute(s) mesure(s) planifiée(s) sur l’ouvrage en question 
Zone_pression : Code unique qui indique l’appartenance d’un objet à une zone de pression 

*/

		
CREATE OR REPLACE VIEW qwat_ch_fr_aquafri.o_conduite AS

	SELECT 
		--row_number() OVER() AS "id",
		pipe.id AS OBJECTID,
		pipe_function.code AS Fonction_conduite,
		pipe_material_code.code AS Type_materiau,
		null AS Subtype_materiau,
		round(pipe_material.diameter_internal)::INTEGER AS Diam_interieur,
		round(pipe_material.diameter_external)::INTEGER AS Diam_exterieur,
		pipe.pressure_nominal AS P_admise,
		pipe.year AS Annee_construction,
		precision.code AS Precision_plan,
		distributor.name AS Proprietaire,
		status.code AS Etat_exploitation,
		null AS Mesure_plan,
		pipe.remark AS Remarque,
		pressurezone.name AS Zone_pression,
		pipe._length2d AS SHAPE_Length,
		pipe.fk_folder AS Dossier_id,
		
		-- pipe.label_1_text AS usr_etiquette,
		
		ST_Force2D(pipe.geometry) AS geometry

		
    FROM qwat_od.pipe
	
		LEFT JOIN qwat_ch_fr_aquafri.pipe_function pipe_function ON pipe.fk_function = pipe_function.id
		LEFT JOIN qwat_vl.pipe_material pipe_material ON pipe.fk_material = pipe_material.id
		LEFT JOIN qwat_ch_fr_aquafri.pipe_material pipe_material_code ON pipe.fk_material = pipe_material_code.id
		LEFT JOIN qwat_od.pressurezone pressurezone ON pipe.fk_pressurezone = pressurezone.id
		LEFT JOIN qwat_od.distributor distributor ON pipe.fk_distributor = distributor.id
		LEFT JOIN qwat_ch_fr_aquafri.precision precision ON pipe.fk_precision = precision.id
		LEFT JOIN qwat_ch_fr_aquafri.status status ON pipe.fk_status = status.id
	;
	
GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.o_conduite TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.o_conduite TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.o_conduite TO qwat_manager;
