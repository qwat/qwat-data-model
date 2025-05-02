#!/usr/bin/env python

# Taken from: https://github.com/opengisch/metaproject/blob/6ce7afa1ccd7c5fb03874318a4f10ce3d063cffe/postgresql/pg_inheritance_view/pg_inheritance_view_recursive.py


import psycopg2
import psycopg2.extras
import yaml


class PGInheritanceViewRecursive():

    def __init__(self, service, definition):

        self.conn = psycopg2.connect("service={0}".format(service))
        self.cur = self.conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        # Read configuration
        self.definition = yaml.safe_load(definition)

        # Recursive process of definition
        self.nbExecution = 0  # Number of executions
        self.processDefinition(self.definition)

    def processDefinition(self, definition):
        # Recursive process to take in account all children, and subchildren.
        # add alias definition to children to have the same data structure than
        # the top level (parent table)
        if 'children' in definition:
            if 'exec_order' in definition:
                if self.nbExecution < definition['exec_order']:
                    self.nbExecution = definition['exec_order']

            for child in definition['children']:
                definition['children'][child]['alias'] = child
                self.processDefinition(definition['children'][child])

        # defines if a item can be inserted in the parent table only (not any
        # sub-type). Default: true.
        definition['allow_parent_only'] = definition[
            'allow_parent_only'] if 'allow_parent_only' in definition else True
        # defines if switching between sub-type is allowed in the merge_view.
        # Default: false
        definition['allow_type_change'] = False
        if 'merge_view' in definition and 'allow_type_change' in definition['merge_view']:
            definition['allow_type_change'] = definition[
                'merge_view']['allow_type_change']

    def executeSql(self, sql):
        try:
            self.cur.execute(sql)
        except psycopg2.ProgrammingError as pe:
            print("Could not execute SQL:")
            print(sql)
            print("Error: {}".format(pe))
        self.conn.commit()

    def getColumns(self, element, childField):
        definitionFieldName = 'table'
        if childField:
            definitionFieldName = 'c_table'
        self.cur.execute("SELECT attname FROM pg_attribute WHERE attrelid = '{0}'::regclass AND attisdropped IS NOT TRUE AND attnum > 0 ORDER BY attnum ASC".format(
            element[definitionFieldName]))
        pg_fields = self.cur.fetchall()
        pg_fields = [field[0] for field in pg_fields]
        pg_fields.remove(element['pkey'])
        return pg_fields

    def column_alter_read(self, element, column, childField):
        definitionFieldName = 'alter'
        if childField:
            definitionFieldName = 'c_alter'
        if definitionFieldName in element and column in element[definitionFieldName] and 'read' in element[definitionFieldName][column]:
            return element[definitionFieldName][column]['read']
        else:
            return None

    def column_alter_write(self, element, column, childField):
        definitionFieldName = 'alter'
        if childField:
            definitionFieldName = 'c_alter'
        if definitionFieldName in element and column in element[definitionFieldName] and 'write' in element[definitionFieldName][column]:
            return element[definitionFieldName][column]['write']
        else:
            return None

    def column_remap(self, element, column):
        if 'remap' in element and column in element['remap']:
            return element['remap'][column]
        else:
            return None

    def join_view_name(self, definition, child, schema_qualified=True):
        name = '{0}.'.format(definition['schema']) if schema_qualified else ''
        name += 'vw_{0}_{1}'.format(definition['alias'], child)
        return name

    def sql_all(self):
        # Get order for sql execution
        self.listExecDefinition = []
        for i in range(1, self.nbExecution + 1):
            definition = self.getDefinitionByExecOrder(
                self.definition, self.listExecDefinition, i)

        sql = ''
        self.trigCodeInsertDict = {}
        self.trigCodeUpdateDict = {}
        self.trigCodeDeleteDict = {}
        self.trigStructInsertDict = {}
        self.trigStructUpdateDict = {}
        self.trigStructDeleteDict = {}

        self.trigCodeMergeInsertDict = {}
        self.trigCodeMergeUpdateDict = {}
        self.trigCodeMergeDeleteDict = {}
        self.trigStructMergeInsertDict = {}
        self.trigStructMergeUpdateDict = {}
        self.trigStructMergeDeleteDict = {}

        self.REPLACE_TAG = "--TO_REPLACE--"

        for definition in self.listExecDefinition:
            sqlViews = ''
            # if 'generate_child_views' in definition and
            # definition['generate_child_views']:
            for child in definition['children']:
                if 'generate_view' in definition['children'][child] and definition['children'][child]['generate_view'] is not True:
                    # We don't generate a view for these
                    pass
                else:
                    sqlViews += self.sql_join_view(definition, child)

            sqlViews += self.sql_merge_view(definition)
            if sqlViews:
              self.executeSql(sqlViews)

            sqlTriggers = ''
            for child in definition['children']:
                # Check if the trigger has to be generated in the child view or the parent view
                # We need to know where the following sql has to be inserted,
                # and to do this, wee need to save the header and footer of the
                # function trigger (and we will fill them later)

                trigHeader = False
                genChild = True
                genParent = False
                sqlInsertTrigger, sqlInsertStructTrigger = self.sql_join_insert_trigger(
                    definition, child, trigHeader, genChild, genParent)
                self.trigCodeInsertDict[child] = sqlInsertTrigger
                self.trigStructInsertDict[child] = sqlInsertStructTrigger

                sqlUpdateTrigger, sqlUpdateStructTrigger = self.sql_join_update_trigger(
                    definition, child, trigHeader, genChild, genParent)
                self.trigCodeUpdateDict[child] = sqlUpdateTrigger
                self.trigStructUpdateDict[child] = sqlUpdateStructTrigger

                sqlDeleteTrigger, sqlDeleteStructTrigger = self.sql_join_delete_trigger(
                    definition, child, trigHeader, genChild, genParent)
                self.trigCodeDeleteDict[child] = sqlDeleteTrigger
                self.trigStructDeleteDict[child] = sqlDeleteStructTrigger

            # We need those for merged views
            sql, sqlStruct = self.sql_merge_insert_trigger(definition, False)
            self.trigCodeMergeInsertDict[definition['alias']] = sql
            self.trigStructMergeInsertDict[definition['alias']] = sqlStruct
            sqlTriggers += sqlStruct.replace(self.REPLACE_TAG, sql)

            sql, sqlStruct = self.sql_merge_update_trigger(definition, False)
            self.trigCodeMergeUpdateDict[definition['alias']] = sql
            self.trigStructMergeUpdateDict[definition['alias']] = sqlStruct
            sqlTriggers += sqlStruct.replace(self.REPLACE_TAG, sql)

            sql, sqlStruct = self.sql_merge_delete_trigger(definition, False)
            self.trigCodeMergeDeleteDict[definition['alias']] = sql
            self.trigStructMergeDeleteDict[definition['alias']] = sqlStruct
            sqlTriggers += sqlStruct.replace(self.REPLACE_TAG, sql)

            if sqlTriggers:
                self.executeSql(sqlTriggers)

            # We also need to store single triggers for root
            if 'isroot' in definition and definition['isroot']:
                trigHeader = False
                genChild = False
                genParent = True

                sqlInsertTrigger, sqlInsertStructTrigger = self.sql_join_insert_trigger(
                    definition, child, trigHeader, genChild, genParent)
                self.trigCodeInsertDict[definition['alias']] = sqlInsertTrigger
                self.trigStructInsertDict[definition[
                    'alias']] = sqlInsertStructTrigger

                sqlUpdateTrigger, sqlUpdateStructTrigger = self.sql_join_update_trigger(
                    definition, child, trigHeader, genChild, genParent)
                self.trigCodeUpdateDict[definition['alias']] = sqlUpdateTrigger
                self.trigStructUpdateDict[definition[
                    'alias']] = sqlUpdateStructTrigger

                sqlDeleteTrigger, sqlDeleteStructTrigger = self.sql_join_delete_trigger(
                    definition, child, trigHeader, genChild, genParent)
                self.trigCodeDeleteDict[definition['alias']] = sqlDeleteTrigger
                self.trigStructDeleteDict[definition[
                    'alias']] = sqlDeleteStructTrigger

        # Now, generate triggers for each view that needs it
        self.hierarchy = []
        self.get_all_hierarchy(self.definition)

        self.sqlTriggers = ""
        self.recursive_triggers(self.definition, 0)
        self.executeSql(self.sqlTriggers)

        # return empty SQL because we now execute it in this code
        sql = ''
        return sql

    def get_all_hierarchy(self, definition, level=1, parents=''):
        trigHere = ''
        if 'trig_here' in definition and definition['trig_here'] is True:
            trigHere = '#t'

        if parents == '':
            parents = definition['alias'] + trigHere
        else:
            parents = parents + ',' + definition['alias'] + trigHere
        self.hierarchy.append(parents)
        if 'children' in definition:
            for child in definition['children']:
                child_def = definition['children'][child]
                self.get_all_hierarchy(child_def, level + 1, parents)

    def get_def_hierarchy(self, alias, trigAssociated):
        gotParents = False
        relatedDef = []
        relatedDefParent = []
        relatedDefChildr = []
        triTag = '#t'
        if trigAssociated:
            # If we arrive here, that means the alias has a trig_here tag
            # associated
            alias = alias + triTag
        for h in self.hierarchy:
            tabHierarchy = h.split(',')
            if alias in tabHierarchy:
                pos = tabHierarchy.index(alias)
                # If it is at the end of a hierarchy, then take all the parents
                # and build the triggers with that (ex: element, node)
                if pos == (len(tabHierarchy) - 1):
                    if gotParents == False:
                        relatedDef = list(tabHierarchy)
                        relatedDefParent = list(tabHierarchy)
                        gotParents = True
                else:
                    # Get the parents
                    if gotParents == False:
                        relatedDef = tabHierarchy[:pos]
                        relatedDefParent = tabHierarchy[:pos]
                        gotParents = True
                    # Check if children has trig_here tag too
                    if tabHierarchy[pos + 1].find(triTag) == -1:
                        # If no, add it to the list
                        relatedDef.append(tabHierarchy[pos + 1])
                        relatedDefChildr.append(tabHierarchy[pos + 1])
        relatedDef = [d.replace(triTag, '') for d in relatedDef]
        relatedDefParent = [d.replace(triTag, '') for d in relatedDefParent]
        relatedDefChildr = [d.replace(triTag, '') for d in relatedDefChildr]
        return relatedDefParent, relatedDefChildr

    def recursive_triggers(self, definition, level):
        if 'children' in definition:
            for child in definition['children']:
                child_def = definition['children'][child]
                child_alias = child_def['alias']
                if 'trig_here' in child_def and child_def['trig_here'] is True:
                    viewname = self.join_view_name(definition, child)
                    # Then generate the trigger at that level, and it must
                    # contains the code of the current def, and the one of the
                    # childrens, and the parent !
                    relatedDefParent, relatedDefChildren = self.get_def_hierarchy(
                        child_alias, True)

                    sqlInsert = ''
                    sqlUpdate = ''
                    sqlDelete = ''

                    # Fill self.sqlTriggers
                    sqlInsert = self.trigStructInsertDict[child_alias]
                    sqlUpdate = self.trigStructUpdateDict[child_alias]
                    sqlDelete = self.trigStructDeleteDict[child_alias]

                    codeToPlace = ''
                    for rd in relatedDefParent:

                        rdParent, rdChildrens = self.get_def_hierarchy(
                            rd, True)

                        if len(rdChildrens) > 0:
                            if rd in self.trigCodeMergeInsertDict:
                                # We need to take code from
                                # trigCodeMergeInsertDict
                                codeToPlace = "{code}\n{replace_code}\n".format(
                                    code=self.trigCodeMergeInsertDict[rd], replace_code=self.REPLACE_TAG)
                                sqlInsert = sqlInsert.replace(
                                    self.REPLACE_TAG, codeToPlace)

                                codeToPlace = "{code}\n{replace_code}\n".format(
                                    code=self.trigCodeMergeUpdateDict[rd], replace_code=self.REPLACE_TAG)
                                sqlUpdate = sqlUpdate.replace(
                                    self.REPLACE_TAG, codeToPlace)

                                # Important, in the case of delete, reverse
                                # order of code
                                codeToPlace = "\n{replace_code}\n{code}".format(
                                    code=self.trigCodeMergeDeleteDict[rd], replace_code=self.REPLACE_TAG)
                                sqlDelete = sqlDelete.replace(
                                    self.REPLACE_TAG, codeToPlace)

                        else:
                            codeToPlace = "{code}\n{replace_code}\n".format(
                                code=self.trigCodeInsertDict[rd], replace_code=self.REPLACE_TAG)
                            sqlInsert = sqlInsert.replace(
                                self.REPLACE_TAG, codeToPlace)

                            codeToPlace = "{code}\n{replace_code}\n".format(
                                code=self.trigCodeUpdateDict[rd], replace_code=self.REPLACE_TAG)
                            sqlUpdate = sqlUpdate.replace(
                                self.REPLACE_TAG, codeToPlace)

                            # Important, in the case of delete, reverse order
                            # of code
                            codeToPlace = "\n{replace_code}\n{code}".format(
                                code=self.trigCodeDeleteDict[rd], replace_code=self.REPLACE_TAG)
                            sqlDelete = sqlDelete.replace(
                                self.REPLACE_TAG, codeToPlace)

                    self.sqlTriggers += "{insert}{update}{delete}".format(
                        insert=sqlInsert, update=sqlUpdate, delete=sqlDelete)

                    self.sqlTriggers += self.sqlTriggers.replace(
                        self.REPLACE_TAG, "")

                self.recursive_triggers(child_def, level)

    def getDefinitionByExecOrder(self, definition, listExecDefinition, order):
        if 'exec_order' in definition and definition['exec_order'] == order:
            listExecDefinition.append(definition)
        elif 'children' in definition:
            for child in definition['children']:
                self.getDefinitionByExecOrder(
                    definition['children'][child], listExecDefinition, order)

    def sql_type(self, definition):
        sql = "DROP TYPE IF EXISTS {0}.{1}_type CASCADE;".format(
            definition['schema'], definition['alias'])
        sql += "\nCREATE TYPE {0}.{1}_type AS ENUM ({2} {3} );\n\n".format(
            definition['schema'],
            definition['alias'],
            #" '{0}',".format(self.definition['alias']) if self.allow_parent_only is True else "",
            " '{0}',".format(definition['alias']) if definition[
                'allow_parent_only'] is True else "",
            ', '.join(["'{0}'".format(child)
                       for child in definition['children']])
        )
        return sql

    def sql_join_view(self, definition, child):
        sql = "CREATE OR REPLACE VIEW {0} AS\n\tSELECT\n".format(
            self.join_view_name(definition, child))

        sql += "\t\t{0}.{1}".format(definition['alias'], definition['pkey'])

        # parent columns
        i = 0
        for element in (definition, definition['children'][child]):
            forChild = False
            if i > 0:
                forChild = True
            for col in self.getColumns(element, forChild):
                col_alter_read = self.column_alter_read(element, col, forChild)
                col_remap = self.column_remap(element, col)
                sql += "\n\t\t, "
                if col_alter_read:
                    sql += "{0}".format(col_alter_read)
                    if not col_remap:
                        sql += " AS {0}".format(col)
                else:
                    sql += "{0}.{1}".format(element['alias'], col)
                if col_remap:
                    sql += " AS {0}".format(col_remap)
            i += 1

        # from tables
        sql += "\n\tFROM {0} {1}\n\tINNER JOIN {2} {3}\n\t\tON {1}.{4} = {3}.{5};\n\n".format(
            definition['children'][child]['c_table'],
            definition['children'][child]['alias'],
            definition['table'],
            definition['alias'],
            definition['children'][child]['pkey'],
            definition['pkey']
        )
        return sql

    def sql_join_insert_trigger(self, definition, child, trig_header, generateChild, generateParent):
        parent_columns = self.getColumns(definition, False)
        child_columns = self.getColumns(definition['children'][child], True)

        functrigger = "{0}.ft_{1}_{2}_insert".format(
            definition['schema'], definition['alias'], child)
        trigger = "tr_{1}_{2}_insert".format(
            definition['schema'], definition['alias'], child)

        sql = ''
        sqlHeader = self.getTriggerHeader(functrigger)
        if trig_header:
            sql = sqlHeader

        # optional code addition
        if 'trigger_pre' in definition:
            sql += definition['trigger_pre'] + '\n'

        # insert into parent
        if generateParent:
            if 'pkey_value_create_entry' in definition and definition['pkey_value_create_entry'] is True:
                # Allow to use function to create entry
                # the function is defined by pkey_value
                # if exists, pkey_value is triggered and will return an ID
                # then, this feature is updated
                sql += "\t\t-- The function creates or gets a parent row.\n"
                sql += "\t\tNEW.{0} := {1};\n".format(
                    definition['pkey'],
                    definition['pkey_value'])
                sql += "\t\t-- If it previously existed with another subtype, it should raise an exception\n"
                sql += "\t\tIF (SELECT _oid IS NOT NULL FROM \n\t\t\t(\n\t\t\t\t{0}\n\t\t\t) AS foo WHERE _oid = NEW.{1}\n\t\t) THEN\n".format(
                    ' UNION\n\t\t\t\t'.join(
                        ['SELECT {0} AS _oid FROM {1}'.format(
                            definition['children'][child]['pkey'],
                            definition['children'][child]['c_table']
                        ) for child in definition['children']]
                    ),
                    definition['pkey']
                )
                sql += "\t\t\tRAISE EXCEPTION 'Cannot insert {0} as {1} since it already has another subtype. ID: %', NEW.{2};\n".format(
                    definition['alias'],
                    child,
                    definition['pkey']
                )
                sql += "\t\tEND IF;\n"
                if 'pkey_value_create_entry_update' in definition and definition['pkey_value_create_entry_update'] is True:
                    sql += "\t\t-- Now update the existing or created feature in parent table\n"
                    sql += "\t\tUPDATE {0} SET\n".format(definition['table'])
                    for col in parent_columns:
                        col_alter_write = self.column_alter_write(
                            definition, col, False)
                        col_remap = self.column_remap(definition, col)

                        sql += "\t\t\t\t{0} = ".format(col)
                        if col_alter_write:
                            sql += '{0}'.format(col_alter_write)
                        elif col_remap:
                            sql += 'NEW.{0}'.format(col_remap)
                        else:
                            sql += 'NEW.{0}'.format(col)
                        sql += ",\n"

                    sql = sql[:-2] + '\n'
                    sql += "\t\t\tWHERE {0} = NEW.{0};\n".format(
                        definition['pkey'])
            else:
                sql += "\t\tINSERT INTO {0} (\n\t\t\t{1}\n\t\t\t{2}\n\t\t) VALUES (\n\t\t\t{3} ".format(
                    definition['table'],
                    definition['pkey'],
                    '\n\t\t\t'.join([", {0}".format(col)
                                     for col in parent_columns]),
                    definition['pkey_value']
                )
                for col in parent_columns:
                    col_alter_write = self.column_alter_write(
                        definition, col, False)
                    col_remap = self.column_remap(definition, col)

                    sql += "\n\t\t\t, "
                    if col_alter_write:
                        sql += '{0}'.format(col_alter_write)
                    elif col_remap:
                        sql += 'NEW.{0}'.format(col_remap)
                    else:
                        sql += 'NEW.{0}'.format(col)

                sql += "\n\t\t) RETURNING {0} INTO NEW.{0};\n".format(definition[
                                                                      'pkey'])

        if generateChild:
            # insert into child
            sql += "\n\t\tINSERT INTO {0} (\n\t\t\t{1}\n\t\t\t{2}\n\t\t) VALUES (\n\t\t\tNEW.{3} ".format(
                definition['children'][child]['c_table'],
                definition['children'][child]['pkey'],
                '\n\t\t\t'.join([", {0}".format(col)
                                 for col in child_columns]),
                definition['pkey']
            )
            for col in child_columns:
                col_alter_write = self.column_alter_write(
                    definition['children'][child], col, True)
                col_remap = self.column_remap(
                    definition['children'][child], col)

                sql += "\n\t\t\t, "
                if col_alter_write:
                    sql += '{0}'.format(col_alter_write)
                elif col_remap:
                    sql += 'NEW.{0}'.format(col_remap)
                else:
                    sql += 'NEW.{0}'.format(col)

            sql += "\n\t\t);\n"

        sqlFooter = ''
        # end trigger function
        sqlFooter += "\t\tRETURN NEW;\n"
        sqlFooter += "\tEND;\n"
        sqlFooter += "\t$$\n"
        sqlFooter += "\tLANGUAGE plpgsql;\n\n"

        # create trigger
        sqlFooter += "DROP TRIGGER IF EXISTS {0} ON {1};\n".format(
            trigger, self.join_view_name(definition, child))
        sqlFooter += "CREATE TRIGGER {0}\n".format(trigger)
        sqlFooter += "\tINSTEAD OF INSERT\n"
        sqlFooter += "\tON {0}\n".format(
            self.join_view_name(definition, child))
        sqlFooter += "\tFOR EACH ROW\n"
        sqlFooter += "\tEXECUTE PROCEDURE {0}();\n\n".format(functrigger)

        if trig_header:
            sql += sqlFooter

        sqlStruct = "{head}\n{replace_code}\n{foot}".format(
            head=sqlHeader, foot=sqlFooter, replace_code=self.REPLACE_TAG)

        return sql, sqlStruct

    def sql_join_update_trigger(self, definition, child, trig_header, generateChild, generateParent):
        parent_columns = self.getColumns(definition, False)
        child_columns = self.getColumns(definition['children'][child], True)

        functrigger = "{0}.ft_{1}_{2}_update".format(
            definition['schema'],    definition['alias'], child)
        trigger = "tr_{1}_{2}_update".format(
            definition['schema'],    definition['alias'], child)

        sql = ''
        sqlHeader = self.getTriggerHeader(functrigger)
        if trig_header:
            sql = sqlHeader

        # optional code addition
        if 'trigger_pre' in definition:
            sql += definition['trigger_pre'] + '\n'

        i = 0

        elements = (definition, definition['children'][child])
        if not generateParent:
            elements = (definition['children'][child],)
            i = 1
        if not generateChild:
            elements = (definition,)

        # for element in (definition, definition['children'][child]):
        for element in elements:
            tableName = element['table']
            if generateChild and 'c_table' in element:
                tableName = element['c_table']

            forChild = False
            if i > 0:
                forChild = True
            cols = self.getColumns(element, forChild)
            if len(cols) > 0:
                sql += "\n\tUPDATE {0} SET".format(tableName)
                for col in cols:
                    col_alter_write = self.column_alter_write(
                        element, col, forChild)
                    col_remap = self.column_remap(element, col)

                    sql += "\n\t\t\t{0} = ".format(col)
                    if col_alter_write:
                        sql += '{0}'.format(col_alter_write)
                    elif col_remap:
                        sql += 'NEW.{0}'.format(col_remap)
                    else:
                        sql += 'NEW.{0}'.format(col)
                    sql += ","

                sql = sql[:-1]  # extra comma
                sql += "\n\t\tWHERE {0} = OLD.{0};\n".format(element['pkey'])
            i += 1

        if generateChild:
            if "custom_update" in definition['children'][child]:
                sql += "\n\t\t{0};".format(definition['children']
                                            [child]['custom_update'])
        if generateParent:
            if "custom_update" in definition:
                sql += "\n\t\t{0};".format(definition['custom_update'])

        sqlFooter = ''
        sqlFooter += "\t\tRETURN NEW;\n"
        sqlFooter += "\tEND;\n"
        sqlFooter += "\t$$\n"
        sqlFooter += "\tLANGUAGE plpgsql;\n\n"

        # create trigger
        sqlFooter += "DROP TRIGGER IF EXISTS {0} ON {1};\n".format(
            trigger, self.join_view_name(definition, child))
        sqlFooter += "CREATE TRIGGER {0}\n".format(trigger)
        sqlFooter += "\tINSTEAD OF UPDATE\n"
        sqlFooter += "\tON {0}\n".format(
            self.join_view_name(definition, child))
        sqlFooter += "\tFOR EACH ROW\n"
        sqlFooter += "\tEXECUTE PROCEDURE {0}();\n\n".format(functrigger)
        if trig_header:
            sql += sqlFooter

        sqlStruct = "{head}\n{replace_code}\n{foot}".format(
            head=sqlHeader, foot=sqlFooter, replace_code=self.REPLACE_TAG)

        return sql, sqlStruct

    def sql_join_delete_trigger(self, definition, child, trig_header, generateChild, generateParent):

        functrigger = "{0}.ft_{1}_{2}_delete".format(
            definition['schema'],    definition['alias'], child)
        trigger = "tr_{1}_{2}_delete".format(
            definition['schema'],    definition['alias'], child)

        sql = ''
        sqlHeader = self.getTriggerHeader(functrigger)
        if trig_header:
            sql = sqlHeader

        if generateChild:
            if "custom_delete" in definition['children'][child]:
                sql += "\n\t\t{0};".format(definition['children']
                                           [child]['custom_delete'])
            else:
                sql += "\n\t\tDELETE FROM {0} WHERE {1} = OLD.{1};".format(
                    definition['children'][child]['c_table'], definition['children'][child]['pkey'])

        if generateParent:
            if "custom_delete" in definition:
                sql += "\n\t\t{0};".format(definition['custom_delete'])
            else:
                sql += "\n\t\tDELETE FROM {0} WHERE {1} = OLD.{1};".format(
                    definition['table'], definition['pkey'])

        sqlFooter = ''
        sqlFooter += "\n\t\tRETURN NULL;\n"
        sqlFooter += "\tEND;\n"
        sqlFooter += "\t$$\n"
        sqlFooter += "\tLANGUAGE plpgsql;\n\n"

        # create trigger
        sqlFooter += "DROP TRIGGER IF EXISTS {0} ON {1};\n".format(
            trigger, self.join_view_name(definition, child))
        sqlFooter += "CREATE TRIGGER {0}\n".format(trigger)
        sqlFooter += "\tINSTEAD OF DELETE\n"
        sqlFooter += "\tON {0}\n".format(
            self.join_view_name(definition, child))
        sqlFooter += "\tFOR EACH ROW\n"
        sqlFooter += "\tEXECUTE PROCEDURE {0}();\n\n".format(functrigger)
        if trig_header:
            sql += sqlFooter

        sqlStruct = "{head}\n{replace_code}\n{foot}".format(
            head=sqlHeader, foot=sqlFooter, replace_code=self.REPLACE_TAG)

        return sql, sqlStruct

    def sql_merge_view(self, definition):
        if 'merge_view' not in definition:
            return ''

        sql = self.sql_type(definition)

        sql += "CREATE OR REPLACE VIEW {0}.{1} AS\n\tSELECT\n\t\tCASE\n".format(
            definition['schema'], definition['merge_view']['name'])
        for child in definition['children']:
            sql += "\t\t\tWHEN {0}.{1} IS NOT NULL THEN '{0}'::{2}.{3}_type\n".format(
                child,
                definition['children'][child]['pkey'],
                definition['schema'],
                definition['alias']
            )
        sql += "\t\t\tELSE '{0}'::{1}.{0}_type\n".format(
            definition['alias'],
            definition['schema']
        )
        sql += "\t\tEND AS {0}_type,\n".format(definition['alias'])
        sql += "\t\t{0}.{1}".format(definition['alias'], definition['pkey'])

        # parent columns
        parent_columns = self.getColumns(definition, False)
        for col in parent_columns:
            col_alter_read = self.column_alter_read(definition, col, False)
            col_remap = self.column_remap(definition, col)
            sql += "\n\t\t, "
            if col_alter_read:
                sql += "{0}".format(col_alter_read)
                if not col_remap:
                    sql += " AS {0}".format(col)
            else:
                sql += "{0}.{1}".format(definition['alias'], col)
            if col_remap:
                sql += " AS {0}".format(col_remap)

        # additional columns
        if 'additional_columns' in definition['merge_view']:
            for col in definition['merge_view']['additional_columns']:
                sql += "\n\t\t, {0} AS {1}".format(
                    definition['merge_view']['additional_columns'][col], col)

        # merge columns
        if 'merge_columns' in definition['merge_view']:
            for column_alias in definition['merge_view']['merge_columns']:
                sql += "\n\t\t, CASE"
                for table_alias in definition['merge_view']['merge_columns'][column_alias]:
                    sql += "\n\t\t\tWHEN {0}.{1} IS NOT NULL THEN {0}.{2}".format(
                        table_alias,
                        definition['children'][table_alias]['pkey'],
                        definition['merge_view']['merge_columns'][
                            column_alias][table_alias]
                    )
                sql += "\n\t\t\tELSE NULL"
                sql += "\n\t\tEND AS {0}".format(column_alias)

        # children tables
        for child in definition['children']:
            child_columns = self.getColumns(
                definition['children'][child], True)
            # remove merged columns
            if 'merge_columns' in definition['merge_view']:
                for column_alias in definition['merge_view']['merge_columns']:
                    for table_alias in definition['merge_view']['merge_columns'][column_alias]:
                        if table_alias == child:
                            child_columns.remove(definition['merge_view'][
                                                 'merge_columns'][column_alias][child])
            # add columns
            for col in child_columns:
                col_alter_read = self.column_alter_read(
                    definition['children'][child], col, True)
                col_remap = self.column_remap(
                    definition['children'][child], col)
                sql += "\n\t\t, "
                if col_alter_read:
                    sql += "{0}".format(col_alter_read)
                    if not col_remap:
                        sql += " AS {0}".format(col)
                else:
                    sql += "{0}.{1}".format(child, col)
                if col_remap:
                    sql += " AS {0}".format(col_remap)

        # from
        sql += "\n\tFROM {0} {1}".format(
            definition['table'], definition['alias'])
        for child in definition['children']:
            sql += "\n\t\tLEFT JOIN {0} {1} ON {2}.{3} = {1}.{4}".format(
                definition['children'][child]['c_table'],
                child,
                definition['alias'],
                definition['pkey'],
                definition['children'][child]['pkey']
            )
        if 'additional_joins' in definition['merge_view']:
            for join in definition['merge_view']['additional_joins']:
                sql += "\n\t\t{0} JOIN {1} {2} ON {3}.{4} = {2}.{5}".format(
                    definition['merge_view']['additional_joins'][join]['type'],
                    definition['merge_view'][
                        'additional_joins'][join]['table'],
                    join,
                    definition['alias'],
                    definition['merge_view']['additional_joins'][join]['fkey'],
                    definition['merge_view']['additional_joins'][join]['key']
                )
        sql += ";\n\n"
        return sql

    def sql_merge_insert_trigger(self, definition, trig_header):
        if 'merge_view' not in definition:
            return '', ''

        parent_columns = self.getColumns(definition, False)

        functrigger = "{0}.ft_{1}_insert".format(
            definition['schema'], definition['merge_view']['name'])
        trigger = "tr_{0}_insert".format(definition['merge_view']['name'])

        sql = ''
        sqlHeader = self.getTriggerHeader(functrigger)
        if trig_header:
            sql = sqlHeader

        # optional code addition
        if 'trigger_pre' in definition:
            sql += definition['trigger_pre'] + '\n'

        # insert into parent
        if 'pkey_value_create_entry' in definition and definition['pkey_value_create_entry'] is True:
            # Allow to use function to create entry
            # the function is defined by pkey_value
            # if exists, pkey_value is triggered and will return an ID
            # then, this feature is updated
            sql += "\t\t-- The function creates or gets a parent row.\n"
            sql += "\t\tNEW.{0} := {1};\n".format(
                definition['pkey'],
                definition['pkey_value'])
            sql += "\t\t-- If it previously existed with another subtype, it should raise an exception\n"
            sql += "\t\tIF (SELECT _oid IS NOT NULL FROM \n\t\t\t(\n\t\t\t\t{0}\n\t\t\t) AS foo WHERE _oid = NEW.{1}\n\t\t) THEN\n".format(
                ' UNION\n\t\t\t\t'.join(
                    ['SELECT {0} AS _oid FROM {1}'.format(
                        definition['children'][child]['pkey'],
                        definition['children'][child]['c_table']
                    ) for child in definition['children']]
                ),
                definition['pkey']
            )
            sql += "\t\t\tRAISE EXCEPTION 'Cannot insert {0} since it already has another subtype. ID: %', NEW.{1};\n".format(
                definition['alias'],
                definition['pkey']
            )
            sql += "\t\tEND IF;\n"
            if 'pkey_value_create_entry' in definition and definition['pkey_value_create_entry'] is True:
                sql += "\t\t-- Now update the existing or created feature in parent table\n"
                sql += "\t\tUPDATE {0} SET\n".format(definition['table'])
                for col in parent_columns:
                    col_alter_write = self.column_alter_write(
                        definition, col, False)
                    col_remap = self.column_remap(definition, col)
                    if not col_remap:
                        col_remap = col

                    sql += "\t\t\t\t{0} = ".format(col)
                    if col_alter_write:
                        sql += '{0}'.format(col_alter_write)
                    elif col_remap:
                        sql += 'NEW.{0}'.format(col_remap)
                    else:
                        sql += 'NEW.{0}'.format(col)
                    sql += ",\n"

                sql = sql[:-2] + '\n'
                sql += "\t\t\tWHERE {0} = NEW.{0};\n".format(
                    definition['pkey'])
        # standard insert
        else:
            sql += "\t\tINSERT INTO {0} (\n\t\t\t{1}\n\t\t\t{2}\n\t\t) VALUES (\n\t\t\t{3} ".format(
                definition['table'],
                definition['pkey'],
                '\n\t\t\t'.join([", {0}".format(col)
                                 for col in parent_columns]),
                definition['pkey_value']
            )
            for col in parent_columns:
                col_alter_write = self.column_alter_write(
                    definition, col, False)
                col_remap = self.column_remap(definition, col)

                sql += "\n\t\t\t, "
                if col_alter_write:
                    sql += '{0}'.format(col_alter_write)
                elif col_remap:
                    sql += 'NEW.{0}'.format(col_remap)
                else:
                    sql += 'NEW.{0}'.format(col)

            sql += "\n\t\t) RETURNING {0} INTO NEW.{0};\n".format(definition[
                                                                  'pkey'])

        # insert into children
        sql += "\n\tCASE"
        for child in definition['children']:
            child_columns = self.getColumns(
                definition['children'][child], True)

            sql += "\n\t\tWHEN NEW.{0}_type::{1}.{0}_type = '{2}'::{1}.{0}_type\n\t\t\tTHEN INSERT INTO {3} (\n\t\t\t\t{4} {5}\n\t\t\t) VALUES (\n\t\t\t\tNEW.{6}".format(
                definition['alias'],
                definition['schema'],
                child,
                definition['children'][child]['c_table'],
                definition['children'][child]['pkey'],
                ''.join(["\n\t\t\t\t, {0}".format(col)
                         for col in child_columns]),
                definition['pkey']
            )

            for col in child_columns:
                col_alter_write = self.column_alter_write(
                    definition['children'][child], col, True)
                col_remap = self.column_remap(
                    definition['children'][child], col)
                if not col_remap:
                    col_remap = col
                    # replace remapped column by merged column alias if exists
                    if 'merge_columns' in definition['merge_view']:
                        for column_alias in definition['merge_view']['merge_columns']:
                            for table_alias in definition['merge_view']['merge_columns'][column_alias]:
                                if table_alias == child:
                                    if col_remap == definition['merge_view']['merge_columns'][column_alias][table_alias]:
                                        col_remap = column_alias
                sql += "\n\t\t\t\t, "
                if col_alter_write:
                    sql += "{0}".format(col_alter_write)
                else:
                    sql += 'NEW.{0}'.format(col_remap)
            sql += "\n\t\t);\n"
        sql += "\n\t\t ELSE NULL;"
        sql += "\n\t END CASE;\n"

        sqlFooter = self.getTriggerFooter(
            definition, trigger, functrigger, 'INSERT', 'NEW')

        if trig_header:
            sql += sqlFooter

        sqlStruct = "{head}\n{replace_code}\n{foot}".format(
            head=sqlHeader, foot=sqlFooter, replace_code=self.REPLACE_TAG)

        return sql, sqlStruct

    def sql_merge_update_trigger(self, definition, trig_header):
        if 'merge_view' not in definition:
            return '', ''

        parent_columns = self.getColumns(definition, False)

        functrigger = "{0}.ft_{1}_update".format(
            definition['schema'], definition['merge_view']['name'])
        trigger = "tr_{0}_update".format(definition['merge_view']['name'])

        sql = ''
        sqlHeader = self.getTriggerHeader(functrigger)
        if trig_header:
            sql = sqlHeader

        # optional code addition
        if 'trigger_pre' in definition:
            sql += definition['trigger_pre'] + '\n'

        # parent columns
        cols = self.getColumns(definition, False)
        if len(cols) > 0:
            sql += "\n\tUPDATE {0} SET".format(definition['table'])
            for col in cols:
                col_alter_write = self.column_alter_write(
                    definition, col, False)
                col_remap = self.column_remap(definition, col)

                sql += "\n\t\t\t{0} = ".format(col)
                if col_alter_write:
                    sql += '{0}'.format(col_alter_write)
                elif col_remap:
                    sql += 'NEW.{0}'.format(col_remap)
                else:
                    sql += 'NEW.{0}'.format(col)
                sql += ","

            sql = sql[:-1]  # extra comma
            sql += "\n\t\tWHERE {0} = OLD.{0};".format(definition['pkey'])

        # do not allow parent only insert
        # if not self.allow_parent_only:
        if not definition['allow_parent_only']:
            sql += "\n\tIF NEW.{0}_type IS NULL THEN".format(definition[
                                                             'alias'])
            sql += "\n\t\tRAISE EXCEPTION 'Insert on {0} only is not allowed.' USING HINT = 'It must have a sub-type.';".format(definition[
                                                                                                                                'alias'])
            sql += "\n\tEND IF;"

        # detect if type has changed
        sql += "\n\t-- detect if type has changed"
        sql += "\n\tIF OLD.{0}_type <> NEW.{0}_type::{1}.{0}_type THEN".format(
            definition['alias'], definition['schema'])
        # allow type change
        if definition['allow_type_change']:
            sql += "\n\t\t-- delete old sub type"
            sql += "\n\t\tCASE"
            for child in definition['children']:
                sql += "\n\t\t\tWHEN OLD.{0}_type::{1}.{0}_type = '{2}'::{1}.{0}_type".format(
                    definition['alias'], definition['schema'], child)
                sql += "\n\t\t\t\tTHEN DELETE FROM {0} WHERE {1} = OLD.{1};".format(
                    definition['children'][child]['c_table'], definition['children'][child]['pkey'])
            sql += "\n\t\t\tELSE NULL;"
            sql += "\n\t\tEND CASE;"
            sql += "\n\t\t-- insert new sub type"
            sql += "\n\t\tCASE"
            for child in definition['children']:
                child_columns = self.getColumns(
                    definition['children'][child], True)
                sql += "\n\t\t\tWHEN NEW.{0}_type::{1}.{0}_type = '{2}'::{1}.{0}_type".format(
                    definition['alias'], definition['schema'], child)
                sql += "\n\t\t\t\tTHEN INSERT INTO {0} (\n\t\t\t\t\t\t{1} {2} \n\t\t\t\t\t) VALUES (\n\t\t\t\t\t\tOLD.{3}".format(
                    definition['children'][child]['c_table'],
                    definition['children'][child]['pkey'],
                    ''.join(["\n\t\t\t\t\t\t, {0}".format(col)
                             for col in child_columns]),
                    definition['pkey']
                )
                for col in child_columns:
                    col_alter_write = self.column_alter_write(
                        definition['children'][child], col, True)
                    col_remap = self.column_remap(
                        definition['children'][child], col)
                    if not col_remap:
                        col_remap = col
                        # replace remapped column by merged column alias if
                        # exists
                        if 'merge_columns' in definition['merge_view']:
                            for column_alias in definition['merge_view']['merge_columns']:
                                for table_alias in definition['merge_view']['merge_columns'][column_alias]:
                                    if table_alias == child:
                                        if col_remap == definition['merge_view']['merge_columns'][column_alias][table_alias]:
                                            col_remap = column_alias
                    sql += "\n\t\t\t\t\t\t, "
                    if col_alter_write:
                        sql += "{0}".format(col_alter_write)
                    else:
                        sql += 'NEW.{0}'.format(col_remap)
                sql += "\n\t\t\t\t\t);"
            sql += "\n\t\t\tELSE NULL;"
            sql += "\n\t\tEND CASE;"
            sql += "\n\t\t-- return now as child has been updated"
            sql += "\n\t\tRETURN NEW;"
        # forbid type change
        else:
            sql += "\n\t\tRAISE EXCEPTION 'Type change not allowed for {0}'".format(definition[
                                                                                    'alias'])
            sql += "\n\t\t\tUSING HINT = 'You cannot switch from ' || OLD.{0}_type || ' to ' || NEW.{0}_type; ".format(definition[
                                                                                                                       'alias'])
        sql += "\n\tEND IF;"

        # update child
        sql += "\n\tCASE"
        for child in definition['children']:
            child_columns = self.getColumns(
                definition['children'][child], True)
            sql += "\n\tWHEN NEW.{0}_type::{1}.{0}_type = '{2}'::{1}.{0}_type\n\t\tTHEN ".format(
                definition['alias'],
                definition['schema'],
                child
            )
            if len(child_columns) == 0:
                sql += "\n\t\tNULL;"
            else:
                sql += "UPDATE {0} SET\n\t\t\t".format(
                    definition['children'][child]['c_table'])
                for col in child_columns:
                    col_alter_write = self.column_alter_write(
                        definition['children'][child], col, True)
                    col_remap = self.column_remap(
                        definition['children'][child], col)
                    if not col_remap:
                        col_remap = col
                        # replace remapped column by merged column alias if
                        # exists
                        if 'merge_columns' in definition['merge_view']:
                            for column_alias in definition['merge_view']['merge_columns']:
                                for table_alias in definition['merge_view']['merge_columns'][column_alias]:
                                    if table_alias == child:
                                        if col_remap == definition['merge_view']['merge_columns'][column_alias][table_alias]:
                                            col_remap = column_alias
                    sql += "{0} = ".format(col)
                    if col_alter_write:
                        sql += "{0}".format(col_alter_write)
                    else:
                        sql += 'NEW.{0}'.format(col_remap)
                    sql += "\n\t\t\t, "
                sql = sql[:-3]
                sql += "WHERE {0} = OLD.{1};".format(definition['children'][child][
                                                     'pkey'], definition['pkey'])
        sql += "\n\t\tELSE NULL;"
        sql += "\n\tEND CASE;\n"

        sqlFooter = self.getTriggerFooter(
            definition, trigger, functrigger, 'UPDATE', 'NEW')

        if trig_header:
            sql += sqlFooter

        sqlStruct = "{head}\n{replace_code}\n{foot}".format(
            head=sqlHeader, foot=sqlFooter, replace_code=self.REPLACE_TAG)

        return sql, sqlStruct

    def sql_merge_delete_trigger(self, definition, trig_header):
        if 'merge_view' not in definition:
            return '', ''

        functrigger = "{0}.ft_{1}_delete".format(
            definition['schema'], definition['merge_view']['name'])
        trigger = "tr_{0}_delete".format(definition['merge_view']['name'])

        sql = ''
        sqlHeader = self.getTriggerHeader(functrigger)
        if trig_header:
            sql = sqlHeader

        sql += "\n\tCASE"
        for child in definition['children']:
            sql += "\n\t\tWHEN OLD.{0}_type::{1}.{0}_type = '{2}'::{1}.{0}_type THEN".format(
                definition['alias'],
                definition['schema'],
                child
            )
            if "custom_delete" in definition['children'][child]:
                sql += "\n\t\t\t{0};".format(definition['children'][
                                             child]['custom_delete'])
            else:
                sql += "\n\t\t\tDELETE FROM {0} WHERE {1} = OLD.{1};".format(
                    definition['children'][child]['c_table'], definition['children'][child]['pkey'])
        sql += "\n\t\tELSE NULL;"
        sql += "\n\tEND CASE;"
        if "custom_delete" in definition:
            sql += "\n\t{0};".format(definition['custom_delete'])
        else:
            sql += "\n\tDELETE FROM {0} WHERE {1} = OLD.{1};".format(
                definition['table'], definition['pkey'])

        sqlFooter = self.getTriggerFooter(
            definition, trigger, functrigger, 'DELETE', 'NULL')

        if trig_header:
            sql += sqlFooter

        sqlStruct = "{head}\n{replace_code}\n{foot}".format(
            head=sqlHeader, foot=sqlFooter, replace_code=self.REPLACE_TAG)

        return sql, sqlStruct

    def getTriggerHeader(self, functrigger):
        sqlHeader = "\nCREATE OR REPLACE FUNCTION {0}()".format(functrigger)
        sqlHeader += "\n\tRETURNS trigger AS"
        sqlHeader += "\n\t$$"
        sqlHeader += "\n\tBEGIN"
        return sqlHeader

    def getTriggerFooter(self, definition, trigger, functrigger, mode, ret):
        sqlFooter = ''
        sqlFooter += "\n\tRETURN {ret};\n".format(ret=ret)
        sqlFooter += "\tEND;\n"
        sqlFooter += "\t$$\n"
        sqlFooter += "\tLANGUAGE plpgsql;\n\n"

        # delete trigger
        sqlFooter += "DROP TRIGGER IF EXISTS {0} ON {1}.{2};\n".format(
            trigger, definition['schema'], definition['merge_view']['name'])
        sqlFooter += "CREATE TRIGGER {0}\n".format(trigger)
        sqlFooter += "\tINSTEAD OF {mode}\n".format(mode=mode)
        sqlFooter += "\tON {0}.{1}\n".format(
            definition['schema'], definition['merge_view']['name'])
        sqlFooter += "\tFOR EACH ROW\n"
        sqlFooter += "\tEXECUTE PROCEDURE {0}();\n\n".format(functrigger)

        return sqlFooter
