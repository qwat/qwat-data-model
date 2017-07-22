# QWAT db_manager

The QWAT db_manager is composed by some parts:

- **Checker** a script that compares 2 databases and shows the differences
- **Dumper** a script to backup and restore a Postgres db
- **Upgrader** a script that apply one or more delta files to an existing database 
and stores in a table the informations about the applied delta
- **Manager** an interface for managing specific QWAT upgrade procedure

## Requirements
To upgrade an existing QWAT db you need to have 2 other empty db in addition to the db to be 
upgraded, with related pg_services defined.  
                             
## How to use
In the config file db_manager_config.yaml, you have to define:
- **upgrades_table**: the name (and schema) of the table with the migration informations 
- **delta_dir**: the directory with the delta files.
- **backup_file**: the temporary db dump file used to copy the prod db to a test db
- **ignore_elements**: list of elements to ignore in db compare. Valid elements: tables, columns, 
constraints, views, sequences, indexes, triggers, functions or rules


 
### Qwat upgrade procedure

```
usage: manager.py [-h] -pp PG_SERVICE_PROD -pt PG_SERVICE_TEST -pc PG_SERVICE_COMP
    
optional arguments:
  -h, --help            show this help message and exit
  -pp PG_SERVICE_PROD, --pg_service_prod PG_SERVICE_PROD
                        Name of the pg_service related to production db
  -pt PG_SERVICE_TEST, --pg_service_test PG_SERVICE_TEST
                        Name of the pg_service related to a test db used to
                        test the migration
  -pc PG_SERVICE_COMP, --pg_service_comp PG_SERVICE_COMP
                        Name of the pg_service related to a db used to compare
                        the updated db test with the last version of the db
```

This procedure makes the following steps:
- checks if the upgrades table exists in PG_SERVICE_PROD, if not, it asks if you want to create it
and set the baseline of the table with the current version founded in *qwat_sys.versions*
- creates a dump of the PG_SERVICE_PROD db
- restores the db dump into PG_SERVICE_TEST
- applies the delta files found in the delta directory to the PG_SERVICE_TEST db. Only the delta 
files with version greater or equal than the current version are applied
- creates PG_SERVICE_COMP whit the last qwat db version, using init_qwat.sh script
- checks if there are differences between PG_SERVICE_TEST and PG_SERVICE_COMP
- if no significant differences are found, applies the delta files to PG_SERVICE_PROD. Only the delta 
files with version greater or equal than the current version are applied