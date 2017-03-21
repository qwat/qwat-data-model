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
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

TAB_FILES_POST=()

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


read -s  -p "Please enter the password for your DB user ($USER) (if the user does not exist, please edit this script and change it)": pwd
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

#             echo "Applying deltas on $TESTDB:"
#             for f in $DIR/delta/*.sql
#             do
#                 CURRENT_DELTA=$(basename "$f")
#                 CURRENT_DELTA_NUM_VERSION=$(echo $CURRENT_DELTA| cut -d'_' -f 2)
#                 if [[ $CURRENT_DELTA_NUM_VERSION > $NUMVERSION ]]; then
#                     printf "    Processing ${GREEN}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION\n"
#                     /usr/bin/psql --host $HOST --port 5432 --username "$USER" --no-password -q -d "$SRCDB" -f $f
#                 else
#                     printf "    Bypassing  ${RED}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION\n"
#                 fi
#             done
            echo "Applying deltas on $SRCDB :"
            for f in $DIR/delta/*.sql
            do
                CURRENT_DELTA=$(basename "$f")
                CURRENT_DELTA_WITHOUT_EXT="${CURRENT_DELTA%.*}"
                CURRENT_DELTA_NUM_VERSION=$(echo $CURRENT_DELTA_WITHOUT_EXT| cut -c 7)
                CURRENT_DELTA_NUM_VERSION_FULL=$(echo $CURRENT_DELTA_WITHOUT_EXT| cut -d'_' -f 2)
                if [[ $CURRENT_DELTA_NUM_VERSION > $SHORT_LATEST_TAG || $CURRENT_DELTA_NUM_VERSION == $SHORT_LATEST_TAG || $SHORT_LATEST_TAG == '' ]]; then
                    printf "    Processing ${GREEN}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION ($CURRENT_DELTA_NUM_VERSION_FULL)\n"
                    /usr/bin/psql -v ON_ERROR_STOP=1 --host $HOST --port 5432 --username "$USER" --no-password -q -d "$SRCDB" -f $f

                    # Check if there is a POST file associated to the delta, if so, store it in the array for later execution
                    EXISTS_POST_FILE=$f'.post'
                    echo $EXISTS_POST_FILE
                    if [ -e "$EXISTS_POST_FILE" ]
                    then
                        TAB_FILES_POST+=($EXISTS_POST_FILE)
                    fi

                    printf "        Verifying num version conformity - "
                    # For each delta run on the DB, we have to check that the version number contained in the file name is the same that has been hardcoded in the DB
                    # note: delta files MUST include at their end: UPDATE qwat_sys.versions SET version = 'x.x.x';
                    OUTPUT_NUM=`/usr/bin/psql -v ON_ERROR_STOP=1 --host $HOST --port 5432 --username "$USER" --no-password -q -d "$SRCDB" -t -c "SELECT version FROM qwat_sys.versions;"`
                    OUTPUT_NUM="$(echo -e "${OUTPUT_NUM}" | tr -d '[:space:]')"
                    if [ "$OUTPUT_NUM" != "$CURRENT_DELTA_NUM_VERSION_FULL" ]; then
                        printf " Num in DB: ${GREEN}$OUTPUT_NUM${NC} - Num in file: ${RED}$CURRENT_DELTA_NUM_VERSION_FULL${NC} => ${RED}Numbers do NOT match !${NC}\n"
                        EXITCODE=1
                        exit $EXITCODE
                    else
                        printf " Num in DB: ${GREEN}$OUTPUT_NUM${NC} - Num in file: ${RED}$CURRENT_DELTA_NUM_VERSION_FULL${NC} => ${GREEN}OK${NC}\n"
                    fi
                else
                    printf "    Bypassing  ${RED}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION_FULL\n"
                fi
            done

            echo "Reloading views and functions from last commit"
            export PGSERVICE=$QWATSERVICE
            SRID=$SRID ./ordinary_data/views/rewrite_views.sh
            SRID=$SRID ./ordinary_data/functions/rewrite_functions.sh

            # In the end, check if there are some POST files to execute (postfiles must be named exactly like the delta files that have been executed previously)
            printf "\n"
            for i in "${TAB_FILES_POST[@]}"
            do
            printf "\n    Processing POST file: ${GREEN}$i${NC}\n"
            /usr/bin/psql --host $HOST --port 5432 --username "$USER" --no-password -d "$SRCDB" -f $i
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

echo "Dropping existing qwat_test"
/usr/bin/dropdb "$TESTDB" --host $HOST --port 5432 --username "$USER" --no-password
#/usr/bin/dropdb -d "service=$QWATSERVICETEST"

echo "Creating DB qwat_test"
/usr/bin/createdb "$TESTDB" --host $HOST --port 5432 --username "$USER" --no-password
#/usr/bin/createdb -d "service=$QWATSERVICETEST"

echo "Restoring current DB in qwat_test"
/usr/bin/pg_restore --host $HOST --port 5432 --username "$USER" --dbname "$TESTDB" --no-password --single-transaction --exit-on-error "$TODAY""_current_qwat.backup"
#/usr/bin/pg_restore -d "service=$QWATSERVICETEST" --single-transaction --exit-on-error "$TODAY""_current_qwat.backup"

# echo "Applying deltas on $TESTDB:"
# for f in $DIR/delta/*.sql
# do
#     CURRENT_DELTA=$(basename "$f")
#     CURRENT_DELTA_NUM_VERSION=$(echo $CURRENT_DELTA| cut -d'_' -f 2)
#     if [[ $CURRENT_DELTA_NUM_VERSION > $NUMVERSION ]]; then
#         printf "    Processing ${GREEN}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION\n"
#         /usr/bin/psql --host $HOST --port 5432 --username "$USER" --no-password -q -d "$TESTDB" -f $f
#     else
#         printf "    Bypassing  ${RED}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION\n"
#     fi
# done
TAB_FILES_POST=()
echo "Applying deltas on $TESTDB :"
for f in $DIR/delta/*.sql
do
    CURRENT_DELTA=$(basename "$f")
    CURRENT_DELTA_WITHOUT_EXT="${CURRENT_DELTA%.*}"
    CURRENT_DELTA_NUM_VERSION=$(echo $CURRENT_DELTA_WITHOUT_EXT| cut -c 7)
    CURRENT_DELTA_NUM_VERSION_FULL=$(echo $CURRENT_DELTA_WITHOUT_EXT| cut -d'_' -f 2)
    if [[ $CURRENT_DELTA_NUM_VERSION > $SHORT_LATEST_TAG || $CURRENT_DELTA_NUM_VERSION == $SHORT_LATEST_TAG || $SHORT_LATEST_TAG == '' ]]; then
        printf "    Processing ${GREEN}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION ($CURRENT_DELTA_NUM_VERSION_FULL)\n"
        #/usr/bin/psql -v ON_ERROR_STOP=1 --host $HOST --port 5432 --username "$USER" --no-password -q -d "$TESTDB" -f $f
        /usr/bin/psql --host $HOST --port 5432 --username "$USER" --no-password -q -d "$TESTDB" -f $f

        # Check if there is a POST file associated to the delta, if so, store it in the array for later execution
        EXISTS_POST_FILE=$f'.post'
        if [ -e "$EXISTS_POST_FILE" ]
        then
            TAB_FILES_POST+=($EXISTS_POST_FILE)
        fi

        printf "        Verifying num version conformity - "
        # For each delta run on the DB, we have to check that the version number contained in the file name is the same that has been hardcoded in the DB
        # note: delta files MUST include at their end: UPDATE qwat_sys.versions SET version = 'x.x.x';
        OUTPUT_NUM=`/usr/bin/psql -v ON_ERROR_STOP=1 --host $HOST --port 5432 --username "$USER" --no-password -q -d "$TESTDB" -t -c "SELECT version FROM qwat_sys.versions;"`
        OUTPUT_NUM="$(echo -e "${OUTPUT_NUM}" | tr -d '[:space:]')"
        if [ "$OUTPUT_NUM" != "$CURRENT_DELTA_NUM_VERSION_FULL" ]; then
            printf " Num in DB: ${GREEN}$OUTPUT_NUM${NC} - Num in file: ${RED}$CURRENT_DELTA_NUM_VERSION_FULL${NC} => ${RED}Numbers do NOT match !${NC}\n"
            EXITCODE=1
            exit $EXITCODE
        else
            printf " Num in DB: ${GREEN}$OUTPUT_NUM${NC} - Num in file: ${RED}$CURRENT_DELTA_NUM_VERSION_FULL${NC} => ${GREEN}OK${NC}\n"
        fi
    else
        printf "    Bypassing  ${RED}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION_FULL\n"
    fi
done


echo "Reloading views and functions from last commit"
export PGSERVICE=$QWATSERVICETEST
SRID=$SRID ../ordinary_data/views/rewrite_views.sh
SRID=$SRID ../ordinary_data/functions/rewrite_functions.sh


# In the end, check if there are some POST files to execute (postfiles must be named exactly like the delta files that have been executed previously)
printf "\n"

for i in "${TAB_FILES_POST[@]}"
do
   printf "\n    Processing POST file: ${GREEN}$i${NC}\n"
   /usr/bin/psql --host $HOST --port 5432 --username "$USER" --no-password -d "$TESTDB" -f $i
#    /usr/bin/psql -v ON_ERROR_STOP=1 --host $HOST --port 5432 --username "$USER" --no-password -q -d "$TESTDB"
done

# Clean temporary DB
echo "Dropping DB (qwat_test_conform)"
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

EXITCODE=0
exit $EXITCODE
