#!/bin/bash

current_user=$(logname)

packages=(
  obsidian
  krita
  blender
  obs-studio
)
pacman -S "${packages[@]}" --noconfirm

aurpackages=(
  davinci-resolve # add davinconv for supported formats?
)
sudo -u $current_user yay -S "${aurpackages[@]}" --noconfirm

