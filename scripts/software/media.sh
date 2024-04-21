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
userdo yay -S "${aurpackages[@]}" --noconfirm

# blender theme
echo -e "\033[1;33m"
echo -e "#################################################"
echo -e "## Generating Blender version folder          ###"
echo -e "## Just exit Blender                          ###"
echo -e "#################################################"
echo -e "\033[0m"
sleep 2

userdo blender
userdo blenderfolder=$(ls -d ${user_home}/.config/blender/*/ | head -n 1 | xargs -n 1 basename)
userdo mkdir -p ${user_home}/.config/blender/${blenderfolder}/scripts/presets/interface_theme/
userdo cp ./dotfiles/blender/mocha_mauve.xml ${user_home}/.config/blender/*/scripts/presets/interface_theme/
