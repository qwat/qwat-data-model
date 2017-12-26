

CREATE VIEW qwat_ch_vd_sire.conduite AS
	SELECT
		id AS ID_Num
		, qwat_ext_ch_vd_sire_remarque || remark AS remarque
		, NULL AS Date_de_saisie -- TODO
		, NULL AS Dern_M_a_J -- TODO
		, precision_code_sire AS Precision_Geo
		, fk_distributor AS id_distributeur
		, qwat_ext_ch_vd_sire_etat_exploitation AS Etat_Exploitation
		, year AS Annee_Construction
		, NULL::text AS Nom_Descriptif
		, folder_identification AS Numero_dossier
		, fk_pressurezone AS ID_Zone_pression
		, watertype_code_sire AS Type_eau
		, pipe_function_code_sire AS Fonction
		, pipe_material_code_sire AS Materiau
		, pipe_material_diameter_external AS Diametre_Externe
		, qwat_ext_ch_vd_sire_diametre AS Diam_int_PDDE
		, pipe_material_diameter_internal AS Diametre_Interne
		, year_rehabilitation AS Annee_Rehabilitation
		, pipe_material_pressure_nominal AS Pression_fonc_admise
		, NULL::double precision AS Rugosite_Hydraulique -- TODO
		, ST_Length(geometry) AS Longueur_reelle --TODO a changer pour ST_Length3D dès que c'est prêt
		, 2 AS Calcul_Hydraulique
		, qwat_ext_ch_vd_sire_adesafecter AS A_Desafecter_PDDE
		, ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_pipe
	WHERE
		pipe_function_major IS TRUE;
