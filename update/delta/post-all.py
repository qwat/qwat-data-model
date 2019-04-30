from pum.core.deltapy import DeltaPy
import os
import subprocess


class RecreateViewsAndFunctions(DeltaPy):

    def run(self):
        srid = subprocess.check_output("""psql service={} -c "SELECT DISTINCT srid FROM public.geometry_columns 
                                                             WHERE f_table_schema = 'qwat_od'" -q -t -A""".format(self.pg_service), shell=True)

        srid = int(srid)

        self.write_message("Reloading views and functions")

        views_sh = os.path.join(self.delta_dir, '..', '..', 'ordinary_data', 'views',
                                'rewrite_views.sh')
        views_cmd = 'PGSERVICE={} SRID={} {}'.format(
            self.pg_service, srid, views_sh)
        functions_sh = os.path.join(self.delta_dir, '..', '..', 'ordinary_data', 'functions',
                                    'rewrite_functions.sh')
        functions_cmd = 'PGSERVICE={} SRID={} {}'.format(
            self.pg_service, srid, functions_sh)
        os.system(views_cmd)
        os.system(functions_cmd)

        self.write_message("Reloading views and functions: done")
