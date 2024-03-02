#!/bin/bash

current_user=$(logname)

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
sudo -u $current_user yay -S "${aurpackages[@]}" --noconfirm


