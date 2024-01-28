#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

# Get the non-root username
current_user=$(logname)

chmod +x ./yay.sh
source yay.sh

chmod +x ./gnome-bloat-folder.sh
sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ./gnome-bloat-folder.sh

packages=(
  fish tilix # fish shell, tilix commandline
  ranger # (file explorer in commandline)
  exa nerd-fonts zoxide # exa (ls replacement), nerd-fonts terminal symbols, zoxide (cd replacement)
  neofetch lolcat sl # fun
  gnome-tweaks gnome-shell-extensions
  papirus-icon-theme # THEME
)
pacman -S "${packages[@]}" --noconfirm

aurpackages=(
  catppuccin-gtk-theme-mocha # THEME
)
sudo -u $current_user yay -S "${aurpackages[@]}" --noconfirm

chmod +x ./gnome-extensions.sh
sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ./gnome-extensions.sh

chmod +x ./preferences.sh
sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ./preferences.sh

chmod +x ./theme.sh
source theme.sh

pacman -R gnome-console --noconfirm # ew go away
