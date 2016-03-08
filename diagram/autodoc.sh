#!/bin/sh
postgresql_autodoc -t dot -d qwat -s qwat_od -f qwat_od
unflatten -c 7 qwat_od.dot | dot -Tpng > qwat_od.png
postgresql_autodoc -t dot -d qwat -s qwat_dr -f qwat_dr
unflatten -c 7 qwat_dr.dot | dot -Tpng > qwat_dr.png
postgresql_autodoc -t dot -d qwat -s qwat_sys -f qwat_sys
unflatten -c 7 qwat_sys.dot | dot -Tpng > qwat_sys.png
postgresql_autodoc -t dot -d qwat -s qwat_vl -f qwat_vl
unflatten -c 7 qwat_vl.dot | dot -Tpng > qwat_vl.png
