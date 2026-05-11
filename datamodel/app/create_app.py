#!/usr/bin/env python3
import logging
import os
import re
from argparse import ArgumentParser, BooleanOptionalAction
from pathlib import Path

import psycopg
import yaml
from pum import HookBase
from triggers.set_defaults_and_triggers import set_defaults_and_triggers

logger = logging.getLogger(__name__)


class Hook(HookBase):
    def run_hook(
        self,
        connection: psycopg.Connection,
        SRID: int = 2056,
        lang_code: str = "en",
    ):
        """
        Creates the schema qwat_app for TEKSI QWAT
        :param SRID: the EPSG code for geometry columns.
        :param lang_code: language code for use in modification views.
        """
        self.cwd = Path(__file__).parent.resolve()
        self._connection = connection

        self.variables_sql = {
            "SRID": {
                "value": SRID,
                "type": "number",
            },
            "value_lang": {
                "value": f"value_{lang_code}",
                "type": "identifier",
            },
            "abbr_lang": {
                "value": f"abbr_{lang_code}",
                "type": "identifier",
            },
            "description_lang": {
                "value": f"description_{lang_code}",
                "type": "identifier",
            },
            "display_lang": {
                "value": f"display_{lang_code}",
                "type": "identifier",
            },
            "name_lang": {
                "value": f"name_{lang_code}",
                "type": "identifier",
            },
        }
        self.execute("CREATE SCHEMA qwat_app;")
        self.run_sql_files_in_folder(self.cwd / "sql_functions")

        sql_directories = [
            "view/schematic",
        ]

        for directory in sql_directories:
            abs_dir = self.cwd / directory
            self.run_sql_files_in_folder(abs_dir)

        # run post_all
        self.run_sql_files_in_folder(self.cwd / "post_all")

    @staticmethod
    def load_yaml(file: Path) -> dict[str]:
        """Safely loads a YAML file and ensures it returns a dictionary."""
        file = Path(file)
        if not file.exists():
            raise FileNotFoundError(f"The file {file} does not exist.")

        logger.debug(f"loading yaml {file}")
        with open(file) as f:
            data = yaml.safe_load(f)
            return data if isinstance(data, dict) else {}

    def load_modification(
        self,
        modification_config: set = None,
    ):
        """
        initializes the qwat app schema for usage of a modification
        Args:
            modification_config: modification configuration set
        """

        # load definitions from config
        template_path = modification_config.get("template", None)
        if template_path:
            curr_dir = self.abspath / os.path.dirname(template_path)
            modification_config = self.load_yaml(self.abspath / template_path)
        else:
            curr_dir = ""

        ext_variables = modification_config.get("variables", {})
        sql_vars = self.parse_variables({**self.variables_sql, **ext_variables})

        for sql_file in modification_config.get("sql_files", None):
            logger.debug(f"Running sql file {sql_file}")
            file_name = curr_dir / sql_file.get("file")
            self.run_sql_file(file_name, sql_vars)

        if template_path:
            for key, value in modification_config.get("extra_definitions", {}).items():
                if not self.extra_definitions[key]:
                    self.extra_definitions[key] = curr_dir / value
                    logger.debug(
                        f"altered {key} extra definition to {self.extra_definitions[key]}"
                    )

            for key, value in modification_config.get("simple_joins_yaml", {}).items():
                if not self.simple_joins_yaml[key]:
                    self.simple_joins_yaml[key] = curr_dir / value
                    logger.debug(
                        f"altered {key} simpleJoin definition to {self.simple_joins_yaml[key]}"
                    )

            for key, value in modification_config.get("multiple_inherintances", {}).items():
                if self.multiple_inherintances[key]:
                    self.multiple_inherintances[key] = curr_dir / value
                    logger.debug(
                        f"altered {key} multipleInheritance definition to {self.multiple_inherintances[key]}"
                    )

    def manage_vl(
        self,
        config: set = None,
    ):
        """
        manages activation/deactivation of qwat value list of a modification
        Args:
            config:  configuration set
        """

        # load definitions from config
        template_path = config.get("template", None)
        is_active = config.get("active", False)
        sql_vars = {"activate": {"value": is_active, "type": "literal"}}
        sql_vars = self.parse_variables(sql_vars)
        if template_path:
            curr_dir = os.path.dirname(template_path)
            config = self.load_yaml(template_path)
        else:
            curr_dir = ""

        for sql_file in config.get("reset_vl_files", None):
            file_name = curr_dir / sql_file.get("file")
            self.run_sql_file(file_name, sql_vars)

    def run_sql_file(self, file_path: str, variables: dict = None):
        with open(file_path) as f:
            sql = f.read()
        self.run_sql(sql, variables)

    def run_sql(self, sql: str, variables: dict = None):
        if variables is None:
            variables = {}
        if (
            re.search(r"\{[A-Za-z-_]+\}", sql) and variables
        ):  # avoid formatting if no variables are present
            try:
                sql = psycopg.sql.SQL(sql).format(**variables).as_string(self._connection)

            except IndexError:
                logger.critical(sql)
                raise
        self.execute(sql)

    def run_sql_files_in_folder(self, directory: str):
        files = os.listdir(directory)
        files.sort()
        sql_vars = self.parse_variables(self.variables_sql)
        for file in files:
            filename = os.fsdecode(file)
            if filename.lower().endswith(".sql"):
                logger.debug(f"Running {filename}")
                self.run_sql_file(os.path.join(directory, filename), sql_vars)

    def parse_variables(self, variables: dict) -> dict:
        """Parse variables based on their defined types in the YAML."""
        formatted_vars = {}

        for key, meta in variables.items():
            if isinstance(meta, dict) and "value" in meta and "type" in meta:
                value, var_type = meta["value"], meta["type"].lower()

                if var_type == "number":  # Directly insert SQL without escaping
                    if isinstance(value, float) or isinstance(value, int):
                        formatted_vars[key] = psycopg.sql.SQL(f"{value}")
                    else:  # avoid injection
                        raise ValueError(f"Value '{value}' is not float or int.")
                elif var_type == "identifier":  # Table/Column names
                    if not re.match(r"^[a-zA-Z_][a-zA-Z0-9_]*$", value):  # avoid injection
                        raise ValueError(f"Identifier '{value}' contains invalid characters.")
                    formatted_vars[key] = psycopg.sql.Identifier(value)
                elif var_type == "literal":  # String/Number literals
                    formatted_vars[key] = psycopg.sql.Literal(value)
                else:
                    raise ValueError(f"Unknown type '{var_type}' for variable '{key}'")
            else:
                raise ValueError(f"Unknown type '{var_type}' for variable '{key}'.")
        return formatted_vars


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("-p", "--pg_service", help="postgres service")
    parser.add_argument(
        "-s", "--srid", help="SRID EPSG code, defaults to 2056", type=int, default=2056
    )
    parser.add_argument(
        "-d",
        "--drop-schema",
        help="Drops cascaded any existing qwat_app schema",
        default=False,
        action=BooleanOptionalAction,
    )
    parser.add_argument(
        "-c",
        "--modification_ci",
        action="store_true",
        default=False,
        help="load ci modification",
    )
    parser.add_argument(
        "-w",
        "--webgis",
        action="store_true",
        default=False,
        help="load webGIS modification",
    )
    parser.add_argument(
        "-l",
        "--lang_code",
        help="language code",
        type=str,
        default="en",
        choices=["en", "fr", "de", "it", "ro"],
    )
    parser.add_argument("-m", "--modification_yaml", help="path to modification yaml", type=Path)
    args = parser.parse_args()

    with psycopg.connect(service=args.pg_service) as connection:
        if args.drop_schema:
            connection.execute("DROP SCHEMA IF EXISTS qwat_app CASCADE;")
        hook = Hook()
        hook.run_hook(
            connection=connection,
            SRID=args.srid,
            modification_ci=args.modification_ci,
            webgis=args.webgis,
            modification_yaml=args.modification_yaml,
            lang_code=args.lang_code,
        )
