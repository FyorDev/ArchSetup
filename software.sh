#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

# Get the non-root username
current_user=$(logname)

packages=(
  firefox
  keepassxc
)
pacman -S "${packages[@]}" --noconfirm

aurpackages=(
  keepass-natmsg
)
sudo -u $current_user yay -S "${aurpackages[@]}" --noconfirm

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
sudo -u $current_user firefox ./keepassxc_browser-latest.xpi
wget https://addons.mozilla.org/firefox/downloads/file/3974897/gnome_shell_integration-latest.xpi
sudo -u $current_user firefox ./gnome_shell_integration-latest.xpi
wget https://addons.mozilla.org/firefox/downloads/file/3990325/catppuccin_mocha_mauve_git-latest.xpi
sudo -u $current_user firefox catppuccin_mocha_mauve_git-latest.xpi
wget https://addons.mozilla.org/firefox/downloads/file/4216633/ublock_origin-latest.xpi
sudo -u $current_user firefox ublock_origin-latest.xpi
wget https://addons.mozilla.org/firefox/downloads/file/4111257/remove_youtube_shorts-latest.xpi
sudo -u $current_user firefox remove_youtube_shorts-latest.xpi

cd $cwd
rm -r /tmp/firefoxaddons
