from pum.core.deltapy import DeltaPy
import os

class RecreateViewsAndFunctions(DeltaPy):

    def run(self):

        delta_dir = self.delta_dir
        """
        SRID=$SRID ./ordinary_data/views/rewrite_views.sh
        SRID=$SRID ./ordinary_data/functions/rewrite_functions.sh
        cd $DIR
        """
        self.write_message("Reloading views and functions")

        export_db = "export PGSERVICE=qwat_test"
        views_sh = "SRID=21781 {}../../ordinary_data/views/rewrite_views.sh".format(self.delta_dir)
        functions_sh = "SRID=21781 {}../../ordinary_data/functions/rewrite_functions.sh".format(self.delta_dir)

        # Execute commands
        os.system(export_db)
        os.system(views_sh)
        os.system(functions_sh)
