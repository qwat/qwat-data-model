#!/bin/bash

usage() { 
    echo -e "Usage: $0 dbname [user (owner)] [password]\n"
}

if [ $# -eq "0" ]
then 
    usage
    exit 0
fi

dbname=$1
user=$2
password=$3

if [ -z "$user" ]
then
    read -p "Enter user name (database owner) : " user
fi

if [ -z "$password" ]
then
    read -p "Enter password for user $user : " password
fi
export PGPASSWORD=$password


#################################
# Create/overwrite qwat schemas #
#################################

if [ `psql -h localhost -U $user -d $dbname -c "\dn" | grep " qwat_od " | wc -l` -eq 1 ]
then
    read -p "Schema qwat_od already exists, overwrite ? (y/c) :" response
    if [ $response != "y" ]
    then
        exit 0
    fi
fi
if [ `psql -h localhost -U $user -d $dbname -c "\dn" | grep "qwat_vl" | wc -l` -eq 1 ]
then
    read -p "Schema qwat_vl already exists, overwrite ? (y/c) :" response
    if [ $response != "y" ]
    then
        exit 0
    fi
fi

mkdir -p tmp

echo -e "BEGIN;" > tmp/install.sql

echo -e "DROP SCHEMA IF EXISTS qwat_vl CASCADE;" >> tmp/qwat.sql
echo -e "CREATE SCHEMA qwat_vl;" >> tmp/qwat.sql

echo -e "DROP SCHEMA IF EXISTS qwat_od CASCADE;" >> tmp/qwat.sql
echo -e "CREATE SCHEMA qwat_od;" >> tmp/qwat.sql

cat value_lists/*.sql >> tmp/qwat.sql

for f in ordinary_data/*
do
    if test -d "$f"; then
        cat $f/*.sql >> tmp/qwat.sql
    fi
done

echo -e "COMMIT;" >> tmp/qwat.sql

psql -h localhost -U $user -d $dbname -v ON_ERROR_STOP=1 -f tmp/qwat.sql 2> tmp/qwat.err
cat tmp/qwat.err

exit 0
