#!/bin/bash

# exit on error
set -e

# PARAMS
TESTDB=qwat_test
TESTCONFORMDB=qwat_test_conform
DEMODB=qwat_demo
USER=postgres
HOST=localhost
QWATSERVICETEST=qwat_test
QWATSERVICETESTCONFORM=qwat_test_conform
SRID=21781
QWAT_USER='qwat-admin'
QWAT_EMAIL='admin@qwat.org'

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
# SHORT_LATEST_TAG=$(echo $LATEST_TAG| cut -c 1)
if [[ ${LATEST_TAG:0:1} == "v" ]] ; then 
    SHORT_LATEST_TAG=$(echo $LATEST_TAG| cut -c2-2)
else 
    SHORT_LATEST_TAG=$(echo $LATEST_TAG| cut -c 1)
fi
printf "    Latest tag = ${GREEN}$SHORT_LATEST_TAG ($LATEST_TAG) ${NC}\n"


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
echo "Switching on latest tag major version ${GREEN}$PROPER_LATEST_TAG)${NC}"
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
    CURRENT_DELTA_WITHOUT_EXT="${CURRENT_DELTA%.*}"
    #CURRENT_DELTA_NUM_VERSION=$(echo $CURRENT_DELTA| cut -d'_' -f 2)
    CURRENT_DELTA_NUM_VERSION=$(echo $CURRENT_DELTA_WITHOUT_EXT| cut -c 7)
    CURRENT_DELTA_NUM_VERSION_FULL=$(echo $CURRENT_DELTA_WITHOUT_EXT| cut -d'_' -f 2)
    if [[ $CURRENT_DELTA_NUM_VERSION > $SHORT_LATEST_TAG || $CURRENT_DELTA_NUM_VERSION == $SHORT_LATEST_TAG || $SHORT_LATEST_TAG == '' ]]; then
        printf "    Processing ${GREEN}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION ($CURRENT_DELTA_NUM_VERSION_FULL)\n"
        /usr/bin/psql -v ON_ERROR_STOP=1 --host $HOST --port 5432 --username "$USER" --no-password -q -d "$TESTCONFORMDB" -f $f

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
        OUTPUT_NUM="$(/usr/bin/psql -v ON_ERROR_STOP=1 --host $HOST --port 5432 --username "$USER" --no-password -q -d "$TESTCONFORMDB" -t -c "SELECT version FROM qwat_sys.versions;")"
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
#     STATUS=echo $STATUS | sed 's/%/\\045/'
    printf "${GREEN}Migration TEST is successfull${NC}. You may now migrate your real DB\n"
    EXITCODE=0
else
    printf "${RED}Migration TEST has failed${NC}. Please contact qWat team and give them the following output :\n $STATUS \n\n"
    EXITCODE=1
fi

# In the end, check if there are some POST files to execute (postfiles must be named exactly like the delta files that have been executed previously)
printf "\n"
for i in "${TAB_FILES_POST[@]}"
do
   printf "\n    Processing POST file: ${GREEN}$i${NC}\n"
   /usr/bin/psql --host $HOST --port 5432 --username "$USER" --no-password -d "$QWATSERVICETEST" -f $i
done


cd ..
printf "\n\n\n${GREEN}Updating DATA-SAMPLE${NC}\n\n\n"


if [[ $EXITCODE == 0 ]]; then
#if [[ $TRAVIS_BRANCH == 'master' ]]  # TODO reactivate in the end
    TAB_FILES_POST=()
    # If all is OK, update the DUMP demo ONLY IF WE ARE in the master
    # 1 - Load the DEMO dump in a new demo DB
    printf "${YELLOW}Creating DB (qwat_demo)${NC}\n"
    /usr/bin/createdb "$DEMODB" --host $HOST --port 5432 --username "$USER" --no-password
    /usr/bin/psql --host $HOST --port 5432 --username "$USER" --no-password -d "$DEMODB" -c "CREATE EXTENSION postgis; CREATE EXTENSION hstore;"

    printf "\n${YELLOW}Cloning Data-sample repository${NC}\n"
    
    #git remote add upstream "https://$GH_TOKEN@github.com/rust-lang/rust-by-example.git"
    git clone https://$GH_TOKEN@github.com/qwat/qwat-data-sample.git data-sample
    printf "\n${YELLOW}Restoring data-sample in qwat_demo :${NC}\n"
    for f in data-sample/*.backup
    do
        if [[ "$f" == *_data_and_structure_sample.backup ]]; then
            printf "\n${YELLOW}   Restoring $f ${NC}\n"
            /usr/bin/pg_restore --host $HOST --port 5432 --username "$USER"  --no-password --dbname "$DEMODB" --verbose "$f" >output.txt 2>&1
        fi
    done
    echo "Done"

    # 2 - Execute deltas on that base that are > to the DB version
    printf "\n${YELLOW}Getting num version from qwat_demo${NC}\n"
    SAMPLE_VERSION=`/usr/bin/psql -v ON_ERROR_STOP=1 --host $HOST --port 5432 --username "$USER" --no-password -q -d "$DEMODB" -t -c "SELECT version FROM qwat_sys.versions;"`
    printf "\n${GREEN}${SAMPLE_VERSION}${NC}\n"

    printf "\n${YELLOW}Applying deltas on qwat_demo${NC}\n"
    for f in $DIR/delta/*.sql
    do
        CURRENT_DELTA=$(basename "$f")
        CURRENT_DELTA_WITHOUT_EXT="${CURRENT_DELTA%.*}"
        CURRENT_DELTA_NUM_VERSION=$(echo $CURRENT_DELTA_WITHOUT_EXT| cut -c 7)
        CURRENT_DELTA_NUM_VERSION_FULL=$(echo $CURRENT_DELTA_WITHOUT_EXT| cut -d'_' -f 2)
        if [[ $CURRENT_DELTA_NUM_VERSION > $SAMPLE_VERSION || $CURRENT_DELTA_NUM_VERSION == $SAMPLE_VERSION || $SAMPLE_VERSION == '' ]]; then
            printf "    Processing ${GREEN}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION ($CURRENT_DELTA_NUM_VERSION_FULL)\n"
            /usr/bin/psql -v ON_ERROR_STOP=1 --host $HOST --port 5432 --username "$USER" --no-password -q -d "$DEMODB" -f $f

            # Check if there is a POST file associated to the delta, if so, store it in the array for later execution
            EXISTS_POST_FILE=$f'.post'
            if [ -e "$EXISTS_POST_FILE" ]
            then
                TAB_FILES_POST+=($EXISTS_POST_FILE)
            fi
        else
            printf "    Bypassing  ${RED}$CURRENT_DELTA${NC}, num version = $CURRENT_DELTA_NUM_VERSION_FULL\n"
        fi
    done
    LAST_VERSION=$CURRENT_DELTA_NUM_VERSION_FULL

    # Checking version
    if [[ $LAST_VERSION < $SAMPLE_VERSION ]]; then
        LAST_VERSION=$SAMPLE_VERSION
    fi

    # 3 - re-create views & triggers
    printf "\n${YELLOW}Reloading views and functions${NC}\n"

    export PGSERVICE=$DEMODB
    SRID=$SRID ./ordinary_data/views/rewrite_views.sh
    SRID=$SRID ./ordinary_data/functions/rewrite_functions.sh
    # 4 - Execute post delta files if there are
    printf "\n"
    for i in "${TAB_FILES_POST[@]}"
    do
    printf "\n    Processing POST file: ${GREEN}$i${NC}\n"
    /usr/bin/psql --host $HOST --port 5432 --username "$USER" --no-password -d "$DEMODB" -f $i
    done
    # 5 - Mark the version
    /usr/bin/psql -v ON_ERROR_STOP=1 --host $HOST --port 5432 --username "$USER" --no-password -q -d "$DEMODB" -t -c "UPDATE qwat_sys.versions SET version = '$LAST_VERSION';"

    # 6 - Dump the new DB
    cd data-sample
    printf -v FILE_NAME "qwat_v%s_data_and_structure_sample_TEST.backup" $LAST_VERSION  # TODO remove the _TEST tag
    printf "\n${YELLOW}Dumping qwat_demo to $FILE_NAME ${NC}\n"
    /usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --no-password  --format custom --blobs --section data --verbose --file "$FILE_NAME" --schema "qwat_dr" --schema "qwat_od" "$DEMODB"

    # Procude also a DUMP with the structure only + models (for windows users)
    printf -v FILE_NAME_STRUCT "qwat_v%s_structure_sample_TEST.backup" $LAST_VERSION  # TODO remove the _TEST tag
    printf "\n${YELLOW}Dumping qwat_demo structure to $FILE_NAME_STRUCT ${NC}\n"
    /usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --no-password  --format custom --blobs --section data --verbose --file "$FILE_NAME_STRUCT" --schema "qwat_dr" --schema "qwat_od" --schema "qwat_sys" --schema-only "$DEMODB"

    printf -v FILE_NAME_VL "qwat_v%s_qwatvl_sample_TEST.backup" $LAST_VERSION  # TODO remove the _TEST tag
    printf "\n${YELLOW}Dumping qwat_demo structure to $FILE_NAME_VL ${NC}\n"
    /usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --no-password  --format custom --blobs --section data --verbose --file "$FILE_NAME_VL" --schema "qwat_vl" "$DEMODB"

    # 7 - Update git
    printf "\n${YELLOW}Updating qwat-data-sample repository with new DUMPs $FILE_NAME, $FILE_NAME_STRUCT, $FILE_NAME_VL ${NC}\n"
#     git init
    git config user.name "$QWAT_USER"
    git config user.email "$QWAT_EMAIL"
    git add $FILE_NAME
    git add $FILE_NAME_STRUCT
    git add $FILE_NAME_VL
    git commit -m "Update data-sample"
#     git push
#     git push https://$GH_TOKEN@github.com/qwat/qwat-data-sample.git
    git push https://$QWAT_USER@github.com/qwat/qwat-data-sample.git

#fi
fi

exit $EXITCODE