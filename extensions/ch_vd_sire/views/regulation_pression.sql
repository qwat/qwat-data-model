CREATE OR REPLACE VIEW qwat_ch_vd_sire.regulation_pression AS
	SELECT
		id AS "ID_Num",
		qwat_ext_ch_vd_sire_remarque AS "Remarque",
		distributor_name AS "Nom_Distributeur",
		pressurezone_name AS "Nom_Zone_Pression",
		precision_code_sire AS "Precision_Geo",
		fk_distributor AS "ID_Distributeur",
		qwat_ext_ch_vd_sire_etat_exploitation AS "Etat_Exploitation",
		year AS "Annee_Construction",
		name AS "Nom_Descriptif",
		folder_identification AS "Numero_Dossier",
		fk_pressurezone AS "ID_Zone_Pression",
		watertype_code_sire AS "Type_Eau",
		CASE
			WHEN installation_type = 'pump'::qwat_od.installation_type THEN 2
			ELSE 0
		END AS "Genre",
		altitude AS "Altitude",
		1 AS "Etat_Connexion",
		NULL::text AS "ID_Distributeur_2",
		NULL::text AS "ID_Zone_pression_2",
		0 AS "Type_Regulation",
		NULL::double precision AS "Valeur_Consigne_Reg",
		2 AS "Telecommande_Incendie",
		0 AS "Centrale_Telecommande",
		qwat_ext_ch_vd_sire_adesafecter AS "A_Desaffecter_PDDE",
		st_force2d(geometry) AS geometry
	FROM qwat_od.vw_export_installation
	WHERE (fk_pressurecontrol_type = ANY (ARRAY[2801, 2802])) AND (status_functional IS TRUE OR fk_status = 1306) AND fk_distributor = 1;
