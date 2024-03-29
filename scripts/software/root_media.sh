#!/bin/bash

packages=(
  obsidian
  krita
  inkscape
  blender
  obs-studio
  prusa-slicer
)
pacman -S "${packages[@]}" --noconfirm

aurpackages=(
  xp-pen-tablet
)
sudo -u $current_user yay -S "${aurpackages[@]}" --noconfirm

