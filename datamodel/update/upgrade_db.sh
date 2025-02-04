#!/usr/bin/env bash
# ##########
#
# QWAT local test and upgrade  script
# 23.11.2017
# Sylvain Beorchia
# Régis Haubourg
# ##########

GNUGETOPT="getopt"
if [[ "$OSTYPE" =~ FreeBSD* ]] || [[ "$OSTYPE" =~ darwin* ]]; then
	GNUGETOPT="/usr/local/bin/getopt"
elif [[ "$OSTYPE" =~ openbsd* ]]; then
	GNUGETOPT="gnugetopt"
fi

# Default values
PGSERVICEFILE=~/.pg_service.conf
SRID=21781
CLEAN=0
TMPFILEDUMP=/tmp/qwat_dump
UPGRADE=0
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTDIRS=()
DELTADIRS=delta/
INITFILES=()

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Menu
while [[ $# > 0 ]]; do
key="$1"
case $key in
    -h|--help)
        echo "Arguments:"
        echo -e "\t-c|--clean\t\tCleans comp and test DB before starting"
        echo -e "\t-e|--extdirs\tAdds local customization or extension directories"
        echo -e "\t-h|--help\t\tShow this help screen"
        echo -e "\t-t|--tmppath\t\tTemporary file for QWAT dump"
        echo -e "\t-u|--upgrade\t\tUpgrade your real DB (perform all deltas on it)"
        echo -e "\t-p|--pgservicefile\t\tUse this pgservicefile"
        echo
        echo -e "Usage example: "
        echo -e "\t./upgrade_db.sh -c -e /path/to/local/extension_or_customization -t /tmp/qwat_tmp.dmp -u"
        echo -e "\t./upgrade_db.sh -c -t /tmp/qwat_tmp.dmp -u"
        echo
        exit 0
    ;;
    -c|--clean)
        CLEAN=1
    ;;
    # TODO: Add arguments
    -e|--extdirs)
        EXTDIRS+=("$2")
        shift # past argument
    ;;
    -t|--tmppath)
        TMPFILEDUMP="$2"
        shift # past argument
    ;;
    -u|--upgrade)
        UPGRADE=1
        shift # past argument
    ;;
    -p|--pgservicefile)
	PGSERVICEFILE="$2"
	shift # past argument
esac
shift
done

# Check if pum is installed
PUM_VERSION=$(pum -v)
if [[ $PUM_VERSION == '' ]]; then
    printf "\t${RED}PUM is not installed${NC}\n"
    echo "Please install PUM compatible with Python 3 (pip install pum)"
    echo
    exit 0
fi

# Get current version in ../system/CURRENT_VERSION.txt
# (git tag forbidden)
VERSION_FILE="${SCRIPTDIR}/../system/CURRENT_VERSION.txt"
if [ ! -f $VERSION_FILE ]; then
    echo
    printf "${RED}$VERSION_FILE file not found! Aborting${NC}\n"
    echo
    exit 0
fi
VERSION=$(cat $VERSION_FILE)

for i in "${EXTDIRS[@]}"
do
	DELTADIRS+=("$i/delta")
	INITFILES+=("$i/init.sh")
	echo ${INITFILES[*]}
done

if [[ -z "$PGSERVICEFILE" ]] || [[ ! -f "$PGSERVICEFILE" ]]; then
    echo "No valid PG service file given."
    exit 0
fi

# set -- "${POSITIONAL[@]}" # restore positional parameters
echo "Parameters:"
printf "\t${GREEN}PGSERVICEFILE = ${PGSERVICEFILE}${NC}\n"
printf "\t${GREEN}CLEAN         = ${CLEAN}${NC}\n"
printf "\t${GREEN}INITFILES     = ${INITFILES[*]}${NC}\n"
printf "\t${GREEN}DELTADIRS     = ${DELTADIRS[*]}${NC}\n"
printf "\t${GREEN}TMPFILEDUMP   = ${TMPFILEDUMP}${NC}\n"
printf "\t${GREEN}UPGRADE       = ${UPGRADE}${NC}\n"
echo
printf "\t${GREEN}PUM_VERSION   = $PUM_VERSION${NC}\n"
echo
printf "\t${GREEN}Current QWAT model version = ${VERSION}${NC}\n"
echo

# clean existing db
if [[ $CLEAN -eq 1 ]]; then
    printf "\n${BLUE}Cleaning  Option set:${NC}\n\n"

    sleep 1

    # Read DB info from pg_service.conf file
    DBCOMP_NAME=$(sed -n -e "/^\[pg_qwat_comp]/,/^\[/ p" $PGSERVICEFILE | grep "^dbname" | cut -d"=" -f2)
    DBCOMP_USER=$(sed -n -e "/^\[pg_qwat_comp]/,/^\[/ p" $PGSERVICEFILE | grep "^user" | cut -d"=" -f2)
    DBCOMP_HOST=$(sed -n -e "/^\[pg_qwat_test]/,/^\[/ p" $PGSERVICEFILE | grep "^host" | cut -d"=" -f2)
    DBCOMP_PORT=$(sed -n -e "/^\[pg_qwat_test]/,/^\[/ p" $PGSERVICEFILE | grep "^port" | cut -d"=" -f2)
    DBTEST_NAME=$(sed -n -e "/^\[pg_qwat_test]/,/^\[/ p" $PGSERVICEFILE | grep "^dbname" | cut -d"=" -f2)
    DBTEST_USER=$(sed -n -e "/^\[pg_qwat_test]/,/^\[/ p" $PGSERVICEFILE | grep "^user" | cut -d"=" -f2)
    DBTEST_HOST=$(sed -n -e "/^\[pg_qwat_test]/,/^\[/ p" $PGSERVICEFILE | grep "^host" | cut -d"=" -f2)
    DBTEST_PORT=$(sed -n -e "/^\[pg_qwat_test]/,/^\[/ p" $PGSERVICEFILE | grep "^port" | cut -d"=" -f2)

    if [ ! -z "$DBCOMP_HOST" ]; then
	    COMPHOST="-h $DBCOMP_HOST"
    fi
    if [ ! -z "$DBCOMP_PORT" ]; then
	    COMPPORT="-p $DBCOMP_PORT"
    fi
    if [ ! -z "$DBTEST_HOST" ]; then
	    TESTHOST="-h $DBTEST_HOST"
    fi
    if [ ! -z "$DBTEST_PORT" ]; then
	    TESTPORT="-p $DBTEST_PORT"
    fi

    # Drop test & comp DB
    dropdb $DBCOMP_NAME -U $DBCOMP_USER ${COMPHOST} ${COMPPORT}
    printf "\t${GREEN}DB $DBCOMP_NAME dropped${NC}\n"
    dropdb $DBTEST_NAME -U $DBTEST_USER ${TESTHOST} ${TESTPORT}
    printf "\t${GREEN}DB $DBTEST_NAME dropped${NC}\n"

    # Create test & comp DB
    createdb $DBCOMP_NAME -U $DBCOMP_USER ${COMPHOST} ${COMPPORT}
    printf "\t${GREEN}DB $DBCOMP_NAME created${NC}\n"
    createdb $DBTEST_NAME -U $DBTEST_USER ${TESTHOST} ${TESTPORT}
    printf "\t${GREEN}DB $DBTEST_NAME created${NC}\n"
fi

# initialize qwat db comparison db
# do not use -r to avoid re-creating the roles, as the roles should already
# be there for the main pg_qwat_prod database
printf "\n${BLUE}Initializing qwat comparison db${NC}\n\n"

sleep 1
${SCRIPTDIR}/../setup.sh -p pg_qwat_comp -s $SRID

# Initialize qwat db with extensions/customizations
for i in "${INITFILES[@]}"
do
	echo $i
	$i -p pg_qwat_comp -s $SRID
done

# checks delta files from 1.0 lead to the same version as current version, if yes upgrades
printf "\n${BLUE}Test and upgrade qwat core${NC}\n\n"
sleep 1

# Run pum test-and-upgrade manually to handle audit triggers (enabled in init script, not in 1.3.6 dump)
# Backup of db prod
pum dump -p pg_qwat_prod $TMPFILEDUMP
# Restore db dump on db test
pum restore -p pg_qwat_test $TMPFILEDUMP
# Apply deltas on db test
pum upgrade -p pg_qwat_test -t qwat_sys.info -d ${DELTADIRS[*]}

# Audit triggers are enabled in the init scripts, but not in the released 1.3.6 dump.
# so we need to enable it, otherwise pum check will detect differences.
psql -d $DBTEST_NAME -U $DBTEST_USER ${TESTHOST} ${TESTPORT} -c 'SELECT qwat_sys.activate_audit_views();'

# Compare db test with db comp
pum check -p1 pg_qwat_test -p2 pg_qwat_comp -v 2 -i views rules
CHECK=$?
if [ $CHECK -ne 1 ]; then
    
    printf "\n${GREEN}SUCCESS ${NC} !! Going to upgrade production database...\n\n"
    #Upgrade on db prod
    pum upgrade -p pg_qwat_prod -t qwat_sys.info -d ${DELTADIRS[*]}
else 
    printf "\n${RED}ERROR ${NC} on comparing databases (pg_qwat_test & pg_qwat_comp). Production database will not be upgraded\n"
fi

#pum test-and-upgrade -pp pg_qwat_prod -pt pg_qwat_test -pc pg_qwat_comp -t qwat_sys.info -d delta/ -f $TMPFILEDUMP -i columns constraints views sequences indexes triggers functions rules
# pum test-and-upgrade -x -pp pg_qwat_prod -pt pg_qwat_test -pc pg_qwat_comp -t qwat_sys.info -d ${DELTADIRS[*]} -f $TMPFILEDUMP -i views rules
