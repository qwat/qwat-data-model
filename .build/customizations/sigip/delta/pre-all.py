import os
from pum.core.deltapy import DeltaPy


class DropViews(DeltaPy):

    def run(self):
        self.write_message('Dropping sigip views')

        drop_sql = os.path.join(self.delta_dir, '..', 'drop_views.sql')
        cmd = 'psql service={} -f {}'.format(self.pg_service, drop_sql)
        self.write_message(cmd)
        os.system(cmd)

        self.write_message('Dropping sigip views: done')

