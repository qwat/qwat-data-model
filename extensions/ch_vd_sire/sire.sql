

CREATE SCHEMA IF NOT EXISTS qwat_ch_vd_sire ; 


CREATE OR REPLACE VIEW qwat_ch_vd_sire.conduite AS
	SELECT 	
		pipe.id AS id -- postgreql n'accepte pas des "-" (pour ID-Num)
		, remark AS remarque
		, NULL AS Date_de_saisie -- TODO
		, NULL AS Dern_M_a_J -- TODO
		, precision.code_sire AS Precision_Geo
		, fk_distributor AS id_distributeur
		, status.code_sire AS  Etat_Exploitation
		, year AS Annee_Construction
		, NULL::text AS Nom_Descriptif
		, folder.identification AS Numero_dossier
		, fk_pressurezone AS ID_Zone_pression
		, watertype.code_sire AS Type_eau
		, pipe_function.code_sire AS Fonction
		, pipe_material.code_sire AS Materiau
		, pipe_material.diameter_external AS Diametre_Externe
		, CASE 
			WHEN status.code_sire = 2 THEN  pipe_material.diameter_internal
			ELSE NULL::int
		END AS Diam_int_PDDE
		, CASE 
			WHEN status.code_sire != 2 THEN  pipe_material.diameter_internal
			ELSE NULL::int
		END AS Diametre_Interne
		, year_rehabilitation AS Annee_Rehabilitation
		, pipe_material.pressure_nominal AS Pression_fonc_admise
		, NULL::double precision AS Rugosite_Hydraulique -- TODO
		, ST_Length(geometry) AS Longueur_reelle --TODO a changer pour ST_Length3D dès que c'est prêt
		, 1 AS Calcul_Hydraulique
		, 0 AS A_Desafecter_PDDE
		, ST_Force2D(geometry) AS geometry	
	FROM qwat_od.pipe 
		INNER JOIN qwat_vl.status ON pipe.fk_status = status.id
		INNER JOIN qwat_vl.pipe_function ON pipe.fk_function = pipe_function.id
		INNER JOIN qwat_vl.pipe_material ON pipe.fk_material = pipe_material.id
		INNER JOIN qwat_vl.precision ON pipe.fk_precision = precision.id
		INNER JOIN qwat_vl.watertype ON pipe.fk_watertype = watertype.id
		LEFT JOIN qwat_od.folder ON pipe.fk_folder = folder.id
	WHERE 
		pipe_function.major IS TRUE
		AND status.code_sire IS NOT NULL;
