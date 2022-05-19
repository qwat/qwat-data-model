from pum.core.deltapy import DeltaPy
import os
import pathlib
import subprocess
import psycopg2

class RecreateViewsAndFunctions(DeltaPy):

    def run(self):

        this_dir = pathlib.Path(__file__).parent.absolute()

        connection = psycopg2.connect(f"service={self.pg_service}")
        connection.set_session(autocommit=True)
        cursor = connection.cursor()

        self.write_message("Reloading views and functions")

        cursor.execute("SELECT DISTINCT srid FROM public.geometry_columns WHERE f_table_schema = 'qwat_od'")
        srid = str(cursor.fetchone()[0])

        os.environ.update({
            "PGSERVICE": self.pg_service,
            "SRID": srid,
        })
        data_dir = this_dir / '..' / '..' / 'ordinary_data'
        subprocess.run(["python", data_dir / 'views' / 'rewrite_views.py'], check=True, shell=True)
        subprocess.run(["python", data_dir / 'functions' / 'rewrite_functions.py'], check=True, shell=True)

        self.write_message("Reloading views and functions: done")

