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
        echo -e "\t-i|--nb-iterations\tNumber of iterations. Default is 100"
        exit 0
        ;;
    -n|--no-init)
        INIT_DB=0
        ;;
    -i|--nb-iterations)
        NB_ITERATIONS=$2
        ;;
esac

shift
done

PGSERVICE=qwat_test

if [ "$INIT_DB" = "1" ]; then
    cd ${DIR}/..
    ./init_qwat.sh -p ${PGSERVICE} -d
    cd -
fi

echo "Running initializations... "
psql service=${PGSERVICE} -c "SET lc_messages TO 'en_US.UTF-8'" -c "SET client_min_messages TO ERROR" -tA -f ${DIR}/test_scenarii_scalability_init.sql
echo "OK"


echo "Launching requests..."
python3 ${DIR}/test_scalability_multithread.py --pg_service ${PGSERVICE} --nb_iterations ${NB_ITERATIONS}

EXITCODE=0

exit $EXITCODE
