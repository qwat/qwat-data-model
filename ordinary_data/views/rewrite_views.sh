#!/usr/bin/env bash

set -e

DIR=$(git rev-parse --show-toplevel)

if [[ $QWAT_CH_VD_SIRE =~ ON ]]; then
  psql -v ON_ERROR_STOP=1 -f ${DIR}/extensions/ch_vd_sire/drop_views.sql
fi
psql -v ON_ERROR_STOP=1 -f ${DIR}/ordinary_data/views/drop_views.sql


${DIR}/ordinary_data/views/insert_views.sh
if [[ $QWAT_CH_VD_SIRE =~ ON ]]; then
  ${DIR}/extensions/ch_vd_sire/insert_views.sh
fi
