#!/bin/bash

# variables availabie in sourced scripts 
current_user=$(logname)
user_home=$(eval echo ~$SUDO_USER)
cwd=$(eval pwd)

# dbus matters for dconf
function userdo() {
    sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" $*
}

usage() {
    echo "Usage: $0 [-s]"
    echo "  -s, Install ALL my software"
    exit 1
}

echo "Also install all software? (a lot)?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) run_software=true; break;;
        No ) break;;
    esac
done

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

if ping -c 1 aur.archlinux.org &> /dev/null; then
    echo "aur.archlinux.org is reachable. Proceeding with the script."
else
    echo "Error: Unable to ping aur.archlinux.org. Exiting."
    exit 1
fi

if sudo pacman -Syu --noconfirm; then
    echo "System updated successfully. Proceeding with the script."
else
    echo "Error: Unable to update the system with pacman -Syu. Exiting."
    exit 1
fi

# BEGIN SCRIPT
pacman -S git wget --noconfirm # prerequisites

source ./scripts/setup/root_yay.sh
source ./scripts/setup/root_essentials.sh
source ./scripts/setup/root_wine.sh
userdo ./scripts/setup/user_bloat_app_folder.sh

userdo ./scripts/gnome/user_extensions.sh
userdo ./scripts/gnome/user_preferences.sh

source ./scripts/theme/theme.sh
source ./scripts/theme/theme_login.sh

if [ "$run_software" = true ]; then
  source ./scripts/software/browser.sh
  source ./scripts/software/development.sh
  source ./scripts/software/games.sh
  source ./scripts/software/media.sh
fi

pacman -R gnome-console --noconfirm # ew go away
