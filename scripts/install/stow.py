#!/usr/bin/env python
import os
import subprocess

import config


def stow(conf: config.Config) -> tuple[subprocess.CompletedProcess, list[str]]:
    # Get the configs folder.
    dir_to_stow_in = conf.dots_dir

    # Acquire all directories in there
    dirs_to_stow = os.listdir(dir_to_stow_in)

    for x in conf.ignore_dots:
        dirs_to_stow.remove(x)

    command = ["/usr/bin/env", "stow", "-t", os.path.expanduser("~/")]
    command.extend(dirs_to_stow)
    return (subprocess.run(command, cwd=dir_to_stow_in), dirs_to_stow)


if __name__ == "__main__":
    stow(config.load())
