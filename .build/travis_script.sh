#!/usr/bin/env bash

set -e

cd $TRAVIS_BUILD_DIR

export VERSION=$(sed 'r' "$TRAVIS_BUILD_DIR/system/CURRENT_VERSION.txt")

# Get the 1.2.1 data_and_structure dump
wget -q -O qwat_dump.backup https://github.com/qwat/qwat-data-sample/raw/master/qwat_v1.2.1_data_and_structure_sample.backup

# Restore the 1.2.1 dump in the prod database
pum restore -p qwat_prod qwat_dump.backup

# Set the baseline for the prod database
pum baseline -p qwat_prod -t qwat_sys.info -d $TRAVIS_BUILD_DIR/update/delta/ -b 1.2.1

# Run init_qwat.sh to create the last version of qwat db used as the comp database
printf "travis_fold:start:init_qwat\nInitialize database"
$TRAVIS_BUILD_DIR/init_qwat.sh -p qwat_comp -s 21781 -r -n
echo "travis_fold:end:init-qwat"

# Set the baseline for the comp database
pum baseline -p qwat_comp -t qwat_sys.info -d $TRAVIS_BUILD_DIR/update/delta/ -b $VERSION

# Run test_and_upgrade
printf "travis_fold:start:test-and-upgrade\nRun test and upgrade"
yes | pum test-and-upgrade -pp qwat_prod -pt qwat_test -pc qwat_comp -t qwat_sys.info -d $TRAVIS_BUILD_DIR/update/delta/ -f /tmp/qwat_dump -i views rules
echo "travis_fold:end:test-and-upgrade"

# Run a last check between qwat_prod and qwat_comp
pum check -p1 qwat_prod -p2 qwat_comp -i views rules

exit 0
