# My dotfiles

Reun's personal dotfiles for arch linux.

- Linux distro: Arch Linux
- Composer: Hyprland(wayland)
- Terminal: kitty
- Shell: zsh
- Code editor: Neovim
  - Neovim configuration: Astronvim

## Switching to Arch Linux

["My experience for what needs to be done to switch to arch linux"](switchtoarch.md)

## Packages

biboti cursor

## Usage

- Using installation script:

  ```bash
  git clone www.github.com/Reun85/dotfiles && cd dotfiles && ./install
  ```

- Ensure that the necessary packages are installed. The list of used packages
  can be found in `config.yaml` under `packages`. The packages are available via
  the paru package manager. Install GNU stow. Inside of the `dots` folder run
  the command:

  ```bash
  stow -t ~/ */
  ```
