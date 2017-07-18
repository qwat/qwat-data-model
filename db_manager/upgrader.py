#!/usr/bin/env python
# -*- coding: utf-8 -*-

import argparse
import re
from os import listdir
from os.path import isfile, join, basename
import psycopg2
import psycopg2.extras
from hashlib import md5

class Upgrader():
    """This class is used to upgrade an existing database using sql delta files.
    
    Stores the info about the upgrade in a table on the database."""

    def __init__(self, pg_service, upgrades_table, dir):
        """Constructor

            Parameters
            ----------
            pg_service: string
                The name of the postgres service (defined in pg_service.conf) related to the db
            upgrades_table: sting
                The name of the table (int the format schema.name) where the information about the upgrades are stored
            dir: string
                The path of the directory where the delta files are stored
        """
        self.connection = psycopg2.connect("service={}".format(pg_service))
        self.cursor = self.connection.cursor()
        self.upgrades_table = upgrades_table
        self.dir = dir

    def run(self):
        deltas = db_upgrader.__get_delta_files()
        for d in deltas:
            print d.get_version(), d.get_name(), d.get_type()
            print 'is_applied',self.__is_applied(d)
            if not self.__is_applied(d):
                self.__run_delta(d)

    def __get_dbname(self):
        """Return the db name."""
        return self.connection.get_dsn_parameters()['dbname']

    def __get_dbuser(self):
        """Return the db user"""
        return self.connection.get_dsn_parameters()['user']

    def __get_delta_files(self):
        """Search for delta files and return a list of Delta objects."""
        files_in_dir = [f for f in listdir(self.dir) if isfile(join(self.dir, f))]

        deltas = []
        for i in files_in_dir:
            file = join(self.dir, i)

            if not Delta.is_valid_delta_name(file):
                continue

            delta = Delta(file)
            deltas.append(delta)

        return sorted(deltas, key = lambda x: (x.get_version(), x.get_type()))

    def __run_delta(self, delta):
        """Execute the delta file on the database"""
        delta_file = open(delta.get_file(), 'r')
        self.cursor.execute(delta_file.read())
        self.connection.commit()

    def show_info(self):
        """Print info about delta file and about already made upgrade"""
        deltas = self.__get_delta_files()
        print 'delta files in dir: ', self.dir
        table = []
        table.append(['Version', 'Name', 'Type', 'Status'])

        for delta in deltas:
            line = []
            line.append(delta.get_version())
            line.append(delta.get_name())
            if delta.get_type() == Delta.PRE:
                line.append('pre')
            elif delta.get_type() == Delta.DELTA:
                line.append('delta')
            elif delta.get_type() == Delta.POST:
                line.append('post')

            if self.__is_applied(delta):
                line.append('Applied')
            else:
                line.append('Pending')

            table.append(line)

        self.__print_table(table)

        print 'Applied upgrade in database'
        # TODO sistemare query senza *
        query = """SELECT 
                version, 
                description,
                type, 
                installed_by, 
                installed_on, 
                success
                FROM {}         
                """.format(self.upgrades_table)

        self.cursor.execute(query)
        records = self.cursor.fetchall()

        table = []
        table.append(['Version', 'Name', 'Type', 'Installed by', 'Installed on', 'Status'])

        for i in records:
            line = []
            line.append(str(i[0]))
            line.append(str(i[1]))
            type = i[2]
            if type == Delta.PRE:
                line.append('pre')
            elif type == Delta.DELTA:
                line.append('delta')
            elif type == Delta.POST:
                line.append('post')
            #TODO temp
            else:
                line.append('typ')

            line.append(str(i[3]))
            line.append(str(i[4]))

            success = str(i[5])
            if success == 'True':
                line.append('Success')
            else:
                line.append('Failed')

            table.append(line)

        self.__print_table(table)

    """Based on https://stackoverflow.com/a/8356620"""
    def __print_table(self, table):
        """Print a list in tabular format"""
        col_width = [max(len(x) for x in col) for col in zip(*table)]
        print "| " + " | ".join("{:{}}".format(x, col_width[i])
                                for i, x in enumerate(table[0])) + " |"
        print "| " + " | ".join("{:{}}".format('-' * col_width[i], col_width[i])
                                for i, x in enumerate(table[0])) + " |"
        for line in table[1:]:
            print "| " + " | ".join("{:{}}".format(x, col_width[i])
                                    for i, x in enumerate(line)) + " |"

    def __is_applied(self, delta):
        """Verifies if delta file is already applied on database
        
        Parameters
        ----------
        delta: Delta object
            The delta object representing the delta file
            
        Returns
        -------
        bool
            True if the delta is already applied on the db, False otherwise 
        """

        query = """
        SELECT id FROM {} 
        WHERE version = '{}' 
            AND checksum = '{}'
            AND success = 'TRUE'
        """.format(self.upgrades_table, delta.get_version(), delta.get_checksum())

        self.cursor.execute(query)
        if self.cursor.fetchone() == None:
            return False
        else:
            return True

    def __update_upgrades_table(self, delta):
        #TODO

        query = """
        INSERT INTO {} (
            --id,
            version,
            description,
            type,
            script,
            checksum,
            installed_by,
            --installed_on,
            execution_time,
            success
        ) VALUES(
            '{}', 
            '{}', 
            '{}',
            '{}',
            '{}',
            '{}',
            1,
            TRUE
        ) """.format(self.upgrades_table, delta.get_version(), delta.get_name(), delta.get_type(), file, delta.get_checksum(), self.__get_dbuser())

        #print query
        self.cursor.execute(query)
        self.connection.commit()

    def __create_upgrades_table(self):
        #TODO forse meglio non farlo qui
        pass

class Delta():
    """This class represent a delta file."""

    PRE = 1
    DELTA = 2
    POST = 3

    @staticmethod
    def is_valid_delta_name(file):
        """Return if a file has a valid name
        
        A delta file name must be:
        delta_x.x.x_ddmmyyyy.sql or 
        delta_x.x.x_ddmmyyyy.sql.post or 
        delta_x.x.x_ddmmyyyy.sql.pre
        
        where x.x.x is the version number and _ddmmyyyy is an optional description, usually representing the date 
        of the delta file
        """
        filename = basename(file)
        pattern = re.compile(r"^(delta_\d+\.\d+\.\d+).*(\.sql\.pre|\.sql|\.sql\.post)$")
        if re.match(pattern, filename):
            return True
        return False

    def __init__(self, file):
        self.file = file
        filename = basename(self.file)
        pattern = re.compile(r"^(delta_)(\d+\.\d+\.\d+)(_*)(.*)(\.sql\.pre|\.sql|\.sql\.post)$")
        self.match = re.match(pattern, filename)

    def get_version(self):
        """Return the version of the delta file."""
        return self.match.group(2)

    def get_name(self):
        """Return the name (description) of the delta file."""
        return self.match.group(4)

    def get_checksum(self):
        """Return the md5 checksum of the delta file."""
        return md5(open(self.file, 'rb').read()).hexdigest()

    def get_type(self):
        """Return the type of the delta file.
        
        Returns
        -------
        type: int
            1 for pre file
            2 for normal delta file
            3 for post file
        """
        ext =  self.match.group(5)

        if ext == '.sql.pre':
            return Delta.PRE
        elif ext == '.sql':
            return Delta.DELTA
        elif ext == '.sql.post':
            return Delta.POST

    def get_file(self):
        return self.file

if __name__ == "__main__":
    """
    Main process
    """

    parser = argparse.ArgumentParser()
    parser.add_argument('--pg_service', help='Name of the postgres service')
    parser.add_argument('--table', help='Version table')
    parser.add_argument('--dir', help='Delta directory')

    args = parser.parse_args()

    if not args.pg_service or not args.table or not args.dir:
        parser.print_help()
    else:
        db_upgrader = Upgrader(args.pg_service, args.table, args.dir)
        db_upgrader.show_info()
