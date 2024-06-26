#!/bin/bash

# Enable multilib which is required for the wine repository
sudo sed -i ':a;N;$!ba;s@#\[multilib\]\n#Include = \/etc\/pacman.d\/mirrorlist\n@\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist\n@' /etc/pacman.conf

pacman -Syu # install newly added multilib

packages=(
  wine
  wine-mono
  winetricks
)
pacman -S "${packages[@]}" --noconfirm
