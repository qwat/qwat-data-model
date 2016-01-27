#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${DIR}/..
./init_qwat.sh -p qwat_test -d
cd -

export PGSERVICE=qwat_test

TESTS="test_add_node.sql test_node_orientation.sql test_altitude.sql"

for f in ${TESTS}; do
    echo -n "Running $f ... "
    psql -tA -f ${DIR}/$f >/tmp/test.txt 2>/dev/null
    diff -u /tmp/test.txt ${f/.sql/.expected.sql} >/dev/null
    if [ "$?" = "1" ]; then
        echo "Error"
        diff -u /tmp/test.txt ${f/.sql/.expected.sql}
    fi
    echo "OK"
done

