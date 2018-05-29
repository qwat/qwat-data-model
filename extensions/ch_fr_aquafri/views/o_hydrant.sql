
/*

Classe O_HYDRANT 

No_hydrant : numéro sur la plaquette de numérotation de la borne hydrante 
Type_hydrant : son domaine des valeurs comprend : 
	 borne hydrante (BH) 
	 hydrant souterrain (HS) 
Nbr_sorties : son domaine des valeurs comprend : 
	un (1) 
	deux (2) 
	trois (3) 
Diam_sorties : diamètre(s) [mm], par exemple [2 x 55 / 1 x 75] 
Vidange_auto : son domaine des valeurs comprend : 
	oui (OUI) : la borne hydrante est équipée d’un dispositif automatique d’aération et de purge 
	non (NON) : la borne hydrante n’est pas équipée d’un dispositif automatique d’aération et de purge 
P_statique : pression statique au pied de la borne hydrante [bar] 
P_dynamique : pression dynamique résiduelle à la sortie pour le débit correspondant (cf. attribut suivant) [bar] 
Q_dynamique : débit à la sortie à pression résiduelle [l/min] 
Resp_entretien : nom de l’organisation ou de l’entreprise si l’entretien n’est pas assuré par le propriétaire. Exemple : l’entreprise XY assure un contrôle trisannuel de chaque borne hydrante 
Zone_pression : Code unique qui indique l’appartenance d’un objet à une zone de pression

*/


CREATE OR REPLACE VIEW qwat_ch_fr_aquafri.o_hydrant AS

	SELECT 
		hydrant.id AS OBJECTID,
		element.identification AS No_hydrant,
		CASE WHEN hydrant.underground IS TRUE THEN 'HS' ELSE 'BH' END AS Type_hydrant,
		hydrant_output.nbr_sorties AS Nbr_sorties,
		hydrant_output.code AS Diam_sorties,
		null AS Vidange_auto,
		hydrant.pressure_static AS P_statique,
		hydrant.pressure_dynamic AS P_dynamique,
		hydrant.flow::INTEGER AS Q_dynamique,
		null AS Resp_entretien,
		element.year AS Annee_construction,
		precision.code AS Precision_plan,
		distributor.name AS Proprietaire,
		status.code AS Etat_exploitation,
		element.remark AS Remarque,
		pressurezone.name AS Zone_pression,		
		element.fk_folder AS Dossier_id,		
		
		ST_Force2D(element.geometry) AS geometry

		
    FROM qwat_od.hydrant hydrant
		JOIN qwat_od.vw_node_element element ON hydrant.id = element.id
		
		LEFT JOIN qwat_ch_fr_aquafri.hydrant_output hydrant_output ON hydrant.fk_output = hydrant_output.id
		LEFT JOIN qwat_od.pressurezone pressurezone ON element.fk_pressurezone = pressurezone.id
		LEFT JOIN qwat_ch_fr_aquafri.precision precision ON element.fk_precision = precision.id
		LEFT JOIN qwat_ch_fr_aquafri.status status ON element.fk_status = status.id
		LEFT JOIN qwat_od.distributor distributor ON element.fk_distributor = distributor.id
	;

GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.o_hydrant TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.o_hydrant TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.o_hydrant TO qwat_manager;