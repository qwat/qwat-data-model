#!/usr/bin/env python

import imp
import os
import sys

pgiv = imp.load_source('PGInheritanceView', os.path.join(os.path.dirname(__file__), '../../metaproject/postgresql/pg_inheritance_view/pg_inheritance_view.py'))

if len(sys.argv) > 1:
  pg_service = sys.argv[1]
else:
  pg_service = "qwat_test"



qwat_installations = """
alias: installation
table: qwat_od.installation
pkey: id
pkey_value: NEW.id

allow_type_change: false

schema: qwat_od

children:
  chamber:
    table: qwat_od.chamber
    pkey: id

  pressurecontrol:
    table: qwat_od.pressurecontrol
    pkey: id

  pump:
    table: qwat_od.pump
    pkey: id

  source:
    table: qwat_od.source
    pkey: id

  tank:
    table: qwat_od.tank
    pkey: id

  treatment:
    table: qwat_od.treatment
    pkey: id


merge_view:
  name: vw_qwat_installation
  allow_type_change: false
"""


print pgiv.PGInheritanceView(pg_service, qwat_installations).sql_all()




