
/*

Classe I_TRAITEMENT 
Cette classe regroupe toutes les installations de traitement de l’eau. S’il s’agit un traitement 
multi-barrières, plusieurs traitements individuels peuvent se suivre. 

Nom: le nom distinctif et descriptif de l’installation en question 
Type_traitement : son domaine des valeurs comprend : 
	 floculation (FL) 
	 sedimentation (SE) 
	 filtre lent sable (FS) 
	 filtration rapide (FR) 
	 filtre membranaire (FM) 
	 chloration (CL) 
	 dioxyde de chlore (DC) 
	 ozonation (OZ) 
	 rayons UV (UV) 
	 charbon actif (CA) 
	 peroxide (HO) : péroxyde d’hydrogène (eau oxygénée) 
	 deFe deMn (DD) : déferrisation et / ou démanganisation 
	 aeration (AE) 
	 autre (AU) 
Type_transmission : Son domaine des valeurs comprend : 
	cable (CA) 
	radio (RA) 
	inexistant (IX) 
Centrale_id : code de la centrale principale 
Mesure_plan : Pour toute(s) mesure(s) planifiée(s) sur l’ouvrage en question 
Zone_pression : Code unique qui indique l’appartenance d’un objet à une zone de pression 
*/

		
CREATE OR REPLACE VIEW qwat_ch_fr_aquafri.i_traitement AS

	SELECT 
		installation.id AS OBJECTID,
		COALESCE(installation.name, element.identification)  AS Nom,

		concat_ws('|', 
			CASE WHEN sanitization_uv IS TRUE THEN 'UV' END, 
			CASE WHEN sanitization_chlorine_liquid IS TRUE THEN 'CL' END,
			CASE WHEN sanitization_chlorine_gazeous IS TRUE THEN 'CL' END,
			CASE WHEN sanitization_ozone IS TRUE THEN 'OZ' END,
			CASE WHEN filtration_membrane IS TRUE THEN 'FM' END,
			CASE WHEN filtration_sandorgravel IS TRUE THEN 'FS' END,
			CASE WHEN flocculation IS TRUE THEN 'FL' END,
			CASE WHEN activatedcharcoal IS TRUE THEN 'CA' END,
			CASE WHEN settling IS TRUE THEN 'SE' END
		)  AS Type_traitement,
		
		remote.code AS Type_transmission,
		element.year AS Annee_installation,
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
		LEFT JOIN qwat_ch_fr_aquafri.remote_type remote ON installation.fk_remote = remote.id
		LEFT JOIN qwat_ch_fr_aquafri.status status ON element.fk_status = status.id
		LEFT JOIN qwat_od.distributor distributor ON element.fk_distributor = distributor.id
	 
		WHERE
		installation.installation_type = 'treatment'
	;
	
GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.i_traitement TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.i_traitement TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.i_traitement TO qwat_manager;