from pum.core.deltapy import DeltaPy
import os

class RecreateViewsAndFunctions(DeltaPy):

    def run(self):

        delta_dir = self.delta_dir

        self.write_message("Reloading views and functions")

        views_sh = "PGSERVICE=qwat_test SRID=21781 {}../../ordinary_data/views/rewrite_views.sh".format(self.delta_dir)
        functions_sh = "PGSERVICE=qwat_test SRID=21781 {}../../ordinary_data/functions/rewrite_functions.sh".format(self.delta_dir)

        # Execute commands
        os.system(views_sh)
        os.system(functions_sh)
