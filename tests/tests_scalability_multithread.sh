#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INIT_DB=1
NB_ITERATIONS=100

while [[ $# > 0 ]]; do
key="$1"
case $key in
    -h|--help)
        echo "Arguments:"
        echo -e "\t-h|--help\tShow this help screen"
        echo -e "\t-n|--no-init\tDo not init the test database"
        echo -e "\t-n|--nb-iterations\tNumber of iterations. Default is 100"
        exit 0
        ;;
    -n|--no-init)
        INIT_DB=0
        ;;
    -n|--nb-iterations)
        NB_ITERATIONS=$2
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


echo "Running initializations... "
psql -tA -f ${DIR}/test_scenarii_scalability_init.sql
echo "OK"


echo "Launching requests..."
python3 test_scalability_multithread.py --pg_service qwat_test --nb_iterations ${NB_ITERATIONS}

EXITCODE=0

exit $EXITCODE
