CREATE OR REPLACE VIEW qwat_ch_vd_sire.captage AS
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
		source_type_code_sire AS "Genre",
		flow_lowest AS "Q_Etiage",
		flow_average AS "Q_Moyen",
		source_quality_code_sire AS "Qualite_Captage",
		flow_concession AS "Q_Concession",
		contract_end AS "Date_Fin_Concession",
		CASE
			WHEN gathering_chamber IS TRUE THEN 1
			WHEN gathering_chamber IS FALSE THEN 0
			ELSE 2
		END AS "Chambre_De_Rassemblement",
		altitude AS "Altitude",
		qwat_ext_ch_vd_sire_adesafecter AS "A_Desaffecter_PDDE",
		st_force2d(geometry) AS geometry
	FROM qwat_od.vw_export_installation
	WHERE installation_type = 'source'::qwat_od.installation_type AND (status_active IS TRUE OR fk_status = 1306) AND fk_distributor = 1;
GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_vd_sire.captage TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_vd_sire.captage TO qwat_user;
GRANT ALL ON TABLE qwat_ch_vd_sire.captage TO qwat_manager;
