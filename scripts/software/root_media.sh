#!/bin/bash

current_user=$(logname)
user_home=$(eval echo ~$SUDO_USER)

packages=(
  obsidian
  krita
  inkscape
  blender
  obs-studio
)
pacman -S "${packages[@]}" --noconfirm

aurpackages=(
  davinci-resolve # add davinconv for supported formats?
  xp-pen-tablet
)
sudo -u $current_user yay -S "${aurpackages[@]}" --noconfirm

mkdir -p $user_home/.config/godot/text_editor_themes
cp ./dotfiles/godot/catppuccin_mocha.tet $user_home/.config/godot/text_editor_themes/

cp ./dotfiles/blender/mocha_mauve.xml $user_home/.config/blender/*/scripts/presets/interface_theme/

