#!/bin/bash

# exit on error
set -e

# PARAMS
TESTDB=qwat_test
TESTCONFORMDB=qwat_test_conform
USER=postgres
HOST=localhost
QWATSERVICETEST=qwat_test
QWATSERVICETESTCONFORM=qwat_test_conform
SRID=21781

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
        exit 0
        ;;
esac

shift
done

echo "Droping existing qwat_test"
/usr/bin/dropdb --if-exists "$TESTDB" --host $HOST --port 5432 --username "$USER" --no-password

echo "Creating DB (qwat_test)"
/usr/bin/createdb "$TESTDB" --host $HOST --port 5432 --username "$USER" --no-password

echo "Initializing qwat DB in qwat_test"
./init_qwat.sh -p $QWATSERVICETEST -d > init_qwat.log

echo "Droping DB (qwat_test_conform)"
/usr/bin/dropdb --if-exists "$TESTCONFORMDB" --host $HOST --port 5432 --username "$USER" --no-password

echo "Creating DB (qwat_test_conform)"
/usr/bin/createdb "$TESTCONFORMDB" --host $HOST --port 5432 --username "$USER" --no-password

echo "Getting lastest Tag num"
cd $DIR
LATEST_TAG=$(git describe)
#PROPER_LATEST_TAG=$(echo $LATEST_TAG| cut -d'-' -f 1)
SHORT_LATEST_TAG=$(echo $LATEST_TAG| cut -c 1)
printf "    Latest tag = ${GREEN}$SHORT_LATEST_TAG${NC}\n"


# We need to execute init_qwat.sh from the lastest TAG version in $QWATSERVICETESTCONFORM
printf "    Travis branch = ${GREEN}$TRAVIS_BRANCH${NC}\n"
printf "    Travis commit = ${GREEN}$TRAVIS_COMMIT${NC}\n"
printf "    Travis PR branch = ${GREEN}$TRAVIS_PULL_REQUEST_BRANCH${NC}\n"
printf "    Travis PR commit = ${GREEN}$TRAVIS_PULL_REQUEST_SHA${NC}\n"

if [[ !  -z  $TRAVIS_PULL_REQUEST_SHA  ]]; then
  CURRENT_COMMIT=$TRAVIS_PULL_REQUEST_SHA
else
  CURRENT_COMMIT=$TRAVIS_COMMIT
fi


PROPER_LATEST_TAG=$SHORT_LATEST_TAG".0.0"
echo "Switching on lastest tag major version ${GREEN}$PROPER_LATEST_TAG)${NC}"
git checkout tags/$PROPER_LATEST_TAG

cd ..
echo "Initializing qwat DB in qwat_test_conform"
./init_qwat.sh -p $QWATSERVICETESTCONFORM -d > init_qwat.log

echo "Switching back to current commit ($CURRENT_COMMIT)"
git checkout $CURRENT_COMMIT


echo "Applying deltas on $TESTCONFORMDB:"
for f in $DIR/delta/*.sql
do
    CURRENT_DELTA=$(basename "$f")
    #CURRENT_DELTA_NUM_VERSION=$(echo $CURRENT_DELTA| cut -d'_' -f 2)
    CURRENT_DELTA_NUM_VERSION=$(echo $CURRENT_DELTA| cut -c 7)
    if [[ $CURRENT_DELTA_NUM_VERSION > $SHORT_LATEST_TAG || $CURRENT_DELTA_NUM_VERSION = $SHORT_LATEST_TAG || $SHORT_LATEST_TAG = '' ]]; then
        printf "    Processing ${GREEN}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION\n"
        /usr/bin/psql -v ON_ERROR_STOP=1 --host $HOST --port 5432 --username "$USER" --no-password -q -d "$TESTCONFORMDB" -f $f
    else
        printf "    Bypassing  ${RED}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION\n"
    fi
done

echo "Reloading views and functions from last commit"
export PGSERVICE=$QWATSERVICETESTCONFORM
SRID=$SRID ./ordinary_data/views/rewrite_views.sh
SRID=$SRID ./ordinary_data/functions/rewrite_functions.sh

echo "Producing referential file for test_qwat DB (from $QWATSERVICETEST)"
cd $DIR
/usr/bin/psql --host $HOST --port 5432 --username "$USER" --no-password -d "$QWATSERVICETEST" -f test_migration.sql > test_migration.expected.sql

#  By the way, this cannot work if there is no TAG version

echo "Performing conformity test"
STATUS=$(python test_migration.py --pg_service $QWATSERVICETESTCONFORM)

if [[ $STATUS == "DataModel is OK" ]]; then
    printf "${GREEN}Migration TEST is successfull${NC}. You may now migrate your real DB\n"
    EXITCODE=0
else
    printf "${RED}Migration TEST has failed${NC}. Please contact qWat team and give them the following output :\n $STATUS \n\n"
    EXITCODE=1
fi

exit $EXITCODE

