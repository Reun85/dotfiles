import os
import string
import subprocess

import yaml

filename = "output.yaml"
newfilename = "new.yaml"

res = subprocess.run(["paru", "-Qe"], capture_output=True)
if res.returncode != 0:
    print("Paru failed! Errors: " + str(res.stderr))
    exit(1)

packages = [x.split(" ")[0] for x in res.stdout.decode("utf-8").split("\n")[:-1]]

read = {}
if os.path.isfile(filename):
    with open(filename, "r") as f:
        read = yaml.safe_load(f)
        read = {x[0]: x[1] for x in read.items() if x[0] in packages}
        packages = [x for x in packages if x not in read.keys()]


newres = {
    x: (
        subprocess.run(["paru", "-Qi", x], capture_output=True)
        .stdout.decode("utf-8")
        .split("\n")[:-2]
    )
    for x in packages
}
with open(newfilename, "w") as f:
    yaml.dump(
        newres,
        f,
    )
res = dict(read)
res.update(newres)

with open(filename, "w") as f:
    yaml.dump(
        res,
        f,
    )
