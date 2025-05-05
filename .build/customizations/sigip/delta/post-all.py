import os
import subprocess
from pum.core.deltapy import DeltaPy

class RecreateViews(DeltaPy):

    def run(self):
        self.write_message('Recreating sigip views')

        rewrite_views = os.path.join(self.delta_dir, '..', 'rewrite_views.sh')
        cmd = 'PGSERVICE={} SRID=2056 {}'.format(self.pg_service, rewrite_views)
        self.write_message(cmd)
        subprocess.check_output(cmd, shell=True)

        self.write_message('Recreating sigip views: done')
