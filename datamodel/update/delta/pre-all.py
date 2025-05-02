from pum.core.deltapy import DeltaPy
import pkg_resources
import os
import subprocess

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

        drop_sql = os.path.join(self.delta_dir, '..', '..', 'ordinary_data', 'views',
                                'drop_views.sql')
        cmd = 'psql service={} -f {}'.format(self.pg_service, drop_sql)
        self.write_message(cmd)
        subprocess.check_output(cmd, shell=True)

        self.write_message("Dropping views: done")
