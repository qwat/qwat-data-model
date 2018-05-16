/*
Classe I_CENTRALE_MCT 
Cette classe regroupe toutes les centrales de commande. Les attributs à cette classe sont : 

Nom: le nom distinctif et descriptif de l’installation en question 
Type_mct : son domaine des valeurs comprend : 
	 principale (PR) : centrale de commande principale 
	 locale (LO) : centrale de commande autonome mais assujettie à la centrale principale 
Type_transmission : Son domaine des valeurs comprend : 
	cable (CA) 
	radio (RA) 
	inexistant (IX) [LO] 
Centrale_id : code de la centrale principale 
Mesure_plan : Pour toute(s) mesure(s) planifiée(s) sur l’ouvrage en question 
*/


-- Table: qwat_ch_fr_aquafri.i_centrale_mct

-- DROP TABLE qwat_ch_fr_aquafri.i_centrale_mct;

CREATE TABLE IF NOT EXISTS qwat_ch_fr_aquafri.i_centrale_mct
(
	objectid SERIAL PRIMARY KEY,
    geom geometry(Point,2056),
    nom character varying(40),
    type_mct character varying(2),
    type_transmission character varying(2),
    centrale_id character varying(12),
    annee_installation integer,
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

ALTER TABLE qwat_ch_fr_aquafri.i_centrale_mct
    OWNER to qwatuser;

-- Index: sidx_i_centrale_mct_geom

-- DROP INDEX qwat_ch_fr_aquafri.sidx_i_centrale_mct_geom;

CREATE INDEX sidx_i_centrale_mct_geom
    ON qwat_ch_fr_aquafri.i_centrale_mct USING gist
    (geom)
    TABLESPACE pg_default;
	
GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.i_centrale_mct TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.i_centrale_mct TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.i_centrale_mct TO qwat_manager;

GRANT ALL ON SEQUENCE qwat_ch_fr_aquafri.i_centrale_mct_objectid_seq TO qwat_user;
GRANT ALL ON SEQUENCE qwat_ch_fr_aquafri.i_centrale_mct_objectid_seq TO qwat_manager;