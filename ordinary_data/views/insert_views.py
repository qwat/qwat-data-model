import psycopg2
import pathlib
import subprocess
import os

print("Inserting views")

this_dir = pathlib.Path(__file__).parent.absolute()

connection = psycopg2.connect("service={0}".format(os.environ.get("PGSERVICE")))
connection.set_session(autocommit=True)
cursor = connection.cursor()

# schematic
cursor.execute(open(this_dir / "schematic" / "vw_pipe_schema.sql").read().replace(":SRID", os.environ.get("SRID")))

# inheritance
subprocess.run(["python", str(this_dir / "inheritance" / "od_all_inheritance.py"), os.environ.get("PGSERVICE")], check=True, shell=True)

# export
export_dir = this_dir / "export"
cursor.execute(open(export_dir / "vw_consumptionzone.sql").read().replace(":SRID", os.environ.get("SRID")))
cursor.execute(open(export_dir / "vw_protectionzone.sql").read().replace(":SRID", os.environ.get("SRID")))


sql = subprocess.check_output(["python", str(export_dir / "export_installation.py"), os.environ.get("PGSERVICE")], shell=True)
cursor.execute(sql)
sql = subprocess.check_output(["python", str(export_dir / "export_valve.py"), os.environ.get("PGSERVICE")], shell=True)
cursor.execute(sql)
sql = subprocess.check_output(["python", str(export_dir / "export_hydrant.py"), os.environ.get("PGSERVICE")], shell=True)
cursor.execute(sql)
sql = subprocess.check_output(["python", str(export_dir / "export_meter.py"), os.environ.get("PGSERVICE")], shell=True)
cursor.execute(sql)
sql = subprocess.check_output(["python", str(export_dir / "export_part.py"), os.environ.get("PGSERVICE")], shell=True)
cursor.execute(sql)
sql = subprocess.check_output(["python", str(export_dir / "export_pipe.py"), os.environ.get("SRID"), os.environ.get("PGSERVICE")], shell=True)
cursor.execute(sql)
sql = subprocess.check_output(["python", str(export_dir / "export_printmap.py"), os.environ.get("PGSERVICE")], shell=True)
cursor.execute(sql)
sql = subprocess.check_output(["python", str(export_dir / "export_remote.py"), os.environ.get("PGSERVICE")], shell=True)
cursor.execute(sql)
sql = subprocess.check_output(["python", str(export_dir / "export_subscriber.py"), os.environ.get("PGSERVICE")], shell=True)
cursor.execute(sql)
sql = subprocess.check_output(["python", str(export_dir / "export_leak.py"), os.environ.get("PGSERVICE")], shell=True)  # depends on export_pip
cursor.execute(sql)

# draw lines
lines_dir = this_dir / "draw_lines"
cursor.execute(open(lines_dir / "vw_subscriber_pipe_relation.sql").read().replace(":SRID", os.environ.get("SRID")))
cursor.execute(open(lines_dir / "vw_valve_lines.sql").read().replace(":SRID", os.environ.get("SRID")))
cursor.execute(open(lines_dir / "vw_pipe_child_parent.sql").read().replace(":SRID", os.environ.get("SRID")))
