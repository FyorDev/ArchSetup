#!/bin/bash

packages=(
  neovim
  lazygit # tui for git
  python
  npm
  docker docker-compose
  godot
  rustup # drags in rustc and cargo
  rust-analyzer
  virtualbox-host-modules-arch
  virtualbox-guest-iso
  virtualbox
  qbittorrent
  qmk
)
pacman -S "${packages[@]}" --noconfirm

aurpackages=(
  jetbrains-toolbox
  imhex-bin
  insomnium-bin
  docker-desktop
)
userdo yay -S "${aurpackages[@]}" --noconfirm

# nvim NvChad
userdo git clone https://github.com/NvChad/starter ${user_home}/.config/nvim

# setup rust
userdo rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy
userdo mkdir -p ${user_home}/.config/fish/completions
userdo rustup completions fish > ${user_home}/.config/fish/completions/rustup.fish

# godot
userdo mkdir -p ${user_home}/.config/godot/text_editor_themes
userdo cp ./dotfiles/godot/catppuccin_mocha.tet ${user_home}/.config/godot/text_editor_themes/
