#!/bin/bash

current_user=$(logname)

packages=(
  fish tilix man # fish shell, tilix commandline
  vim neovim npm
  ranger # (file explorer in commandline)
  eza zoxide bat # exa (ls replacement), zoxide (cd replacement), bat (cat replacement)
  nerd-fonts neofetch lolcat sl # fun, nerd-fonts terminal symbols
  gnome-tweaks gnome-shell-extensions
  papirus-icon-theme # THEME
)
pacman -S "${packages[@]}" --noconfirm

aurpackages=(
  catppuccin-gtk-theme-mocha # THEME
)
sudo -u $current_user yay -S "${aurpackages[@]}" --noconfirm
