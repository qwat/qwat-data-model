CREATE VIEW qwat_ch_vd_sire.conduite AS
	SELECT
		id AS ID_Num
		, qwat_ext_ch_vd_sire_remarque || remark AS Remarque
		, precision_code_sire AS Precision_Geo
		, distributor_name AS Nom_Distributeur
		, fk_distributor AS ID_Distributeur
		, qwat_ext_ch_vd_sire_etat_exploitation AS Etat_Exploitation
		, year AS Annee_Construction
		, NULL::text AS Nom_Descriptif
		, folder_identification AS Numero_Dossier
		, pressurezone_name AS Nom_Zone_Pression
		, fk_pressurezone AS ID_Zone_Pression
		, watertype_code_sire AS Type_Eau
		, pipe_function_code_sire AS Fonction
		, pipe_material_code_sire AS Materiau
		, pipe_material_diameter_external AS Diametre_Externe
		, qwat_ext_ch_vd_sire_diametre AS Diam_Int_PDDE
		, pipe_material_diameter_internal AS Diametre_Interne
		, year_rehabilitation AS Annee_Rehabilitation
		, pipe_material_pressure_nominal AS Pression_Fonc_Admise
		, NULL::double precision AS Rugosite_Hydraulique -- TODO
		, ST_Length(geometry) AS Longueur_Reelle --TODO a changer pour ST_Length3D dès que c'est prêt
		, 2 AS Calcul_Hydraulique
		, qwat_ext_ch_vd_sire_adesafecter AS A_Desaffecter_PDDE
		, ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_pipe
	WHERE
		pipe_function_major IS TRUE;
