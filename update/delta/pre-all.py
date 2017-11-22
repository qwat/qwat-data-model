from pum.core.deltapy import DeltaPy
import os

class DropViews(DeltaPy):

    def run(self):

        version = self.current_db_version

        # This file is played before appliying any delta file.
        # If you have to do or NOT to do some specific work, you must do it there
        # For example, the 1.2.8 version delta contain some specific actions wich require to drop the views before playing them;
        # But we have to drop them only if the current version is 1.2.8 or superior
        if version > '1.2.8':
            self.drop_views()

    def drop_views(self):
        drop_sql = "{}../../ordinary_data/views/drop_views.sql".format(self.delta_dir)
        pg = self.pg_service

        self.write_message("Dropping views")

        # Compose command
        cmd = 'psql "service = {pg}" -f {drop_sql}'.format(pg=pg, drop_sql=drop_sql)
        self.write_message(cmd)

        # Execute command
        os.system(cmd)
        self.write_message("Dropping views: done")
