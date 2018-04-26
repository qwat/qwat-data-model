#!/usr/bin/env bash

set -e

cd $TRAVIS_BUILD_DIR

export VERSION=$(sed 'r' "$TRAVIS_BUILD_DIR/system/CURRENT_VERSION.txt")

# Get the 1.2.1 data_and_structure dump
wget -q -O qwat_dump.backup https://github.com/qwat/qwat-data-sample/raw/master/qwat_v1.2.1_data_and_structure_sample.backup

# Create a PostgreSQL service file and export the PGSERVICEFILE environment variable
PGSERVICEFILE="/tmp/pg_service.conf"
cat > $PGSERVICEFILE << EOF
[qwat_prod]
host=localhost
dbname=qwat_prod
user=postgres

[qwat_test]
host=localhost
dbname=qwat_test
user=postgres

[qwat_comp]
host=localhost
dbname=qwat_comp
user=postgres
EOF
export PGSERVICEFILE

# Use an extra delta directory with an extra delta file to exercise Pum's
# multi delta dir feature
EXTRA_DELTA_DIR="/tmp/delta/"
EXTRA_DELTA_FILE="$EXTRA_DELTA_DIR/delta_1.2.1_extra_delta_for_test.sql"

DELTA_DIRS="$TRAVIS_BUILD_DIR/update/delta/ $EXTRA_DELTA_DIR"

mkdir -p $EXTRA_DELTA_DIR

cat > $EXTRA_DELTA_FILE << EOF
CREATE TABLE qwat_table_test_ (qwat_column_test_ text);
EOF

# Restore the 1.2.1 dump in the prod database
pum restore -p qwat_prod qwat_dump.backup

# Set the baseline for the prod database
pum baseline -p qwat_prod -t qwat_sys.info -d $DELTA_DIRS -b 1.2.1

# Run init_qwat.sh to create the last version of qwat db used as the comp database
printf "travis_fold:start:init-qwat\nInitialize database"
$TRAVIS_BUILD_DIR/init_qwat.sh -p qwat_comp -s 21781 -r -n
psql service=qwat_comp -f $EXTRA_DELTA_FILE
echo "travis_fold:end:init-qwat"

# Set the baseline for the comp database
pum baseline -p qwat_comp -t qwat_sys.info -d $DELTA_DIRS -b $VERSION

# Run test_and_upgrade
printf "travis_fold:start:test-and-upgrade\nRun test and upgrade"
yes | pum test-and-upgrade -pp qwat_prod -pt qwat_test -pc qwat_comp -t qwat_sys.info -d $DELTA_DIRS -f /tmp/qwat_dump -i views rules
echo "travis_fold:end:test-and-upgrade"

# Run a last check between qwat_prod and qwat_comp
pum check -p1 qwat_prod -p2 qwat_comp -i views rules

# Extend qwat_prod with ch_vd_sire
printf "travis_fold:start:init-sire\nExtend database with ch_vd_sire"
$TRAVIS_BUILD_DIR/extensions/ch_vd_sire/init_sire.sh -p qwat_prod -s 21781
echo "travis_fold:end:init-sire"

# Run upgrade with extensions/ch_vd_sire/delta as an extra delta dir
DELTA_DIRS="$DELTA_DIRS $TRAVIS_BUILD_DIR/extensions/ch_vd_sire/delta"
printf "travis_fold:start:upgrade\nRun upgrade"
pum upgrade -p qwat_prod -t qwat_sys.info -d $DELTA_DIRS
echo "travis_fold:end:upgrade"

# Extend qwat_prod with a customization
printf "travis_fold:start:init-sire\nExtend database with a customization"
$TRAVIS_BUILD_DIR/.build/customizations/sigip/init_sigip.sh -p qwat_prod -s 21781
echo "travis_fold:end:init-sire"

# Run upgrade with customizations/sigip/delta as an extra delta dir
DELTA_DIRS="$DELTA_DIRS $TRAVIS_BUILD_DIR/.build/customizations/sigip/delta"
printf "travis_fold:start:upgrade\nRun upgrade"
pum upgrade -p qwat_prod -t qwat_sys.info -d $DELTA_DIRS
echo "travis_fold:end:upgrade"

exit 0
