from pum.core.deltapy import DeltaPy
import pkg_resources
import pathlib
import subprocess
import psycopg2

class DropViews(DeltaPy):

    def run(self):

        version = self.current_db_version

        # This file is played before appliying any delta file.
        # If you have to do or NOT to do some specific work, you must do it there
        # For example, the 1.2.8 version delta contain some specific actions wich require to drop the views before playing them;
        # But we have to drop them only if the current version is 1.2.8 or superior
        if version > pkg_resources.parse_version('1.2.8'):
            self.drop_views()

    def drop_views(self):
        self.write_message("Dropping views")

        connection = psycopg2.connect("service={0}".format(self.pg_service))
        cursor = connection.cursor()


        data_path = pathlib.Path(self.delta_dir) / '..' / '..' / 'ordinary_data'
        dropviews_script = data_path / 'views' / 'drop_views.sql'

        cursor.execute(open(dropviews_script, "r").read())

        connection.commit()
        self.write_message("Dropping views: done")

