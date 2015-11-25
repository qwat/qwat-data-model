#!/usr/bin/env python


import sys
import psycopg2, psycopg2.extras
import yaml

if len(sys.argv) > 1:
  pg_service = sys.argv[1]
else:
  pg_service = "qwat_test"

definition = yaml.load("""

name: qwat_od.vw_export_installation

from: qwat_od.vw_element_installation

joins:
  remote:
    table: qwat_vl.remote_type
    fkey: fk_remote
  pressurezone:
    table: qwat_od.pressurezone
    fkey: fk_pressurezone
  precision:
    table: qwat_vl.precision
    fkey: fk_precision
  precisionalti:
    table: qwat_vl.precisionalti
    fkey: fk_precisionalti
  object_reference:
    table: qwat_vl.object_reference
    fkey: fk_object_reference
  distributor:
    table: qwat_od.distributor
    fkey: fk_distributor
  status:
    table: qwat_vl.status
    fkey: fk_status
  folder:
    table: qwat_od.folder
    fkey: fk_folder
  watertype:
    table: qwat_vl.watertype
    fkey: fk_watertype
  source_type:
    table: qwat_vl.source_type
    fkey: fk_source_type
  source_quality:
    table: qwat_vl.source_quality
    fkey: fk_source_quality
  pump_type:
    table: qwat_vl.pump_type
    fkey: fk_pump_type
  pump_operating:
    table: qwat_vl.pump_operating
    fkey: fk_pump_operating
  overflow:
    table: qwat_vl.overflow
    fkey: fk_overflow
  tank_firestorage:
    table: qwat_vl.tank_firestorage
    fkey: fk_tank_firestorage
  cistern1:
    table: qwat_vl.cistern
    fkey: cistern1_fk_type
  cistern2:
    table: qwat_vl.cistern
    fkey: cistern2_fk_type
  pressurecontrol_type:
    table: qwat_vl.pressurecontrol_type
    fkey: fk_pressurecontrol_type
""")

# dot not modify below

conn = psycopg2.connect("service={0}".format(pg_service))
cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

def get_columns(table):
	cur.execute("SELECT attname FROM pg_attribute WHERE attrelid = '{0}'::regclass AND attnum > 0 ORDER BY attnum ASC".format(table))
	pg_fields = cur.fetchall()
	pg_fields = [field[0] for field in pg_fields]
	return pg_fields


sql = """
CREATE OR REPLACE VIEW {0} AS
	SELECT \n\t\t{1}""".format(
		definition['name'],
		'\n\t\t, '.join(['{0}.{1}'.format(definition['from'], col) for col in get_columns(definition['from'])])
		)
	
for join in definition['joins']:
	columns = get_columns(definition['joins'][join]['table'])
	sql += ''.join(['\n\t\t, {0}.{1} AS {0}_{1}'.format(join, col) for col in columns])
	
sql += "\n\tFROM {0}".format(definition['from'])

for join in definition['joins']:
	sql += "\n\t\tLEFT JOIN {0} {1} ON {2}.{3} = {1}.id".format(
		definition['joins'][join]['table'],
		join,
		definition['from'],
		definition['joins'][join]['fkey']
		)
print sql
