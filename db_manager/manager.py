#!/usr/bin/env python

from __future__ import print_function
import argparse
from dumper import Dumper
from upgrader import Upgrader, UpgradesTableNotFoundError
from checker import Checker
import yaml
import os
import psycopg2
import psycopg2.extras


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
        self.backup_file = config['backup_file']

    def run(self):
        upgrader_prod = Upgrader(self.pg_service_prod, self.upgrades_table, self.delta_dir)
        if not upgrader_prod.exists_table_upgrades():
            self.__ask_create_upgrades_table(upgrader_prod)
            self.__set_baseline(self.pg_service_prod, upgrader_prod)

        print('Creating db backup in {}... '.format(self.backup_file), end='')
        dumper = Dumper(self.pg_service_prod, self.backup_file)
        dumper.pg_backup()
        print(Bcolors.OKGREEN + 'OK' + Bcolors.ENDC)

        print('Restoring backup on db_test... ', end='')
        dumper = Dumper(self.pg_service_test, self.backup_file)
        dumper.pg_restore()
        print(Bcolors.OKGREEN + 'OK' + Bcolors.ENDC)

        print('Applying deltas to db_test... ', end='')
        upgrader_test = Upgrader(self.pg_service_test, self.upgrades_table, self.delta_dir)


        upgrader_test.show_info()

        
        upgrader_test.run()
        print(Bcolors.OKGREEN + 'OK' + Bcolors.ENDC)

        print('Creating db_comp with init_qwat.sh... ', end='')
        os.chdir('..')
        os.system('./init_qwat.sh -p {}'.format(self.pg_service_comp))
        print(Bcolors.OKGREEN + 'OK' + Bcolors.ENDC)

        print('Checking db_test with db_comp... ', end='')
        checker = Checker(self.pg_service_test, self.pg_service_comp, silent=False)
        if checker.check_all():
            print(Bcolors.OKGREEN + 'OK' + Bcolors.ENDC)
            print('Applying deltas to db... ', end='')
            #TODO
            #upgrader_prod.run()
            print(Bcolors.OKGREEN + 'OK' + Bcolors.ENDC)
        else:
            print(Bcolors.FAIL + 'FAILED' + Bcolors.ENDC)

    def __ask_create_upgrades_table(self, upgrader):
        print(Bcolors.FAIL + 'Table {} not found in {}'.format(upgrader.upgrades_table, upgrader.connection.dsn) + Bcolors.ENDC)
        print('Do you want to create it now?')

        if self.__confirm(prompt='Create table {} in {}?'.format(upgrader.upgrades_table, upgrader.connection.dsn)):
            upgrader.create_upgrades_table()
            print(Bcolors.OKGREEN + 'Created table  {} in {}'.format(upgrader.upgrades_table, upgrader.connection.dsn) + Bcolors.ENDC)
        else:
            raise UpgradesTableNotFoundError

        # From http://code.activestate.com/recipes/541096-prompt-the-user-for-confirmation/
    def __confirm(self, prompt=None, resp=False):
        """prompts for yes or no response from the user. Returns True for yes and
        False for no.

        'resp' should be set to the default value assumed by the caller when
        user simply types ENTER.

        >>> confirm(prompt='Create Directory?', resp=True)
        Create Directory? [y]|n: 
        True
        >>> confirm(prompt='Create Directory?', resp=False)
        Create Directory? [n]|y: 
        False
        >>> confirm(prompt='Create Directory?', resp=False)
        Create Directory? [n]|y: y
        True

        """

        if prompt is None:
            prompt = 'Confirm'

        if resp:
            prompt = '%s [%s]|%s: ' % (prompt, 'y', 'n')
        else:
            prompt = '%s [%s]|%s: ' % (prompt, 'n', 'y')

        while True:
            ans = raw_input(prompt)
            if not ans:
                return resp
            if ans not in ['y', 'Y', 'n', 'N']:
                print('please enter y or n.')
                continue
            if ans == 'y' or ans == 'Y':
                return True
            if ans == 'n' or ans == 'N':
                return False

    def __set_baseline(self, pg_service, upgrader):
        #TODO docstring

        query = """
                SELECT version FROM qwat_sys.versions
                """

        connection = psycopg2.connect("service={}".format(pg_service))
        cursor = connection.cursor()
        cursor.execute(query)

        version = cursor.fetchone()[0]
        upgrader.set_baseline(version)

class Bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


if __name__ == "__main__":
    """
    Main process
    """

    parser = argparse.ArgumentParser()
    parser.add_argument('-pp', '--pg_service_prod', help='Name of the pg_service related to production db', required=True)
    parser.add_argument('-pt', '--pg_service_test', help='Name of the pg_service related to a test db used to test the '
                        'migration', required=True)
    parser.add_argument('-pc', '--pg_service_comp', help='Name of the pg_service related to a db used to compare the '
                                                  'updated db test with the last version of the db', required=True)

    args = parser.parse_args()

    manager = Manager(args.pg_service_prod, args.pg_service_test, args.pg_service_comp)
    manager.run()
        