#!/usr/bin/env bash

DB_BASE_NAME=teksi_wastewater

set -e

if [ ! "$#" == "0" ]; then
  if [ ! "$1" == "wait" ] && [ ! "$1" == "build" ]; then
    echo "arg must be one of : 'wait' 'build'"
    exit 1
  fi
fi


printf "waiting for postgres…"
until PGSERVICE=postgres psql -c '\q' > /dev/null 2>&1; do
  printf " 🐘"
  sleep 3
done
echo ""


recreate_db(){
  echo "Database $1 : recreating..."
  psql -U postgres -d postgres -o /dev/null -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '$1'"
  dropdb -U postgres --if-exists $1
  createdb -U postgres $1
}

if [ "$1" == "wait" ]; then
  COUNT=0
  printf "waiting for Postgres…"
  until [[ -f ${PGDATA}/entrypoint-done-flag ]] && [[ $(( COUNT++ )) -ne 10 ]]; do
    printf " 🐘"
    sleep 3
  done
  echo ""
  echo "Initialization complete !"
  exit 0
fi

if [ "$#" == "0" ] || [ "$1" == "build" ]; then

  # we expect the service be named as pg_[DB_NAME]
  recreate_db "${PGSERVICE/pg_/}"
  echo '----------------------------------------'
  echo "Building database normally (passing argument: ${@:2})"

  /src/datamodel/scripts/setup.sh ${@:2}

  echo "Done ! Database ${PGSERVICE} can now be used."
  echo '----------------------------------------'

fi

# echo '----------------------------------------'
# echo "Updating postgis if needed"
# update-postgis.sh

echo "done" > ${PGDATA}/entrypoint-done-flag
