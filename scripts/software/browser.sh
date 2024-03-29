#!/bin/bash

packages=(
  firefox
  keepassxc # password manager
  syncthing # p2p file synchronization
  signal-desktop
)
pacman -S "${packages[@]}" --noconfirm

aurpackages=(
  opera
)
userdo yay -S "${aurpackages[@]}" --noconfirm


# install Firefox addons
# requiring user interaction

cwd=$(eval pwd)

mkdir /tmp/firefoxaddons
cd /tmp/firefoxaddons

echo -e "\033[1;33m"
echo -e "#################################################"
echo -e "## Installing Firefox addons                  ###"
echo -e "## Click [Add] and close firefox every time   ###"
echo -e "#################################################"
echo -e "\033[0m"
sleep 2

wget https://addons.mozilla.org/firefox/downloads/file/4218010/keepassxc_browser-latest.xpi  
userdo firefox ./keepassxc_browser-latest.xpi
wget https://addons.mozilla.org/firefox/downloads/file/3974897/gnome_shell_integration-latest.xpi
userdo firefox ./gnome_shell_integration-latest.xpi
wget https://addons.mozilla.org/firefox/downloads/file/3990325/catppuccin_mocha_mauve_git-latest.xpi
userdo firefox catppuccin_mocha_mauve_git-latest.xpi
wget https://addons.mozilla.org/firefox/downloads/file/4216633/ublock_origin-latest.xpi
userdo firefox ublock_origin-latest.xpi
wget https://addons.mozilla.org/firefox/downloads/file/4111257/remove_youtube_shorts-latest.xpi
userdo firefox remove_youtube_shorts-latest.xpi
wget https://addons.mozilla.org/firefox/downloads/file/4103800/simple_tab_groups-latest.xpi
userdo firefox simple_tab_groups-latest.xpi
wget https://addons.mozilla.org/firefox/downloads/file/4226958/styl_us-latest.xpi
userdo firefox styl_us-latest.xpi

cd $cwd
rm -r /tmp/firefoxaddons
