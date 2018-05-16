
CREATE SCHEMA IF NOT EXISTS qwat_ch_fr_aquafri;




/* Viewer */
GRANT USAGE ON SCHEMA qwat_ch_fr_aquafri  TO qwat_viewer;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA qwat_ch_fr_aquafri  TO qwat_viewer;
GRANT SELECT, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA qwat_ch_fr_aquafri  TO qwat_viewer;
ALTER DEFAULT PRIVILEGES IN SCHEMA qwat_ch_fr_aquafri  GRANT SELECT, REFERENCES, TRIGGER ON TABLES TO qwat_viewer;

/* User */

GRANT ALL ON SCHEMA qwat_ch_fr_aquafri TO qwat_user;
GRANT ALL ON ALL TABLES IN SCHEMA qwat_ch_fr_aquafri TO qwat_user;
GRANT ALL ON ALL SEQUENCES IN SCHEMA qwat_ch_fr_aquafri TO qwat_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA qwat_ch_fr_aquafri GRANT ALL ON TABLES TO qwat_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA qwat_ch_fr_aquafri GRANT ALL ON SEQUENCES TO qwat_user;



/* Manager */

GRANT ALL ON SCHEMA qwat_ch_fr_aquafri TO qwat_manager;
GRANT ALL ON ALL TABLES IN SCHEMA qwat_ch_fr_aquafri TO qwat_manager;
GRANT ALL ON ALL SEQUENCES IN SCHEMA qwat_ch_fr_aquafri TO qwat_manager;
ALTER DEFAULT PRIVILEGES IN SCHEMA qwat_ch_fr_aquafri GRANT ALL ON TABLES TO qwat_manager;
ALTER DEFAULT PRIVILEGES IN SCHEMA qwat_ch_fr_aquafri GRANT ALL ON SEQUENCES TO qwat_manager;

/* SysAdmin */

GRANT ALL ON SCHEMA qwat_ch_fr_aquafri TO qwat_sysadmin;
GRANT ALL ON ALL TABLES IN SCHEMA qwat_ch_fr_aquafri TO qwat_sysadmin;
GRANT ALL ON ALL SEQUENCES IN SCHEMA qwat_ch_fr_aquafri TO qwat_sysadmin;
ALTER DEFAULT PRIVILEGES IN SCHEMA qwat_ch_fr_aquafri GRANT ALL ON TABLES TO qwat_sysadmin;
ALTER DEFAULT PRIVILEGES IN SCHEMA qwat_ch_fr_aquafri GRANT ALL ON SEQUENCES TO qwat_sysadmin;



/* special user to view only aquafri export (usefull to connect with esri'$ product$) */

/*
CREATE USER aquafri WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  VALID UNTIL 'infinity';

--GRANT qwat_viewer TO aquafri;
ALTER USER aquafri PASSWORD 'aquafri';

GRANT USAGE ON SCHEMA qwat_ch_fr_aquafri  TO aquafri;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA qwat_ch_fr_aquafri  TO aquafri;
GRANT SELECT, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA qwat_ch_fr_aquafri  TO aquafri;
ALTER DEFAULT PRIVILEGES IN SCHEMA qwat_ch_fr_aquafri  GRANT SELECT, REFERENCES, TRIGGER ON TABLES TO aquafri;


REVOKE ALL ON TABLE qwat_ch_fr_aquafri.hydrant_output FROM aquafri;
REVOKE ALL ON TABLE qwat_ch_fr_aquafri.pipe_function FROM aquafri;
REVOKE ALL ON TABLE qwat_ch_fr_aquafri.pipe_material FROM aquafri;
REVOKE ALL ON TABLE qwat_ch_fr_aquafri."precision" FROM aquafri;
REVOKE ALL ON TABLE qwat_ch_fr_aquafri.remote_type FROM aquafri;
REVOKE ALL ON TABLE qwat_ch_fr_aquafri.status FROM aquafri;
REVOKE ALL ON TABLE qwat_ch_fr_aquafri.valve_function FROM aquafri;

*/