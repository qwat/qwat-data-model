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

# Drop qwat_sigip schema that is included in the release but that seems to
# make migrations fail.
# TODO: qwat_sigip should be probably be removed from the dumps, or if really obsolete,
# removed from the source and dumped in a migration
psql service=${PGSERVICE2} -c 'DROP SCHEMA qwat_sigip CASCADE'
# despite being in qwat_od, this seems to be a qwat_sigip customization (created in data-model/.build/customizations/sigip/damage/damage.sql)
psql service=${PGSERVICE2} -c 'DROP TABLE qwat_od.damage CASCADE'

# Upgrade using pum
pum upgrade -p ${PGSERVICE2} -t qwat_sys.info -d ${DIR}/../update/delta

# Audit triggers are enabled in the init scripts, but not in the released 1.3.6 dump.
# so we need to enable it, otherwise pum check will detect differences.
psql service=${PGSERVICE2} -c 'SELECT qwat_sys.activate_audit_views()'

# Compare results
pum check -p1 ${PGSERVICE1} -p2 ${PGSERVICE2} --exclude-schema public --exclude-schema tiger --exclude-schema topology

echo "Success 😁 !!"
