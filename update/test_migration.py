#!/usr/bin/python
# coding=UTF-8

"""
Ensure the model is conform after an upgrade

USAGE
    test_migration.py --pg_service qwat
"""
import os
import argparse
import string
import psycopg2, psycopg2.extras
from subprocess import call

TEST_SCRIPT = 'test_migration.sql'

def test_migration(pg_service, diff_exe):
    conn = psycopg2.connect("service={0}".format(pg_service))
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    _execute_statements(cur, TEST_SCRIPT, diff_exe)

def _execute_statements(cur, fileName, diff_exe):

    buffer_expected = ''
    with open('test_migration.expected.sql', 'r') as content_file:
        buffer_expected = content_file.read()

    lines = []

    for statement in open(fileName).read().split(";;")[:-1]:
        statement = statement.replace('COPY (','')
        statement = statement.replace(') TO STDOUT WITH CSV FORCE QUOTE *','')

        cur.execute(statement)
        rows = cur.fetchall()
        for row in rows:
            converted_row = []
            for item in row:
                if not item:
                    converted_item = ''
                else:
                    converted_item = '"' + item + '"'
                converted_row.append(converted_item)

            line = ','.join(converted_row)
            lines.append(line)

    f = open('output.sql','w')
    buffer = '\n'.join(lines)
    buffer += '\n'  # Need to add a final \n
    f.write(buffer)
    f.close()

    # Compare result to expected result
    if buffer == buffer_expected:
        print 'DataModel is OK'
    else:
        print 'DataModel is NOT conform'
        # For debug purposes
        #print "=========================================================================="
        #print buffer_expected.replace('%','')
        #print "--------------------------------------------------------------------------"
        #print buffer.replace('%','')
        #print ".........................................................................."
        print 'Diff:'
        os.system('{diff} -U 0 --ignore-all-space --ignore-blank-lines test_migration.expected.sql output.sql'.format(diff=diff_exe))

if __name__ == "__main__":
    """
    Main process for testing delta
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('--pg_service', help='Name of the qWat pg service')
    parser.add_argument('--diff_exe', help='Path of your diff executable, default is "diff"')
    args = parser.parse_args()
    if not args.pg_service:
        parser.print_help()
    else:
        diff_exe = 'diff'
        if args.diff_exe:
            diff_exe = args.diff_exe
        test_migration(args.pg_service, diff_exe)
