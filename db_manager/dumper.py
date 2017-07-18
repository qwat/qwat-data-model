#!/usr/bin/env python
# -*- coding: utf-8 -*-

import argparse
import os
import subprocess
from datetime import date
import psycopg2
import psycopg2.extras

class Dumper():
    """This class is used to dump and restore a Postgres database."""

    def __init__(self, pg_service):
        self.connection = psycopg2.connect("service={}".format(pg_service))

    def __get_dbname(self):
        return self.connection.get_dsn_parameters()['dbname']

    def __get_dbuser(self):
        return self.connection.get_dsn_parameters()['user']

    def __print_connection_info(self):

        cursor = self.connection.cursor()
        cursor.execute('select version() as version '
                       ', current_database() as db '
                       ', current_user as user '
                       ', now()::text as query_time '
                       )
        result = cursor.fetchone()
        print result
        print self.connection.get_dsn_parameters()
        cursor.close()

    def pg_backup(self, file):
        #TODO test on Windows and OSX

        #pg_dump_exe = 'C:\\Program Files\\PostgreSQL\\9.3\\bin\\pg_dump.exe'
        pg_dump_exe = 'pg_dump'

        command = []
        command.append(pg_dump_exe)
        command.append('-Fc')
        command.append('-U')
        command.append(self.__get_dbuser())
        command.append('-f')
        command.append(file)
        command.append(self.__get_dbname())

        try:
            subprocess.check_output(command)

        except:
            #TODO Exception
            print 'pg_dump failed'
            raise SystemExit(1)

    def pg_restore(self, file):
        #TODO
        # TODO test on Windows and OSX

        # pg_restore_exe = 'C:\\Program Files\\PostgreSQL\\9.3\\bin\\pg_restore.exe'
        pg_restore_exe = 'pg_restore'

        command = []
        command.append(pg_restore_exe)
        command.append('-U')
        command.append(self.__get_dbuser())
        command.append('-d')
        command.append(self.__get_dbname())
        command.append(file)

        try:
            subprocess.check_output(command)

        except:
            # TODO exception
            print 'pg_dump failed'
            raise SystemExit(1)


if __name__ == "__main__":
    """
    Main process
    """

    parser = argparse.ArgumentParser()
    parser.add_argument('--pg_service', help='Name of the postgres service')
    args = parser.parse_args()

    if not args.pg_service:
        parser.print_help()
    else:
        db_dumper = Dumper(args.pg_service)
        #db_dumper.pg_backup('/home/mario/tmp/backup_checker1.sql')
        db_dumper.pg_restore('/home/mario/tmp/backup_checker1.sql')

