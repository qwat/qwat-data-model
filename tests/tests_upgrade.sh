#!/usr/bin/env bash

# This tests that the database upgraded by PUM is consistent to the database
# initialized by qwat_init.sh
#It retrieves the

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INIT_DB=1

while [[ $# > 0 ]]; do
key="$1"
case $key in
    -h|--help)
        echo "Arguments:"
        echo -e "\t-h|--help\tShow this help screen"
        echo -e "\t-n|--no-init\tDo not init the test database"
        exit 0
        ;;
    -n|--no-init)
        INIT_DB=0
        ;;
esac

shift
done

PGSERVICE1=qwat_test
PGSERVICE2=qwat_test_release
VERSION=1.3.6
RELEASE_URL=https://github.com/qwat/qwat-data-model/releases/download/${VERSION}/qwat_v${VERSION}_data_and_structure_sample.backup
RELEASE_LOCATION=/tmp/qwat_v${VERSION}.backup

# Download the release if needed
if [ -f "${RELEASE_LOCATION}" ]; then
    echo "Release file '$RELEASE_LOCATION' already exists, skipping download."
else
    wget ${RELEASE_URL} -O ${RELEASE_LOCATION} --no-verbose
fi

# Initialize the databases (qwat_test for the init data, qwat_test_release for restoring the release dump)
if [ "$INIT_DB" = "1" ]; then
    cd ${DIR}/..
    ./init_qwat.sh -p ${PGSERVICE1} -d
    cd -
fi

# Restore the release to qwat_test_release
psql service=${PGSERVICE1} -c 'DROP DATABASE IF EXISTS qwat_test_release'
psql service=${PGSERVICE1} -c 'CREATE DATABASE qwat_test_release'
pum restore -p ${PGSERVICE2} -x ${RELEASE_LOCATION}

# Upgrade using pum
pum upgrade -p ${PGSERVICE2} -t qwat_sys.info -d ${DIR}/../update/delta

# Compare results
pum check -p1 ${PGSERVICE1} -p2 ${PGSERVICE2} --exclude-schema public --exclude-schema tiger --exclude-schema topology

echo "Success 😁 !!"
