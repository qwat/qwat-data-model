from pum.core.deltapy import DeltaPy
import os

class RecreateViewsAndFunctions(DeltaPy):

    def run(self):
        self.write_message("Reloading views and functions")

        views_sh = os.path.join(self.delta_dir, '..', '..', 'ordinary_data', 'views',
                                'rewrite_views.sh')
        views_cmd = 'PGSERVICE=qwat_test SRID=21781 {}'.format(views_sh)
        functions_sh = os.path.join(self.delta_dir, '..', '..', 'ordinary_data', 'functions',
                                    'rewrite_functions.sh')
        functions_cmd = 'PGSERVICE=qwat_test SRID=21781 {}'.format(functions_sh)
        os.system(views_cmd)
        os.system(functions_cmd)

        self.write_message("Reloading views and functions: done")
