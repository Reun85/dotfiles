import re
import subprocess
import typing


def run(cmd: list[str] | str, capture_output: typing.Any | None = None):
    if cmd is str:
        cmd = re.findall(r'[^"\s]+|"[^"]*"', cmd)
