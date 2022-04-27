import psycopg2
import os
import pathlib

print("Rewriting functions")

this_dir = pathlib.Path(__file__).parent.absolute()

connection = psycopg2.connect("service={0}".format(os.environ.get("PGSERVICE")))
connection.set_session(autocommit=True)
cursor = connection.cursor()

for file in os.listdir(this_dir):
    print(f"Rewriting function {file}")
    if not file.endswith(".sql"):
        continue
    cursor.execute(open(this_dir / file).read())

