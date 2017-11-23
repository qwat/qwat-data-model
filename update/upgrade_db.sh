#!/bin/bash
# ##########
#
# QWAT local test and upgrade  script
# 23.11.2017
# Sylvain Beorchia
# régis Haubourg
# ##########

# Exit on error
set -e

usage() {
cat <<EOF
Usage: $0 [options]

-d| --local-dir     Optional local directory with customization scripts.
                     If not given, use current one defined by PGSERVICE env. variable.
-s|--srid            PostGIS SRID. Default to 21781 (ch1903)
-c|--clean           clean comp and test databases. Default is no clean to allow inspecting databases post mortem.
EOF

}


ARGS=$(getopt -o p:s:drv -l "local-dir:,srid:,clean" -- "$@");
if [ $? -ne 0 ];
then
  usage
  exit 1
fi

eval set -- "$ARGS";


# Default values

SRID=21781
CLEAN=0
LOCALDIRGIVEN=0

while true; do
  case "$1" in
    -d|--local-dir)
      shift;
      if [ -n "$1" ]; then
        export LOCALDIR=$1
        LOCALDIRGIVEN=1
        shift;
      fi
      ;;
     -s|--srid)
      shift;
      if [ -n "$1" ]; then
        SRID=$1
        shift;
      fi
      ;;
    -c|--clean)
      CLEAN=1
      shift;
      ;;
    --)
      shift;
      break;
      ;;
  esac
done


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

# 3/ optionaly use local customization scripts
#   launch upgrade_db.sh with --local-scripts-dir mydirpath


PATH_DUMP=/tmp/qwat_dump

#initialize qwat db
../init_qwat.sh -p qwat_comp -s $SRID -r

# add pum metadata to DB using current version
pum baseline -p qwat_comp -t qwat_sys.info -d delta/ -b 1.3.0

# checks delta files from 1.0 lead to the same version as current version, if yes upgrades
pum test-and-upgrade -pp qwat_prod -pt qwat_test -pc qwat_comp -t qwat_sys.info -d delta/ -f $PATH_DUMP -i columns constraints views sequences indexes triggers functions rules

# applies local script to test

if [[ "$LOCALDIRGIVEN" -eq 1 ]]; then
  pum upgrade -p qwat_test -t qwat_sys.info -d $LOCALDIR

  # display changes
  pum check -p1 qwat_prod -p2 qwat_test -i columns constraints views sequences indexes triggers functions rules

  # applies local scripts to qwat_prod
  pum upgrade -p qwat_prod -t qwat_sys.info -d $LOCALDIR

fi

# cleanup qwat_prod and qwat_test

dropdb qwat_prod
dropdb qwat_test


# usefull? checks differences between prod and comp and display them
# pum check -p1 qwat_prod -p2 qwat_comp -i columns constraints views sequences indexes triggers functions rules
