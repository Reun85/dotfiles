import os
import string

import yaml

filename = "toinstall.yaml"
outfilename = "output"

read = {}
if os.path.isfile(filename):
    with open(filename, "r") as f:
        with open(outfilename, "w") as f2:
            read = yaml.safe_load(f)
            read = [x[0] for x in read.items()]
            print(*read, file=f2, sep="\n")
