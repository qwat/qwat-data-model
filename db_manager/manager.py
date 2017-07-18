#!/usr/bin/env python

import argparse
import psycopg2
import psycopg2.extras
from dumper import Dumper
from upgrader import Upgrader
from checker import Checker

class Manager():

    def __init__(self, pg_service_prod, pg_service_test, pg_service_comp):

        today = date.today()
        database_name = self.__get_dbname()

        #backup_directory = u'C:\\Users\\mario\\Desktop'
        backup_directory = u'/home/mario/tmp'
        backup_filename = u'pg_dump_{0}-{1}{2}{3}.dump'.format(
            database_name, today.year, today.month, today.day)


        dumper = Dumper(pg_service_prod)
        dumper.pg_backup()

        dumper = Dumper(pg_service_test)
        dumper.pg_restore()

        upgrader = Upgrader(pg_service_test, 'qwat_sys.upgrades', '/home/mario/tmp/qwat_upgrade_test_1')
        upgrader.run()

        #create db_comp with init_qwat.sh

        checker = Checker(pg_service_test, pg_service_comp)
        checker.check_all()

        #if check == OK

        upgrader = Upgrader(pg_service_prod, 'qwat_sys.upgrades', '/home/mario/tmp/qwat_upgrade_test_1')
        upgrader.run()

        pass

    def run(self):
        # create db test
        # backup db prod
        # restore backup in db test
        # apply delta to db test
        # create db compare with init_qwat.sh
        # compare db compare with db test
        # if all ok, apply delta (+ pre and post) to db_prod
        pass

if __name__ == "__main__":
    """
    Main process
    """

    parser = argparse.ArgumentParser()
    parser.add_argument('--pg_service_prod', help='Name of the pg_service related to production db')
    parser.add_argument('--pg_service_test', help='Name of the pg_service related to a test db used to test the '
                        'migration')
    parser.add_argument('--pg_service_comp', help='Name of the pg_service related to a db used to compare the '
                                                  'updated db test with the last version of the db')

    args = parser.parse_args()

    if not args.pg_service_prod or not args.pg_service_test or not args.pg_service_comp:
        parser.print_help()
    else:
        manager = Manager(args.pg_service_prod, args.pg_service_test, args.pg_service_comp)