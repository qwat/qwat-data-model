#!/bin/bash
# ##########
#
# QWAT local test and upgrade  script
# 23.11.2017
# Sylvain Beorchia
# Régis Haubourg
# ##########

# Default values
SRID=21781
CLEAN=0
LOCALDIRGIVEN=1
LOCALDIR=/home/regis/OSLANDIA/projets_locaux/QWAT/local_update_dir_test/
TMPDIR=/tmp/qwat_dump
VERSION=1.3.0
UPGRADE=0

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# TODO: get version from a file tag in qwat sources (git tag forbidden) /system/"current_version" file should do.

# Menu
while [[ $# > 0 ]]; do
key="$1"
case $key in
    -h|--help)
        echo "Arguments:"
        echo -e "\t-c|--clean\t\tCleans comp and test DB before starting"
        echo -e "\t-d|--localdirpath\tRuns a second update cycle with local customization delta files"
        echo -e "\t-h|--help\t\tShow this help screen"
        echo -e "\t-t|--tmppath\t\tTemporary path for QWAT dump"
        echo -e "\t-u|--upgrade\t\tUpgrade your real DB (perform all deltas on it)"
        echo
        echo -e "Usage example: "
        echo -e "\t./upgrade_db.sh -c -d /path/to/local/deltas/ -t /tmp/ -u"
        echo
        exit 0
    ;;
    -c|--clean)
        CLEAN=1
    ;;
    -d|--localdirpath)
        LOCALDIR="$2"
        LOCALDIRGIVEN=1
        shift # past argument
    ;;
    -t|--tmppath)
        TMPDIR="$2"
        shift # past argument
    ;;
    -u|--upgrade)
        UPGRADE=1
        shift # past argument
    ;;
esac
shift
done

# set -- "${POSITIONAL[@]}" # restore positional parameters
echo "Parameters:"
printf "\t${GREEN}CLEAN    = ${CLEAN}${NC}\n"
printf "\t${GREEN}LOCALDIR = ${LOCALDIR}${NC}\n"
printf "\t${GREEN}TMPDIR   = ${TMPDIR}${NC}\n"
printf "\t${GREEN}UPGRADE  = ${UPGRADE}${NC}\n"
echo


# clean existing db
if [[ $CLEAN -eq 1 ]]; then
    printf "${BLUE}Cleaning  Option set:${NC}\n"

    sleep 1s

    # Read DB info from pg_service.conf file
    DBCOMP_NAME=$(sed -n -e "/^\[qwat_comp]/,/^\[/ p" ~/.pg_service.conf | grep "^dbname" | cut -d"=" -f2)
    DBCOMP_USER=$(sed -n -e "/^\[qwat_comp]/,/^\[/ p" ~/.pg_service.conf | grep "^user" | cut -d"=" -f2)
    DBTEST_NAME=$(sed -n -e "/^\[qwat_test]/,/^\[/ p" ~/.pg_service.conf | grep "^dbname" | cut -d"=" -f2)
    DBTEST_USER=$(sed -n -e "/^\[qwat_test]/,/^\[/ p" ~/.pg_service.conf | grep "^user" | cut -d"=" -f2)
    # TODO get also password, port and host

    # Drop test & comp DB
    dropdb $DBCOMP_NAME -U $DBCOMP_USER
    printf "\t${GREEN}DB $DBCOMP_NAME dropped${NC}\n"
    dropdb $DBTEST_NAME -U $DBTEST_USER
    printf "\t${GREEN}DB $DBTEST_NAME dropped${NC}\n"

    # Create test & comp DB
    createdb $DBCOMP_NAME -U $DBCOMP_USER
    printf "\t${GREEN}DB $DBCOMP_NAME created${NC}\n"
    createdb $DBTEST_NAME -U $DBTEST_USER
    printf "\t${GREEN}DB $DBTEST_NAME created${NC}\n"
fi


# initialize qwat db comparison db
printf "${BLUE}Initializing qwat comparison db${NC}\n"

sleep 1s
../init_qwat.sh -p qwat_comp -s $SRID -r

# add pum metadata to DB using current version
printf "${BLUE}PUM baseline on qwat_comp${NC}\n"
sleep 1s

pum baseline -p qwat_comp -t qwat_sys.info -d delta/ -b $VERSION


# checks delta files from 1.0 lead to the same version as current version, if yes upgrades
printf "${BLUE}Test and upgrade qwat core${NC}\n"
sleep 1s


pum test-and-upgrade -pp qwat_prod -pt qwat_test -pc qwat_comp -t qwat_sys.info -d delta/ -f $TMPDIR -i columns constraints views sequences indexes triggers functions rules

# applies local script to test

if [[ "$LOCALDIRGIVEN" -eq 1 ]]; then
  printf "${BLUE}Upgrade qwat_comp with local directory${NC}\n"
  sleep 1s

  pum upgrade -p qwat_comp -t qwat_sys.info -d $LOCALDIR

  #   # display changes
  printf "${BLUE}Check differences between prod and test + local delta${NC}\n"
  sleep 1s

  pum check -p1 qwat_prod -p2 qwat_comp -i columns constraints views sequences indexes triggers functions rules

  # TODO ASK user if he wants to apply changes
  printf "${BLUE}Do the local upgrade${NC}\n"
  sleep 1s

  #   # applies local scripts to qwat_prod
  pum upgrade -p qwat_prod -t qwat_sys.info -d $LOCALDIR
  #
fi
