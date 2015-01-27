
/* Allow read on qwat_vl to qwat_ro */
GRANT USAGE ON SCHEMA qwat_vl TO qwat_ro;
GRANT SELECT ON ALL TABLES IN SCHEMA qwat_vl TO qwat_ro;
ALTER DEFAULT PRIVILEGES IN SCHEMA qwat_vl
    GRANT SELECT ON TABLES TO qwat_ro;

/* Allow read on qwat_od to qwat_ro */
GRANT USAGE ON SCHEMA qwat_od TO qwat_ro;
GRANT SELECT ON ALL TABLES IN SCHEMA qwat_od TO qwat_ro;
ALTER DEFAULT PRIVILEGES IN SCHEMA qwat_od
    GRANT SELECT ON TABLES TO qwat_ro;

GRANT qwat_ro TO qwat_rw;
/* Allow write on qwat_od to qwat_rw */
GRANT ALL ON SCHEMA qwat_od TO qwat_rw;
GRANT ALL ON ALL TABLES IN SCHEMA qwat_od TO qwat_rw;
GRANT ALL ON ALL SEQUENCES IN SCHEMA qwat_od TO qwat_rw;
ALTER DEFAULT PRIVILEGES IN SCHEMA qwat_od
    GRANT ALL ON TABLES TO qwat_rw;
ALTER DEFAULT PRIVILEGES IN SCHEMA qwat_od
    GRANT ALL ON SEQUENCES TO qwat_rw;
