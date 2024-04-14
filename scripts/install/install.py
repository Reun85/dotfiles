#!/usr/bin/env python

import os
import sys

PROJECT_ROOT_DIRECTORY = os.path.dirname(os.path.realpath(__file__))


path = os.path.join(PROJECT_ROOT_DIRECTORY, "lib", "pyyaml/lib")
sys.path.insert(0, path)

if PROJECT_ROOT_DIRECTORY not in sys.path:
    sys.path.insert(0, PROJECT_ROOT_DIRECTORY)
    os.putenv("PYTHONPATH", PROJECT_ROOT_DIRECTORY)


if __name__ == "__main__":
    from main import main

    main()
