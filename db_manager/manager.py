#!/usr/bin/env python

import argparse
from dumper import Dumper
from upgrader import Upgrader
from checker import Checker
from datetime import date
import yaml

class Manager():

    def __init__(self, pg_service_prod, pg_service_test, pg_service_comp, config_file='db_manager_config.yaml'):
        self.pg_service_prod = pg_service_prod
        self.pg_service_test = pg_service_test
        self.pg_service_comp = pg_service_comp
        self.config_file = config_file
        self.load_config()

    def load_config(self):
        config = yaml.safe_load(open(self.config_file))
        self.upgrades_table = config['upgrades_table']
        self.delta_dir = config['delta_dir']


    def run(self):
        # create db test
        # backup db prod
        # restore backup in db test
        # apply delta to db test
        # create db compare with init_qwat.sh
        # compare db compare with db test
        # if all ok, apply delta (+ pre and post) to db_prod

        # TODO

        today = date.today()

        backup_filename = u'pg_dump-{1}{2}{3}.dump'.format(today.year, today.month, today.day)

        dumper = Dumper(self.pg_service_prod)
        dumper.pg_backup(backup_filename)

        dumper = Dumper(self.pg_service_test)
        dumper.pg_restore(backup_filename)

        upgrader = Upgrader(self.pg_service_test, self.upgrades_table, self.delta_dir)
        upgrader.run()

        # create db_comp with init_qwat.sh

        checker = Checker(self.pg_service_test, self.pg_service_comp)
        checker.check_all()

        # if check == OK

        upgrader = Upgrader(self.pg_service_prod, self.upgrades_table, self.delta_dir)
        upgrader.run()


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

    #if not args.pg_service_prod or not args.pg_service_test or not args.pg_service_comp:
    #    parser.print_help()
    #else:
    #    manager = Manager(args.pg_service_prod, args.pg_service_test, args.pg_service_comp)
    #    manager.run()

    manager = Manager('a', 'b', 'c')
    manager.load_config()