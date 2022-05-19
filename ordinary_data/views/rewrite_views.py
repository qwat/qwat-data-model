import psycopg2
import os
import pathlib
import subprocess

print("Rewriting views")

this_dir = pathlib.Path(__file__).parent.absolute()

connection = psycopg2.connect("service={0}".format(os.environ.get("PGSERVICE")))
connection.set_session(autocommit=True)
cursor = connection.cursor()

print("Dropping views")
cursor.execute(open(this_dir / "drop_views.sql").read())

print("Inserting views")
subprocess.run(["python", this_dir /"insert_views.py"], check=True, shell=True)
