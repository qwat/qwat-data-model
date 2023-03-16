import os
import subprocess
from pum.core.deltapy import DeltaPy


class DropViews(DeltaPy):

    def run(self):
        self.write_message('Dropping sigip views')

        drop_sql = os.path.join(self.delta_dir, '..', 'drop_views.sql')
        cmd = 'psql service={} -f {}'.format(self.pg_service, drop_sql)
        self.write_message(cmd)
        subprocess.check_output(cmd, shell=True)

        self.write_message('Dropping sigip views: done')

