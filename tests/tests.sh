#!/bin/bash

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

if [ "$INIT_DB" = "1" ]; then
    cd ${DIR}/..
    ./init_qwat.sh -p qwat_test -d
    cd -
fi

export PGSERVICE=qwat_test
export PGOPTIONS="-c lc_messages=C -c client_min_messages=ERROR"

TESTS="test_add_node.sql test_node_orientation.sql test_altitude.sql"

EXITCODE=0

for f in ${TESTS}; do
    echo -n "Running $f ... "
    fo="/tmp/${f}.txt"
    psql -tA -f ${DIR}/$f >$fo 2>&1
    diff -u $fo ${DIR}/${f/.sql/.expected.sql} >/dev/null
    if [ "$?" = "1" ]; then
		EXITCODE=1
        echo "Error"
        diff -u $fo ${DIR}/${f/.sql/.expected.sql}
    fi
    echo "OK"
done

exit $EXITCODE
