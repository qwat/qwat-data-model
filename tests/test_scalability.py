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
import psycopg2, psycopg2.extras
from subprocess import call

TEST_SCRIPT = 'test_scenarii_scalability.model'

def test_scalability(pg_service, nb_iteration):
    conn = psycopg2.connect("service={0}".format(pg_service))
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    _execute_statements(cur, conn, TEST_SCRIPT, nb_iteration)

def _execute_statements(cur, conn, fileName, nb_iteration):

    cp_x1 = 530000
    cp_y1 = 140000
    cp_z1 = 0
    cp_x1b = 530000
    cp_y1b = 140005
    cp_z1b = 0
    cp_x2 = 530000
    cp_y2 = 140010
    cp_z2 = 0
    cp_x3 = 530700
    cp_y3 = 140300
    cp_z3 = 0
    cp_x4 = 530800
    cp_y4 = 140400
    cp_z4 = 0
    cp_x5 = 530900
    cp_y5 = 140500
    cp_z5 = 0

    ip_x1 = 530800
    ip_y1 = 140000
    ip_z1 = 0
    hy_x1 = 530800
    hy_y1 = 140100
    hy_z1 = 0
    hy_x2 = 530800
    hy_y2 = 140210
    hy_z2 = 0

    in_x1 = 531000
    in_y1 = 140000
    in_z1 = 0
    co_x1 = 532000
    co_y1 = 140000
    co_z1 = 0

    del_x1 = 531100
    del_y1 = 140000
    del_z1 = 0
    del_x2 = 531110
    del_y2 = 140000
    del_z2 = 0

    installation_id = 1

    id_cp = 1
    id_node_a = 1
    id_node_b = 2

    for i in range (int(nb_iteration)):
        print "Iteration {nb}".format(nb=i)

        sav_x2 = cp_x2
        sav_y2 = cp_y2

        cp_x2 = cp_x1
        cp_y2 = cp_y1

        #cp_x1 += 10
        #cp_y1 += 10

        if i%2 == 0 :
            cp_x1 = sav_x2 + 10
        else:
            cp_x1 = sav_x2 - 10

        cp_y1 = sav_y2 + 10

        cp_x1b = cp_x1
        cp_y1b = cp_y1 + (cp_y2 - cp_y1)/2

        cp_x3 += 10
        cp_y3 += 10

        cp_x4 += 10
        cp_y4 += 10

        cp_x5 += 10
        cp_y5 += 10

        ip_x1 += 10
        ip_y1 += 10

        hy_x1 += 10
        hy_y1 += 10

        hy_x2 += 10
        hy_y2 += 10

        in_x1 += 10
        in_y1 += 10

        co_x1 += 10
        co_y1 += 10

        id_cp += i
        id_node_a += i*10
        id_node_b += i*10
        installation_id += i*10

        for statement in open(fileName).read().split(";;")[:-1]:
            if statement != '' and statement[:2] != '--':
                # Vars replacement
                statement = statement.replace('ID_CP', str(id_cp));
                statement = statement.replace('ID_NODE_A', str(id_node_a));
                statement = statement.replace('ID_NODE_B', str(id_node_b));
                statement = statement.replace('INSTALLATION_ID', str(installation_id));

                statement = statement.replace('CP_X1B', str(cp_x1b));
                statement = statement.replace('CP_Y1B', str(cp_y1b));
                statement = statement.replace('CP_Z1B', str(cp_z1b));
                statement = statement.replace('CP_X1', str(cp_x1));
                statement = statement.replace('CP_Y1', str(cp_y1));
                statement = statement.replace('CP_Z1', str(cp_z1));
                statement = statement.replace('CP_X2', str(cp_x2));
                statement = statement.replace('CP_Y2', str(cp_y2));
                statement = statement.replace('CP_Z2', str(cp_z2));
                statement = statement.replace('CP_X3', str(cp_x3));
                statement = statement.replace('CP_Y3', str(cp_y3));
                statement = statement.replace('CP_Z3', str(cp_z3));
                statement = statement.replace('CP_X4', str(cp_x4));
                statement = statement.replace('CP_Y4', str(cp_y4));
                statement = statement.replace('CP_Z4', str(cp_z4));
                statement = statement.replace('CP_X5', str(cp_x5));
                statement = statement.replace('CP_Y5', str(cp_y5));
                statement = statement.replace('CP_Z5', str(cp_z5));
                statement = statement.replace('IP_X1', str(ip_x1));
                statement = statement.replace('IP_Y1', str(ip_y1));
                statement = statement.replace('IP_Z1', str(ip_z1));
                statement = statement.replace('HY_X1', str(hy_x1));
                statement = statement.replace('HY_Y1', str(hy_y1));
                statement = statement.replace('HY_Z1', str(hy_z1));
                statement = statement.replace('HY_X2', str(hy_x2));
                statement = statement.replace('HY_Y2', str(hy_y2));
                statement = statement.replace('HY_Z2', str(hy_z2));
                statement = statement.replace('IN_X1', str(in_x1));
                statement = statement.replace('IN_Y1', str(in_y1));
                statement = statement.replace('IN_Z1', str(in_z1));
                statement = statement.replace('CO_X1', str(co_x1));
                statement = statement.replace('CO_Y1', str(co_y1));
                statement = statement.replace('CO_Z1', str(co_z1));
                statement = statement.replace('DEL_X1', str(del_x1));
                statement = statement.replace('DEL_Y1', str(del_y1));
                statement = statement.replace('DEL_Z1', str(del_z1));
                statement = statement.replace('DEL_X2', str(del_x2));
                statement = statement.replace('DEL_Y2', str(del_y2));
                statement = statement.replace('DEL_Z2', str(del_z2));

                res = cur.execute(statement)
                conn.commit()


if __name__ == "__main__":
    """
    Main process
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('--pg_service', help='Name of the qWat pg service')
    parser.add_argument('--nb_iterations', help='Number of iterations to launch')
    args = parser.parse_args()
    if not args.pg_service or not args.nb_iterations:
        parser.print_help()
    else:
        test_scalability(args.pg_service, args.nb_iterations)
