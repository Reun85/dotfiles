#!/usr/bin/env bash

# This is a valid shell script and also a valid Python script. When this file
# is executed as a shell script, it finds a python binary and executes this
# file as a Python script, passing along all of the command line arguments.
# When this file is executed as a Python script, it runs.
# This is useful because we don't know the name of the python binary.

command -v python >/dev/null 2>&1 && exec python "$0" "$@"
command -v python3 >/dev/null 2>&1 && exec python3 "$0" "$@"
command -v python2 >/dev/null 2>&1 && echo "Python2 is not supported."
echo "Python was not found on your system."
# install Python
if ! command -v pacman &>/dev/null; then
	echo "Pacman is not installed on your system. Other package managers are not supported."
	exit 1
else
	read -r -p "Download Python [Y/n]: " confirm && [[ $confirm == "" || $confirm == [yY] || $confirm == [yY][eE][sS] ]] || echo "Stopping execution" && exit 1
	sudo pacman -S python
fi
python scripts/install/install.py
