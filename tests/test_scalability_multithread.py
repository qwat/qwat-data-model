#!/usr/bin/python
# coding=UTF-8

"""
Stress the DB by inserting, updating and deleting elements

USAGE
    python test_scalability.py --pg_service qwat_test
"""
import threading
import os
import argparse
import string
import time
import datetime
import psycopg2
import psycopg2.extras
from subprocess import call

TEST_SCRIPT = 'test_scenarii_scalability.model'
OUTPUT_STAT = 'scalability_stats.txt'
OFFSET = 10  # offset in meter to create new objects
OFFSET_ORIGIN = 2000
OFFSET_ID = 10  # offset for new ids
NB_THREADS = 10
threads = []
fileStats = None
startTime = None
endTime = None

origin = {'x': 530000, 'y': 140000}

# Initial values
sqlParams = {
    'cp_x1': 0,
    'cp_y1': 0,
    'cp_z1': 0,
    'cp_px1b': 0,
    'cp_py1b': 5,
    'cp_pz1b': 0,
    'cp_x2': 0,
    'cp_y2': 10,
    'cp_z2': 0,
    'cp_x3': 700,
    'cp_y3': 300,
    'cp_z3': 0,
    'cp_x4': 800,
    'cp_y4': 400,
    'cp_z4': 0,
    'cp_x5': 900,
    'cp_y5': 500,
    'cp_z5': 0,

    'ip_x1': 600,
    'ip_y1': 0,
    'ip_z1': 0,
    'hy_x1': 610,
    'hy_y1': 0,
    'hy_z1': 0,
    'hy_x2': 610,
    'hy_y2': 10,
    'hy_z2': 0,

    'in_x1': 800,
    'in_y1': 0,
    'in_z1': 0,
    'co_x1': 850,
    'co_y1': 0,
    'co_z1': 0,

    'del_x1': 900,
    'del_y1': 0,
    'del_z1': 0,
    'del_x2': 910,
    'del_y2': 0,
    'del_z2': 0,

    'installation_id': 1,

    'id_cp': 1,
    'id_node_a': 1,
    'id_node_b': 2,

    'valve_id': 1
}

# Var list to replace in SQL
varsToReplace = [
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


class ScalabilityThread (threading.Thread):
    #def __init__(self, threadID, name, nbIterations, cur, conn):
    def __init__(self, threadID, name, nbIterations, pgService):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.nbIterations = nbIterations
        self.origin = {'x': origin['x'] + threadID * OFFSET_ORIGIN, 'y': origin['y']}
        self.conn = psycopg2.connect("service={0}".format(pgService))
        self.cur = self.conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

    def run(self):
        print "Starting " + self.name
        _execute_statements(self.cur, self.conn, self.name, self.threadID, self.origin, self.nbIterations)
        print "Exiting " + self.name
        endTime = datetime.datetime.now().time()
        fileStats = open(OUTPUT_STAT, 'a')
        fileStats.write("Process {p} ended at {t}\n".format(t=endTime.isoformat(), p=self.threadID))


def test_scalability(pgService, nbIterations):
    fileStats = open(OUTPUT_STAT, 'w')
    fileStats.write("Nb thread: {nbthreads}\n".format(nbthreads=NB_THREADS))
    fileStats.write("Nb iterations: {nbiterations}\n".format(nbiterations=nbIterations))
    startTime = datetime.datetime.now().time()
    fileStats.write("Process started at {t}\n".format(t=startTime.isoformat()))

    # Create new threads
    for t in range(0, NB_THREADS):
        newThread = ScalabilityThread(t + 1, "Thread-" + str(t + 1), nbIterations, pgService)
        threads.append(newThread)

    # Start Threads
    for t in range(0, NB_THREADS):
        threads[t].start()



def _execute_statements(cur, conn, threadName, threadId, origin, nbIterations):
    count = 1
    p = sqlParams.copy()
    while count < nbIterations:
        print "{tname} - Iteration {nb}".format(tname=threadName, nb=count)

        # Modify values (coords, IDs)
        sav_x2 = origin['x'] + p['cp_x2']
        sav_y2 = origin['y'] + p['cp_y2']

        p['cp_x2'] = origin['x'] + p['cp_x1']
        p['cp_y2'] = origin['y'] + p['cp_y1']

        if count % 2 == 0:
            p['cp_x1'] = sav_x2 + OFFSET
        else:
            p['cp_x1'] = sav_x2 - OFFSET

        p['cp_y1'] = sav_y2 + OFFSET

        p['cp_px1b'] = p['cp_x1']
        p['cp_py1b'] = p['cp_y1'] + (p['cp_y2'] - p['cp_y1']) / 2

        p['cp_x3'] += origin['x'] + OFFSET
        p['cp_y3'] += origin['y'] + OFFSET

        p['cp_x4'] += origin['x'] + OFFSET
        p['cp_y4'] += origin['y'] + OFFSET

        p['cp_x5'] += origin['x'] + OFFSET
        p['cp_y5'] += origin['y'] + OFFSET

        p['ip_x1'] += origin['x'] + OFFSET
        p['ip_y1'] += origin['y'] + OFFSET

        p['hy_x1'] += origin['x'] + OFFSET
        p['hy_y1'] += origin['y'] + OFFSET

        p['hy_x2'] += origin['x'] + OFFSET
        p['hy_y2'] += origin['y'] + OFFSET

        p['in_x1'] += origin['x'] + OFFSET
        p['in_y1'] += origin['y'] + OFFSET

        p['co_x1'] += origin['x'] + OFFSET
        p['co_y1'] += origin['y'] + OFFSET

        p['id_cp'] = threadId * nbIterations + count
        p['id_node_a'] = threadId * nbIterations + count
        p['id_node_b'] = threadId * nbIterations + count
        p['installation_id'] = "{name}_{num}".format(name=threadName, num=threadId * nbIterations + count)
        p['valve_id'] = threadId * nbIterations + count

        for statement in open(TEST_SCRIPT).read().split(";;")[:-1]:
            if statement != '' and statement[:2] != '--':
                # Replace vars in SQL
                for var in varsToReplace:
                    replaceVal = ''
                    if type(p[var.lower()]) != str:
                        replaceVal = str(p[var.lower()])
                    else:
                        replaceVal = p[var.lower()]
                    statement = statement.replace(var, replaceVal)

                try:
                    cur.execute(statement)
                    conn.commit()
                except:
                    print statement
                    print "FAILED ### {tname} - Iteration {nb}".format(tname=threadName, nb=count)

        # Don't forget to reset origin
        origin['x'] = 0
        origin['y'] = 0

        count += 1


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
        test_scalability(args.pg_service, int(args.nb_iterations))
