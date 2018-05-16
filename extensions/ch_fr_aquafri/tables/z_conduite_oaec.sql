
/*
Classe Z_CONDUITE_OAEC 
Cette classe regroupe les conduites qui relient les ouvrages OAEC désignés. Toutes ces 
conduites sont strictement indépendants de celles de la distribution en temps normal, qui 
d’office servent à l’approvisionnement en temps de crise aussi longtemps que possible. 
Il n’y a pas d’attributs particuliers à cette classe.


*/

-- Table: qwat_ch_fr_aquafri.z_conduite_oaec

-- DROP TABLE qwat_ch_fr_aquafri.z_conduite_oaec;

CREATE TABLE IF NOT EXISTS qwat_ch_fr_aquafri.z_conduite_oaec
(
    objectid SERIAL PRIMARY KEY,
    geom geometry(MultiLineString,2056),
    precision_plan character varying(2),
    proprietaire character varying(30),
    etat_exploitation character varying(2),
    remarque character varying(80),
    shape_length double precision,
    dossier_id character varying(20)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE qwat_ch_fr_aquafri.z_conduite_oaec
    OWNER to qwatuser;

-- Index: sidx_z_conduite_oaec_geom

-- DROP INDEX qwat_ch_fr_aquafri.sidx_z_conduite_oaec_geom;

CREATE INDEX sidx_z_conduite_oaec_geom
    ON qwat_ch_fr_aquafri.z_conduite_oaec USING gist
    (geom)
    TABLESPACE pg_default;
	
GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.z_conduite_oaec TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.z_conduite_oaec TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.z_conduite_oaec TO qwat_manager;

GRANT ALL ON SEQUENCE qwat_ch_fr_aquafri.z_conduite_oaec_objectid_seq TO qwat_user;
GRANT ALL ON SEQUENCE qwat_ch_fr_aquafri.z_conduite_oaec_objectid_seq TO qwat_manager;