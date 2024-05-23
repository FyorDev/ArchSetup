#!/bin/bash

packages=(
  ntfs-3g # the ntfs filesystem
  fish tilix man rsync # fish shell, tilix commandline
  vim github-cli xclip
  ranger highlight # (file explorer in commandline)
  eza zoxide bat # exa (ls replacement), zoxide (cd replacement), bat (cat replacement)
  nerd-fonts neofetch lolcat sl # fun, nerd-fonts terminal symbols
  gnome-tweaks gnome-shell-extensions
  papirus-icon-theme # THEME
)
pacman -S "${packages[@]}" --noconfirm

aurpackages=(
  catppuccin-gtk-theme-mocha # THEME
)
userdo yay -S "${aurpackages[@]}" --noconfirm
