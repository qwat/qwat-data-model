/*
Classe O_HORS_RESEAU 
Cette classe regroupe toutes les infrastructures de défense incendie indépendantes du 
réseau. Les attributs uniques à cette classe sont : 

Nom : le nom distinctif et descriptif de l’infrastructure en question 
Type_hors_reseau : son domaine des valeurs comprend : 
	 bassin d_extinction (BX) : bassins enterrés (couverts et non-couverts) d’un volume égal ou supérieur à 100 m³ 
	 silo d_extinction (SX) : conteneurs enterrés de taille inférieure à 100 m³ 
	 digue d_extinction (DX) : barrage sur ruisseau 
	 puits d_extinction (PX) : puits de captage en nappe phréatique  
	 emplacement_MP (MX) : emplacements situés à côté des points de pompage d’eau prévus et capables de supporter le poids d’une moto-pompe (dalle de couverture, etc.), par exemple bords de lac, d’étangs ou de rivière 
Q_max_dx_px : débit max. utilisable par les sapeurs-pompiers [l/min] [DX ; PX] 
V_incendie_bx_sx : volume utile [m³] [BX ; SX] 
Resp_entretien : nom de l’organisation ou de l’institution 
Mesure_plan : Pour toute(s) mesure(s) planifiée(s) sur l’ouvrage en question 
*/

-- Table: qwat_ch_fr_aquafri.o_hors_reseau

-- DROP TABLE qwat_ch_fr_aquafri.o_hors_reseau;

CREATE TABLE IF NOT EXISTS qwat_ch_fr_aquafri.o_hors_reseau
(
    objectid SERIAL PRIMARY KEY,
    geom geometry(Point,2056),
    nom character varying(40),
    type_hors_reseau character varying(2),
    q_max_dx_px integer,
    v_incendie_bx_sx integer,
    resp_entretien character varying(30),
    annee_construction integer,
    precision_plan character varying(2),
    proprietaire character varying(30),
    etat_exploitation character varying(2),
    mesure_plan character varying(50),
    remarque character varying(80),
    dossier_id character varying(20)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE qwat_ch_fr_aquafri.o_hors_reseau
    OWNER to qwatuser;

-- Index: sidx_o_hors_reseau_geom

-- DROP INDEX qwat_ch_fr_aquafri.sidx_o_hors_reseau_geom;

CREATE INDEX sidx_o_hors_reseau_geom
    ON qwat_ch_fr_aquafri.o_hors_reseau USING gist
    (geom)
    TABLESPACE pg_default;
	
GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.o_hors_reseau TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.o_hors_reseau TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.o_hors_reseau TO qwat_manager;

GRANT ALL ON SEQUENCE qwat_ch_fr_aquafri.o_hors_reseau_objectid_seq TO qwat_user;
GRANT ALL ON SEQUENCE qwat_ch_fr_aquafri.o_hors_reseau_objectid_seq TO qwat_manager;