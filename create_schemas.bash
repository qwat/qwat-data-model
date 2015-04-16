#!/bin/bash

usage() { 
    echo -e "Usage: $0 [option...] [dbname]"
    echo -e "\nOptions: refer to psql manual."
    echo -e "\nFallback to PGSERVICE=qWat if present."
    echo -e "\nExamples:"
    echo -e "  # use connection parameters from service qWat in .pg_service.conf file"
    echo -e "  $0"
    echo -e "\n  # define connections parameters on command line"
    echo -e "  $0 -h localhost -p 5432 -U postgres database_name"
    echo -e ""
    
}

# Exit on error
set -e

if [ "$1" = "--help" ]
then 
    usage
    exit 0
fi

export PGSERVICE=test
mkdir -p tmp

#####################################
# Create/overwrite schemas qwat_vl  #
#####################################

if [ `psql -c "\dn" $* | grep "qwat_vl" | wc -l` -eq 1 ]
then
    read -p "Schema qwat_vl already exists, overwrite ? (y/c): " response
    if [ $response != "y" ]
    then
        exit 0
    fi
fi
echo -e "BEGIN;" > tmp/qwat_vl.sql
echo -e "DROP SCHEMA IF EXISTS qwat_vl CASCADE;" >> tmp/qwat_vl.sql
echo -e "CREATE SCHEMA qwat_vl;" >> tmp/qwat_vl.sql
cat value_lists/*.sql >> tmp/qwat_vl.sql
echo -e "COMMIT;" >> tmp/qwat_vl.sql
PGOPTIONS='--client-min-messages=warning' psql -v ON_ERROR_STOP=1 -f tmp/qwat_vl.sql $* 2> tmp/qwat_vl.err
cat tmp/qwat_vl.err

#####################################
# Create/overwrite schemas qwat_od  #
#####################################

if [ `psql -c "\dn" $* | grep " qwat_od " | wc -l` -eq 1 ]
then
    read -p "Schema qwat_od already exists, overwrite ? (y/c): " response
    if [ $response != "y" ]
    then
        exit 0
    fi
fi
echo -e "BEGIN;" > tmp/qwat_od.sql
echo -e "DROP SCHEMA IF EXISTS qwat_od CASCADE;" >> tmp/qwat_od.sql
echo -e "CREATE SCHEMA qwat_od;" >> tmp/qwat_od.sql
for f in ordinary_data/*
do
    if test -d "$f"; then
        cat $f/*.sql >> tmp/qwat_od.sql
    fi
done
echo -e "COMMIT;" >> tmp/qwat_od.sql
PGOPTIONS='--client-min-messages=warning' psql -v ON_ERROR_STOP=1 -f tmp/qwat_od.sql $* 2> tmp/qwat_od.err
cat tmp/qwat_od.err

#####################################
# Create/overwrite schemas qwat_sys  #
#####################################

if [ `psql -c "\dn" $* | grep "qwat_sys" | wc -l` -eq 1 ]
then
    read -p "Schema qwat_sys already exists, overwrite ? (y/c): " response
    if [ $response != "y" ]
    then
        exit 0
    fi
fi
echo -e "BEGIN;" > tmp/qwat_sys.sql
echo -e "DROP SCHEMA IF EXISTS qwat_sys CASCADE;" >> tmp/qwat_sys.sql
echo -e "CREATE SCHEMA qwat_sys;" >> tmp/qwat_sys.sql
cat system/*.sql >> tmp/qwat_sys.sql
echo -e "COMMIT;" >> tmp/qwat_sys.sql
PGOPTIONS='--client-min-messages=warning' psql -v ON_ERROR_STOP=1 -f tmp/qwat_sys.sql $* 2> tmp/qwat_sys.err
cat tmp/qwat_sys.err

echo " *** "
echo " *** schemas were successfully written ***"
echo " *** "

exit 0
