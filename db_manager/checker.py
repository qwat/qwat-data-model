#!/usr/bin/env python
# -*- coding: utf-8 -*-

import argparse
import psycopg2
import psycopg2.extras
import difflib

class Checker():
    """This class is used to compare 2 Postgres databases and show the differences."""

    def __init__(self, pg_service1, pg_service2):
        """Constructor
        
        Parameters
        ----------
        pg_service1: string
            The name of the postgres service (defined in pg_service.conf) related to the first db to be compared
        pg_service2: sting
            The name of the postgres service (defined in pg_service.conf) related to the first db to be compared
        """

        self.conn1 = psycopg2.connect("service={0}".format(pg_service1))
        self.cur1 = self.conn1.cursor()

        self.conn2 = psycopg2.connect("service={0}".format(pg_service2))
        self.cur2 = self.conn2.cursor()

    def check_schemas(self):
        query = """SELECT DISTINCT schema_name 
                FROM information_schema.schemata
                WHERE schema_name NOT IN ('information_schema') AND schema_name NOT LIKE 'pg\_%'
                ORDER BY schema_name """

        self.__check_differences(query, 'Schemas diff:')

    def check_tables(self):
        query = """SELECT table_schema, table_name 
                FROM information_schema.tables 
                WHERE table_schema NOT IN ('information_schema') AND table_schema NOT LIKE 'pg\_%' 
                ORDER BY table_schema, table_name"""

        self.__check_differences(query, 'Tables diff:')

    def check_columns(self):
        query = """WITH table_list AS ( 
                SELECT table_schema, table_name 
                FROM information_schema.tables 
                WHERE table_schema NOT IN ('information_schema') AND table_schema NOT LIKE 'pg\_%' 
                ORDER BY table_schema,table_name 
                ) 
                SELECT isc.table_schema, isc.table_name, column_name, column_default, is_nullable, 
                data_type, character_maximum_length::text, numeric_precision::text, 
                numeric_precision_radix::text, datetime_precision::text FROM information_schema.columnS isc,
                table_list tl 
                WHERE isc.table_schema = tl.table_schema 
                AND isc.table_name = tl.table_name 
                ORDER BY isc.table_schema, isc.table_name, column_name"""

        self.__check_differences(query, 'Columns diff:')

    def check_constraints(self):
        query = """ select
                        tc.constraint_name,
                        tc.constraint_schema || '.' || tc.table_name || '.' || kcu.column_name as physical_full_name,
                        tc.constraint_schema,
                        tc.table_name,
                        kcu.column_name,
                        ccu.table_name as foreign_table_name,
                        ccu.column_name as foreign_column_name,
                        tc.constraint_type
                    from information_schema.table_constraints as tc
                    join information_schema.key_column_usage as kcu on (tc.constraint_name = kcu.constraint_name and tc.table_name = kcu.table_name)
                    join information_schema.constraint_column_usage as ccu on ccu.constraint_name = tc.constraint_name
                    ORDER BY tc.constraint_schema, physical_full_name, tc.constraint_name, foreign_table_name, foreign_column_name  """

        self.__check_differences(query, 'Constraints diff:')

    def check_views(self):
        #TODO why replace(view_definition...)?
        query = """
        SELECT table_name, REPLACE(view_definition,'"','')
        FROM INFORMATION_SCHEMA.views
        WHERE table_schema NOT IN ('information_schema') AND table_schema NOT LIKE 'pg\_%' 
        AND table_name not like 'vw_export_%'
        ORDER BY table_schema, table_name"""

        self.__check_differences(query, 'Views diff:')


    def check_sequences(self):
        query = """
        SELECT c.relname
        FROM pg_class c
        WHERE c.relkind = 'S'
        ORDER BY c.relname"""

        self.__check_differences(query, 'Sequences diff:')


    def check_indexes(self):
        query = """
        select
            t.relname as table_name,
            i.relname as index_name,
            a.attname as column_name
        from
            pg_class t,
            pg_class i,
            pg_index ix,
            pg_attribute a
        where
            t.oid = ix.indrelid
            and i.oid = ix.indexrelid
            and a.attrelid = t.oid
            and a.attnum = ANY(ix.indkey)
            and t.relkind = 'r'
            AND t.relname NOT IN ('information_schema') 
            AND t.relname NOT LIKE 'pg\_%' 
        order by
            t.relname,
            i.relname,
            a.attname
        """
        self.__check_differences(query, 'Indexes diff:')
        
    def check_triggers(self):
        #TODO verificare l'altra query dei triggers
        query = """
        WITH trigger_list AS (
            select tgname from pg_trigger
            GROUP BY tgname
        )
        select pp.prosrc, p.relname
        from pg_trigger t, pg_proc pp, trigger_list tl, pg_class p
        where pp.oid = t.tgfoid
            and t.tgname = tl.tgname
            AND t.tgrelid = p.oid
            and  SUBSTR(p.relname, 1, 3) != 'vw_' -- We cannot check for vw_ views, because  they are created after that script
        ORDER BY p.relname, /*t.tgname, */pp.prosrc"""

        self.__check_differences(query, 'Triggers diff:')
        
    def check_functions(self):
        query = """
        SELECT routines.routine_name, parameters.data_type, routines.routine_definition
        FROM information_schema.routines
        JOIN information_schema.parameters ON routines.specific_name=parameters.specific_name
        WHERE routines.specific_schema NOT IN ('information_schema') AND routines.specific_schema NOT LIKE 'pg\_%' 
        ORDER BY routines.routine_name, parameters.data_type, routines.routine_definition, parameters.ordinal_position"""

        self.__check_differences(query, 'Functions diff:')
        
    def check_roles(self):
        query = """
        select n.nspname as rule_schema,
        c.relname as rule_table,
        case r.ev_type
            when '1' then 'SELECT'
            when '2' then 'UPDATE'
            when '3' then 'INSERT'
            when '4' then 'DELETE'
            else 'UNKNOWN'
        end as rule_event
        from pg_rewrite r
        join pg_class c on r.ev_class = c.oid
        left join pg_namespace n on n.oid = c.relnamespace
        left join pg_description d on r.oid = d.objoid
        WHERE n.nspname NOT IN ('information_schema') AND n.nspname NOT LIKE 'pg\_%' 
        ORDER BY n.nspname, c.relname, rule_event"""

        self.__check_differences(query, 'Roles diff:')
        
    def __check_differences(self, query, context=""):
        self.cur1.execute(query)
        records1 = self.cur1.fetchall()

        self.cur2.execute(query)
        records2 = self.cur2.fetchall()

        print context

        #TODO add an option to choose which differences to show
        d = difflib.Differ()
        for line in d.compare(records1, records2):
            if line[0] in ('-', '+'):
                print(line)

        print ""

    def check_all(self):
        #TODO
        pass

if __name__ == "__main__":
    """
    Main process
    """

    parser = argparse.ArgumentParser()
    parser.add_argument('--pg_service1', help='Name of the first postgres service')
    parser.add_argument('--pg_service2', help='Name of the second postgres service')
    args = parser.parse_args()

    if not args.pg_service1 or not args.pg_service2:
        parser.print_help()
    else:
        db_checker = Checker(args.pg_service1, args.pg_service2)
        db_checker.check_schemas()
        db_checker.check_tables()
        db_checker.check_columns()
        db_checker.check_constraints()
        db_checker.check_views()
        db_checker.check_sequences()
        db_checker.check_indexes()
        db_checker.check_triggers()
        db_checker.check_functions()
        db_checker.check_roles()
