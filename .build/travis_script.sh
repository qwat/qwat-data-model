#!/usr/bin/env bash

set -e

cd $TRAVIS_BUILD_DIR

export VERSION=$(cat "$TRAVIS_BUILD_DIR/system/CURRENT_VERSION.txt")

# Get the 1.2.1 data_and_structure dump
wget -q -O qwat_dump.backup https://github.com/qwat/qwat-data-sample/raw/master/qwat_v1.2.1_data_and_structure_sample.backup

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
pum restore -p pg_qwat_prod qwat_dump.backup

# Set the baseline for the prod database
pum baseline -p pg_qwat_prod -t qwat_sys.info -d $DELTA_DIRS -b 1.2.1

# Run setup.sh to create the last version of qwat db used as the comp database
echo "::group::Initialize database"
$TRAVIS_BUILD_DIR/setup.sh -p pg_qwat_comp -s 21781 -r -n
psql service=pg_qwat_comp -f $EXTRA_DELTA_FILE
echo "::endgroup::"

# Set the baseline for the comp database
pum baseline -p pg_qwat_comp -t qwat_sys.info -d $DELTA_DIRS -b $VERSION

# Run test_and_upgrade
echo "::group::Run test and upgrade"
yes | pum test-and-upgrade -pp pg_qwat_prod -pt pg_qwat_test -pc pg_qwat_comp -t qwat_sys.info -d $DELTA_DIRS -f /tmp/qwat_dump -i views rules triggers
echo "::endgroup::"

# Run a last check between pg_qwat_prod and pg_qwat_comp
pum check -p1 pg_qwat_prod -p2 pg_qwat_comp -i views rules triggers

# Extend pg_qwat_prod with a customization
echo "::group::Extend database with a customization"
$TRAVIS_BUILD_DIR/.build/customizations/sigip/init.sh -p pg_qwat_prod -s 21781
echo "::endgroup::"

# Run upgrade with customizations/sigip/delta as an extra delta dir
DELTA_DIRS="$DELTA_DIRS $TRAVIS_BUILD_DIR/.build/customizations/sigip/delta"
echo "::group::Run upgrade"
pum upgrade -p pg_qwat_prod -t qwat_sys.info -d $DELTA_DIRS
echo "::endgroup::"

# New test for upgrade
psql service=pg_qwat_prod -c "DROP TABLE qwat_table_test_"
yes | $TRAVIS_BUILD_DIR/update/upgrade_db.sh -p $PGSERVICEFILE -c -e $TRAVIS_BUILD_DIR/.build/customizations/sigip -t /tmp/qwat.dmp -u
exit 0
