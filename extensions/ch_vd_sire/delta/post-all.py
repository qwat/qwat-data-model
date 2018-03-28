import os
from pum.core.deltapy import DeltaPy

class RecreateViews(DeltaPy):

    def run(self):
        self.write_message('Recreating ch_vd_sire views')

        rewrite_views = os.path.join(self.delta_dir, '..', 'rewrite_views.sh')
        cmd = 'PGSERVICE={} SRID=21781 {}'.format(self.pg_service, rewrite_views)
        self.write_message(cmd)
        os.system(cmd)

        self.write_message('Recreating ch_vd_sire views: done')
