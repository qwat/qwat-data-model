# QWAT db_manager

The QWAT db_manager is composed by some parts:

- **Checker** a script that compares 2 databases and shows the differences
- **Dumper** a script to backup and restore a Postgres db
- **Upgrader** a script that apply one or more delta files to an existing database 
and stores in a table the informations about the applied delta
- **Manager** an interface for managing specific QWAT upgrade procedures

## Requirements
To upgrade an existing QWAT db you need to have 2 other db in addition to the db to be 
upgraded.  
                             
## How to use
In the config file db_manager_config.yaml, you have to define the name (and schema) of the
table with the migration informations and the directory with the delta files. 

TODO 