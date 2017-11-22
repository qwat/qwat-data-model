#!/bin/bash

# Check compatibility of your DB, and upgrade it to the latest version
#
# INFOS: 
# 1/ PUM must be install on you system before running this script
#    PUM requires python3
#    pip install pum
#
# 2/ You must have declared some PG services:
#   qwat_prod
#   qwat_comp
#   qwat_test
#
#  Each service correspond to a DB. qwat_prod is your main DB. The 2 others are for testing the migration

PATH_DUMP=/tmp/qwat_dump

../init_qwat.sh -p qwat_comp -s 21781 -r
pum baseline -p qwat_comp -t qwat_sys.info -d delta/ -b 1.3.0

pum test-and-upgrade -pp qwat_prod -pt qwat_test -pc qwat_comp -t qwat_sys.info -d delta/ -f $PATH_DUMP -i columns constraints views sequences indexes triggers functions rules

pum check -p1 qwat_prod -p2 qwat_comp -i columns constraints views sequences indexes triggers functions rules




