#!/usr/bin/env python

import argparse
from dumper import Dumper
from upgrader import Upgrader
from checker import Checker
from datetime import date
import yaml

class Manager():
    """This class is used to managing qwat upgrade procedure."""

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
        # TODO print some output and ask for confirmations

        today = date.today()
        backup_filename = u'pg_dump-{}{}{}.dump'.format(today.year, today.month, today.day)

        #TODO check if we have all we need
        upgrader = Upgrader(self.pg_service_test, self.upgrades_table, self.delta_dir)
        if not upgrader.exists_table_upgrades():
            #TODO
            print 'Table upgrades not found'
            return

        print 'Creating db backup in {}'.format(backup_filename)
        dumper = Dumper(self.pg_service_prod)
        dumper.pg_backup(backup_filename)
        print 'Done'

        print 'Restoring backup on db_test'
        dumper = Dumper(self.pg_service_test)
        dumper.pg_restore(backup_filename)
        print 'Done'

        print 'Applying deltas to db_test'
        upgrader.run()
        print 'Done'

        print 'Creating db_comp with init_qwat.sh'
        # create db_comp with init_qwat.sh
        print 'Done'

        print 'Checking db_test with db_comp'
        checker = Checker(self.pg_service_test, self.pg_service_comp)
        if checker.check_all():
            print 'Check ok, applying deltas to db'
            upgrader = Upgrader(self.pg_service_prod, self.upgrades_table, self.delta_dir)
            #upgrader.run()
            print 'Done'
        else:
            print 'Check not ok'
            #TODO
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
        manager.run()
        