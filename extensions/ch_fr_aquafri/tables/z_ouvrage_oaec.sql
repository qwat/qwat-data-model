/*
Classe Z_OUVRAGE_OAEC 
Cette classe regroupe les ouvrages qui sont désignés pour servir à l’approvisionnement en 
eau en temps de crise selon l’OAEC. Tous ces ouvrages sont strictement indépendants de 
ceux de la distribution en temps normal, qui d’office servent à l’approvisionnement en temps 
de crise aussi longtemps que possible. 
Pour ne pas créer de confusion, les captages OAEC ne sont pas différenciés en plusieurs 
types comme c’est le cas avec les valeurs de l’attribut Type_captage de la classe 
CAPTAGE. Pour néanmoins exprimer les caractéristiques de manière différenciée selon les 
captages considérés, les attributs correspondants sont à disposition pour renseignement (cf. 
codes suite à la définition de l’attribut, qui indiquent pour quel type de captage l’attribut en 
question est à renseigner dans la mesure du possible). Les attributs particuliers à cette 
classe sont : 

 
Nom : Type et nom distinctif et descriptif l’infrastructure en question 
Type_oaec : son domaine des valeurs comprend : 
	 captage OAEC (CX) : tout type de captage (source, rassemblement, puits vertical, puits horizontal, captage d’eau de surface, autre) prévu à l’utilisation à des fins d’approvisionnement en eau en temps de crise selon l’OAEC 
	 fontaine OAEC (FX) : fontaine prévue à l’utilisation en cas de crise (selon l’OAEC) par la commune, mais alimentée par une ressource distincte de toutes les autres ressources servant à l’alimentation normale du réseau et ne devant pas bénéficier de zones de protection des eaux 
Niv_eau : pour les captages de source et les chambres de rassemblement, c’est le niveau d’eau de la mise en charge au départ de la chambre vers la chambre suivante [m.s.m.] [SO ; CR] 
Niv_nappe : pour les puits d’eau souterraine, le niveau minimal de la nappe sous le niveau du terrain [m.s.m.] [PV ; PH] 
Prof_puits : profondeur du puits [mm] [PV ; PH] 
Nbr_drains : le nombre de drains aboutissant dans la chambre, et pour les puits à drains horizontaux, le nombre de drains radiaux (à cumuler s’ils sont répartis sur plusieurs niveaux) [SO ; CR ; PH] 
Diam_puits : diamètre du tube filtrant ou du puits [mm] [PV ; PH] 
Q_min : débit d’étiage moyen du ou des drains arrivant dans la chambre [l/min] [SO ; CR] 
Q_moy : débit moyen du ou des drains arrivant dans la chambre [l/min]  [SO ; CR] 

*/

-- Table: qwat_ch_fr_aquafri.z_ouvrage_oaec

-- DROP TABLE qwat_ch_fr_aquafri.z_ouvrage_oaec;

CREATE TABLE IF NOT EXISTS qwat_ch_fr_aquafri.z_ouvrage_oaec
(
    objectid SERIAL PRIMARY KEY,
    geom geometry(Point,2056),
    nom character varying(40),
    type_oaec character varying(2),
    niv_eau double precision,
    niv_nappe double precision,
    prof_puits integer,
    nbr_drains integer,
    diam_puits integer,
    q_min integer,
    q_moy integer,
    precision_plan character varying(2),
    proprietaire character varying(30),
    etat_exploitation character varying(2),
    remarque character varying(80),
    dossier_id character varying(20)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE qwat_ch_fr_aquafri.z_ouvrage_oaec
    OWNER to qwatuser;

-- Index: sidx_z_ouvrage_oaec_geom

-- DROP INDEX qwat_ch_fr_aquafri."sidx_z_ouvrage_oaec_geom";

CREATE INDEX "sidx_z_ouvrage_oaec_geom"
    ON qwat_ch_fr_aquafri.z_ouvrage_oaec USING gist
    (geom)
    TABLESPACE pg_default;
	
	
GRANT SELECT, REFERENCES, TRIGGER ON TABLE qwat_ch_fr_aquafri.z_ouvrage_oaec TO qwat_viewer;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.z_ouvrage_oaec TO qwat_user;
GRANT ALL ON TABLE qwat_ch_fr_aquafri.z_ouvrage_oaec TO qwat_manager;


GRANT ALL ON SEQUENCE qwat_ch_fr_aquafri.z_ouvrage_oaec_objectid_seq TO qwat_user;
GRANT ALL ON SEQUENCE qwat_ch_fr_aquafri.z_ouvrage_oaec_objectid_seq TO qwat_manager;