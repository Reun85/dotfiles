# import argparse
import argparse
import os
import sys
from os.path import isabs
from typing import Any

import yaml


class Config:
    root_dir = ""
    stow = True
    update = True
    download_optional = True
    download_necessary = True
    ignore_dots = set()
    packages = set()
    dots_dir = ""
    only_dots = False
    shell = set()

    def __init__(self, config: dict[str, Any], args: dict[str, Any]):
        # By default if command line arguments are given for a variable,
        # the config file's value is ignored.
        # For variables given here, they will be put inside a single set.
        extendeachother = {"ignore_dots", "packages"}

        for attr in extendeachother:
            if hasattr(self, attr) is False:
                setattr(self, attr, set())
            if (val := args.get(attr)) is not None:
                getattr(self, attr).update(val)
            if (val := config.get(attr)) is not None:
                getattr(self, attr).update(val)

        vals = {x for x in config.keys()}
        vals.update({x for x in args.keys()})
        vals.difference_update(extendeachother)

        for attr in vals:
            if (val := args.get(attr)) is not None or (
                val := config.get(attr)
            ) is not None:
                setattr(self, attr, val)

        # Validate
        if not os.path.isabs(self.dots_dir):
            self.dots_dir = self.root_dir + "/" + self.dots_dir

        if self.stow and self.dots_dir == "":
            raise Exception("There is no dots directory set! Stopping execution")

        if self.only_dots:
            self.update = False
            self.download_optional = False
            self.download_necessary = False


def load(path: str | None = None) -> Config:
    if path is None:
        path = (
            os.path.dirname(
                os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
            )
            + "/config.yaml"
        )
    config = parse_config_file(path)
    config["root_dir"] = os.path.dirname(path)
    args = parse_args()
    config = Config(config, args)

    return config


def parse_config_file(file_path: str) -> dict[str, Any]:
    if os.path.isfile(file_path):
        with open(file_path, "r") as f:
            config = yaml.safe_load(f)
        return config
    return {}


def parse_args() -> dict[str, Any]:
    ap = argparse.ArgumentParser(prog="./install", allow_abbrev=False)
    ap.add_argument(
        "--stow",
        help="Do not copy over dot files.",
        action=argparse.BooleanOptionalAction,
    )
    ap.add_argument(
        "--packages",
        "-p",
        help="Additional packages to download",
        action="extend",
        nargs="+",
        metavar="Packages to download",
        type=str,
    )
    ap.add_argument(
        "--update",
        help="Do not perform system update.",
        action=argparse.BooleanOptionalAction,
    )
    ap.add_argument(
        "--download-optional",
        help="Do not download non necessary packages.",
        action=argparse.BooleanOptionalAction,
        dest="download_optional",
    )
    ap.add_argument(
        "--ignore-dots",
        help="A list of dot files to not stow",
        action="extend",
        nargs="+",
        metavar="Dot files to ignore",
        dest="ignore_dots",
        type=str,
    )
    ap.add_argument(
        "--only-dots",
        help="Do not download non necessary packages.",
        action=argparse.BooleanOptionalAction,
        dest="only_dots",
    )

    opts = vars(ap.parse_args(sys.argv[1::]))
    if opts.get("ignore_dots") is not None and opts.get("stow") is False:
        if input(
            "When no_stow flag is set, ignore_dots values are ignored. Continue? [Y/n]: "
        ) not in ["y", "yes"]:
            print("Stopping execution")
            exit(1)

    return opts
