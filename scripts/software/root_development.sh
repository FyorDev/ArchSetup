#!/bin/bash

current_user=$(logname)

packages=(
  neovim
  lazygit # tui for git
  python
  npm
  postman-bin
  docker docker-compose
  godot
  obsidian
  rustup # drags in rustc and cargo
  rust-analyzer
  virtualbox-host-modules-arch
  virtualbox-guest-iso
  virtualbox
)
pacman -S "${packages[@]}" --noconfirm

aurpackages=(
  jetbrains-toolbox
  imhex-bin
)
sudo -u $current_user yay -S "${aurpackages[@]}" --noconfirm


