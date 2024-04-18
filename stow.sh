#!/usr/bin/bash
cd -- "$(dirname -- "$0")"
cd ./dots
# pwd
stow -t ~/ */
