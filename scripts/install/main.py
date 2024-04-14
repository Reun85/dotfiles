#!/usr/bin/env python
import shutil
import subprocess

from config import load
from stow import stow


def ensure_paru_and_git_available() -> None:
    pacman = shutil.which("pacman") is not None
    git = shutil.which("git") is not None
    paru = shutil.which("paru") is not None
    if not git and not pacman:
        print(
            "Git is not installed on your system and\
            pacman was not found on your system.\
            Other package managers are not supported.\
            Download git manually and relaunch the program."
        )
        exit(1)

    if not git:
        if input("Download git now [Y/n]: ").lower() in ["", "y", "yes"]:
            subprocess.run(["sudo", "pacman", "-S", "git"])
        else:
            exit(1)
    if not paru and git:
        rep = "https://aur.archlinux.org/paru-bin.git"

        if input(
            "Install Paru? This will clone the source code ("
            + rep
            + ") and build it via makepkg. [Y/n]: "
        ).lower() in ["", "y", "yes"]:
            if subprocess.run(["git", "clone", rep]).returncode != 0:
                print("Failed to clone from repository.")
                exit(1)
            if (
                subprocess.run(
                    ["makepkg", "-si", "--noconfirm"], cwd="./paru-bin"
                ).returncode
                != 0
            ):
                print("Failed to build paru. Try and manually install it.")
                exit(1)

        else:
            print("Stopping execution.")
            exit(1)


def download_packages(conf: dict) -> None:
    pkgs = conf.get("packages")
    if pkgs is None:
        print("No packages were specified in the config file.")
    else:
        pkgs = list(pkgs)
        command = ["/usr/bin/env", "paru", "-S"]
        command.extend(pkgs)
        if input("Download packages. [Y/n]: ").lower() in ["", "y", "yes"]:
            subprocess.run(command)


def main() -> None:
    conf = load()
    ensure_paru_and_git_available()
    # Full system upgrade
    if conf.update and input("Start full system update. [Y/n]: ").lower() in [
        "",
        "y",
        "yes",
    ]:
        if subprocess.run(["paru"]).returncode != 0:
            print("Failed to perform full system update.")
        else:
            print("Successful full system update.")

    # stow dots
    if conf.stow:
        ret = stow(conf)
        if ret[0].returncode != 0:
            print("There was an error stowing dotfiles.")
            exit(1)
        else:
            print('Successfully "stow"-ed all dot files. (' + " ".join(ret[1]) + ")")

    if conf.download_necessary and input("Enable SDDM service. [Y/n]") in [
        "",
        "y",
        "yes",
    ]:
        if subprocess.run(["systemctl", "enable", "sddm"]).returncode == 0:
            print("Successfully enabled SDDM.")
        else:
            print("Failed to enable SDDM")

    # This dont work. :C
    # if not conf.only_dots:
    #     for cmd in conf.shell:
    #         print('Running command: "' + cmd + '".')
    #         print(
    #             "Returncode: " + str(subprocess.run(cmd.split(), shell=True).returncode)
    #         )


if __name__ == "__main__":
    main()
