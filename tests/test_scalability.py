#!/usr/bin/python
# coding=UTF-8

"""
Stress the DB by inserting, updating and deleting elements

USAGE
    python test_scalability.py --pg_service qwat_test
"""
import os
import argparse
import string
import psycopg2
import psycopg2.extras
from subprocess import call

TEST_SCRIPT = 'test_scenarii_scalability.model'
OFFSET = 10  # offset in meter to create new objects
OFFSET_ID = 10  # offset for new ids


def test_scalability(pg_service, nb_iteration):
    conn = psycopg2.connect("service={0}".format(pg_service))
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    _execute_statements(cur, conn, TEST_SCRIPT, nb_iteration)


def _execute_statements(cur, conn, fileName, nb_iteration):

    # Initial values
    p = {
        'cp_x1': 530000,
        'cp_y1': 140000,
        'cp_z1': 0,
        'cp_px1b': 530000,
        'cp_py1b': 140005,
        'cp_pz1b': 0,
        'cp_x2': 530000,
        'cp_y2': 140010,
        'cp_z2': 0,
        'cp_x3': 530700,
        'cp_y3': 140300,
        'cp_z3': 0,
        'cp_x4': 530800,
        'cp_y4': 140400,
        'cp_z4': 0,
        'cp_x5': 530900,
        'cp_y5': 140500,
        'cp_z5': 0,

        'ip_x1': 530800,
        'ip_y1': 140000,
        'ip_z1': 0,
        'hy_x1': 530800,
        'hy_y1': 140100,
        'hy_z1': 0,
        'hy_x2': 530800,
        'hy_y2': 140210,
        'hy_z2': 0,

        'in_x1': 531000,
        'in_y1': 140000,
        'in_z1': 0,
        'co_x1': 532000,
        'co_y1': 140000,
        'co_z1': 0,

        'del_x1': 531100,
        'del_y1': 140000,
        'del_z1': 0,
        'del_x2': 531110,
        'del_y2': 140000,
        'del_z2': 0,

        'installation_id': 1,

        'id_cp': 1,
        'id_node_a': 1,
        'id_node_b': 2,

        'valve_id': 1
        }

    # Var list to replace in SQL
    vars_to_replace = [
        'ID_CP',
        'ID_NODE_A',
        'ID_NODE_B',
        'INSTALLATION_ID',
        'CP_PX1B',
        'CP_PY1B',
        'CP_PZ1B',
        'CP_X1',
        'CP_Y1',
        'CP_Z1',
        'CP_X2',
        'CP_Y2',
        'CP_Z2',
        'CP_X3',
        'CP_Y3',
        'CP_Z3',
        'CP_X4',
        'CP_Y4',
        'CP_Z4',
        'CP_X5',
        'CP_Y5',
        'CP_Z5',
        'IP_X1',
        'IP_Y1',
        'IP_Z1',
        'HY_X1',
        'HY_Y1',
        'HY_Z1',
        'HY_X2',
        'HY_Y2',
        'HY_Z2',
        'IN_X1',
        'IN_Y1',
        'IN_Z1',
        'CO_X1',
        'CO_Y1',
        'CO_Z1',
        'DEL_X1',
        'DEL_Y1',
        'DEL_Z1',
        'DEL_X2',
        'DEL_Y2',
        'DEL_Z2',
        'VALVE_ID'
    ]

    for i in range(int(nb_iteration)):
        print "Iteration {nb}".format(nb=i)

        # Modify values (coords, IDs)
        sav_x2 = p['cp_x2']
        sav_y2 = p['cp_y2']

        p['cp_x2'] = p['cp_x1']
        p['cp_y2'] = p['cp_y1']

        if i % 2 == 0:
            p['cp_x1'] = sav_x2 + OFFSET
        else:
            p['cp_x1'] = sav_x2 - OFFSET

        p['cp_y1'] = sav_y2 + OFFSET

        p['cp_px1b'] = p['cp_x1']
        p['cp_py1b'] = p['cp_y1'] + (p['cp_y2'] - p['cp_y1']) / 2

        p['cp_x3'] += OFFSET
        p['cp_y3'] += OFFSET

        p['cp_x4'] += OFFSET
        p['cp_y4'] += OFFSET

        p['cp_x5'] += OFFSET
        p['cp_y5'] += OFFSET

        p['ip_x1'] += OFFSET
        p['ip_y1'] += OFFSET

        p['hy_x1'] += OFFSET
        p['hy_y1'] += OFFSET

        p['hy_x2'] += OFFSET
        p['hy_y2'] += OFFSET

        p['in_x1'] += OFFSET
        p['in_y1'] += OFFSET

        p['co_x1'] += OFFSET
        p['co_y1'] += OFFSET

        p['id_cp'] += i
        p['id_node_a'] = i * OFFSET_ID
        p['id_node_b'] = i * OFFSET_ID
        p['installation_id'] = i * OFFSET_ID
        p['valve_id'] = i * OFFSET_ID

        for statement in open(fileName).read().split(";;")[:-1]:
            if statement != '' and statement[:2] != '--':
                # Replace vars in SQL
                for var in vars_to_replace:
                    statement = statement.replace(var, str(p[var.lower()]))

                res = cur.execute(statement)
                conn.commit()


if __name__ == "__main__":
    """
    Main process
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('--pg_service', help='Name of the qWat pg service')
    parser.add_argument('--nb_iterations', help='Number of iterations')
    args = parser.parse_args()
    if not args.pg_service or not args.nb_iterations:
        parser.print_help()
    else:
        test_scalability(args.pg_service, args.nb_iterations)
