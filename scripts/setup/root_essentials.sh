#!/bin/bash

current_user=$(logname)

packages=(
  fish tilix man # fish shell, tilix commandline
  ranger # (file explorer in commandline)
  eza nerd-fonts zoxide # exa (ls replacement), nerd-fonts terminal symbols, zoxide (cd replacement)
  neofetch lolcat sl # fun
  gnome-tweaks gnome-shell-extensions
  papirus-icon-theme # THEME
)
pacman -S "${packages[@]}" --noconfirm

aurpackages=(
  catppuccin-gtk-theme-mocha # THEME
)
sudo -u $current_user yay -S "${aurpackages[@]}" --noconfirm
