#!/bin/bash

# PARAMS
SRCDB=qwat
TESTDB=qwat_test
TESTCONFORMDB=qwat_test_conform
USER=test
HOST=localhost
QWATSERVICE=qwat
QWATSERVICETEST=qwat_test
QWATSERVICETESTCONFORM=qwat_test_conform

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

while [[ $# > 0 ]]; do
key="$1"
case $key in
    -h|--help)
        echo "Arguments:"
        echo -e "\t-h|--help\tShow this help screen"
        echo -e "\t-u|--upgrade\tUpgrade your real DB (perform all deltas on it)"
        exit 0
        ;;
    -u|--upgrade)
    UPGRADE_REAL_DB="$2"
    shift # past argument
    ;;
esac

shift
done


read -s  -p "Please enter the password for you DB user ($USER)": pwd
export PGPASSWORD="$pwd"
echo ""

echo "Getting current num version"
NUMVERSION=\"$(/usr/bin/psql --host $HOST --port 5432 --username "$USER" --no-password -d "$SRCDB" -c "COPY(SELECT version FROM qwat_sys.versions WHERE module='model.core') TO STDOUT")\"
printf "You are currently using qWat v${GREEN}$NUMVERSION${NC}\n"


if [[ $UPGRADE_REAL_DB =~ ^[Yy] ]]; then
    read -p "Are you sure you want to upgrade your database ($SRCDB) ? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
            echo "Upgrading qWat DB"
            echo "Applying deltas on $TESTDB:"
            for f in $DIR/delta/*.sql
            do
                CURRENT_DELTA=$(basename "$f")
                CURRENT_DELTA_NUM_VERSION=$(echo $CURRENT_DELTA| cut -d'_' -f 2)
                if [[ $CURRENT_DELTA_NUM_VERSION > $NUMVERSION ]]; then
                    printf "    Processing ${GREEN}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION\n"
                    /usr/bin/psql --host $HOST --port 5432 --username "$USER" --no-password -q -d "$SRCDB" -f $f
                else
                    printf "    Bypassing  ${RED}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION\n"
                fi
            done
            echo "Done"
    fi
    echo "Exiting"
    EXITCODE=0
    exit $EXITCODE
fi


echo "Dumping actual DB"
TODAY=`date '+%Y%m%d'`
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_current_qwat.backup" "$SRCDB"
#/usr/bin/pg_dump -d "service=$QWATSERVICE" --format custom --file "$TODAY""_current_qwat.backup"

echo "Droping existing qwat_test"
/usr/bin/dropdb "$TESTDB" --host $HOST --port 5432 --username "$USER" --no-password
#/usr/bin/dropdb -d "service=$QWATSERVICETEST"

echo "Creating DB (qwat_test)"
/usr/bin/createdb "$TESTDB" --host $HOST --port 5432 --username "$USER" --no-password
#/usr/bin/createdb -d "service=$QWATSERVICETEST"

echo "Restoring in test DB"
/usr/bin/pg_restore --host $HOST --port 5432 --username "$USER" --dbname "$TESTDB" --no-password --single-transaction --exit-on-error "$TODAY""_current_qwat.backup"
#/usr/bin/pg_restore -d "service=$QWATSERVICETEST" --single-transaction --exit-on-error "$TODAY""_current_qwat.backup"

echo "Applying deltas on $TESTDB:"
for f in $DIR/delta/*.sql
do
    CURRENT_DELTA=$(basename "$f")
    CURRENT_DELTA_NUM_VERSION=$(echo $CURRENT_DELTA| cut -d'_' -f 2)
    if [[ $CURRENT_DELTA_NUM_VERSION > $NUMVERSION ]]; then
        printf "    Processing ${GREEN}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION\n"
        /usr/bin/psql --host $HOST --port 5432 --username "$USER" --no-password -q -d "$TESTDB" -f $f
    else
        printf "    Bypassing  ${RED}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION\n"
    fi
done

echo "Droping DB (qwat_test_conform)"
/usr/bin/dropdb "$TESTCONFORMDB" --host $HOST --port 5432 --username "$USER" --no-password
#/usr/bin/createdb -d "service=$QWATSERVICETEST"

echo "Creating DB (qwat_test_conform)"
/usr/bin/createdb "$TESTCONFORMDB" --host $HOST --port 5432 --username "$USER" --no-password
#/usr/bin/createdb -d "service=$QWATSERVICETEST"

echo "Initializing qwat DB in qwat_test_conform"
cd ..
./init_qwat.sh -p $QWATSERVICETESTCONFORM -d > update/init_qwat.log
cd update

echo "Producing referential file for current qWat version (from $QWATSERVICETESTCONFORM)"
/usr/bin/psql --host $HOST --port 5432 --username "$USER" --no-password -d "$QWATSERVICETESTCONFORM" -f test_migration.sql > test_migration.expected.sql

echo "Performing conformity test"
STATUS=$(python test_migration.py --pg_service $QWATSERVICETEST)

if [[ $STATUS == "DataModel is OK" ]]; then
    printf "${GREEN}Migration TEST is successfull${NC}. You may now migrate your real DB\n"
else
    printf "${RED}Migration TEST has failed${NC}. Please contact qWat team and give them the following output :\n $STATUS \n\n"
fi

echo "Cleaning"
rm "$TODAY""_current_qwat.backup"
rm init_qwat.log

# TODO : dropping qwat_test
# TODO : dropping qwat_test_conform

# TODO add param --upgrade YES to the command, to launch the migration on the REAL DB


EXITCODE=0
exit $EXITCODE
