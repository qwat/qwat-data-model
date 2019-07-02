CREATE OR REPLACE VIEW qwat_ch_vd_sire.conduite AS
	SELECT
		id AS "ID_Num",
		qwat_ext_ch_vd_sire_remarque AS "Remarque",
		distributor_name AS "Nom_Distributeur",
		pressurezone_name AS "Nom_Zone_Pression",
		precision_code_sire AS "Precision_Geo",
		fk_distributor AS "ID_Distributeur",
		qwat_ext_ch_vd_sire_etat_exploitation AS "Etat_Exploitation",
		year AS "Annee_Construction",
		NULL::text AS "Nom_Descriptif",
		NULL::text AS "Numero_Dossier",
		fk_pressurezone AS "ID_Zone_Pression",
		watertype_code_sire AS "Type_Eau",
		CASE
			WHEN fk_status = 1307 THEN 5
		ELSE pipe_function_code_sire::integer
		END AS "Fonction",
		pipe_material_code_sire AS "Materiau",
		CASE
			WHEN pipe_material_code_sire = ANY (ARRAY[5, 6, 7, 8, 9, 10]) THEN pipe_material_diameter_external
			ELSE NULL::numeric
		END AS "Diametre_Externe",
		qwat_ext_ch_vd_sire_diametre AS "Diam_Int_PDDE",
		CASE
			WHEN qwat_ext_ch_vd_sire_etat_exploitation = 2 THEN NULL::numeric
			ELSE pipe_material_diameter_internal
		END AS "Diametre_Interne",
		year_rehabilitation AS "Annee_Rehabilitation",
		pipe_material_pressure_nominal AS "Pression_Fonc_admise",
		NULL::double precision AS "Rugosite_Hydraulique",
		st_length(geometry) AS "Longueur_Reelle",
		2 AS "Calcul_Hydraulique",
		qwat_ext_ch_vd_sire_adesafecter AS "A_Desaffecter_PDDE",
		st_length(st_force2d(geometry)) AS "Shape_Length",
		st_force2d(geometry) AS geometry
	FROM qwat_od.vw_export_pipe
	WHERE pipe_function_major IS TRUE AND (status_functional IS TRUE OR fk_status = 1306) AND fk_distributor = 1 AND NOT (pipe_function_code_sire = 0 AND st_length(geometry) < 10::double precision);
GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_vd_sire.conduite TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_vd_sire.conduite TO qwat_user;
GRANT ALL ON TABLE qwat_ch_vd_sire.conduite TO qwat_manager;
