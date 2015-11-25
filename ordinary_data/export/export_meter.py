#!/usr/bin/env python


import sys
import psycopg2, psycopg2.extras
import yaml

if len(sys.argv) > 1:
  pg_service = sys.argv[1]
else:
  pg_service = "qwat_test"

definition = yaml.load("""

name: qwat_od.vw_export_meter

from: qwat_od.vw_element_meter

joins:
  district:
    table: qwat_od.district
    fkey: fk_pressurezone
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
