#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

# Get the non-root username
current_user=$(logname)

./yay.sh

sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ./gnome-bloat-folder.sh

packages=(
  fish tilix man # fish shell, tilix commandline
  ranger # (file explorer in commandline)
  eza nerd-fonts zoxide # exa (ls replacement), nerd-fonts terminal symbols, zoxide (cd replacement)
  neofetch lolcat sl # fun
  gnome-tweaks gnome-shell-extensions
  papirus-icon-theme # THEME
)
pacman -S "${packages[@]}" --noconfirm

aurpackages=(
  catppuccin-gtk-theme-mocha # THEME
)
sudo -u $current_user yay -S "${aurpackages[@]}" --noconfirm

sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ./gnome-extensions.sh

sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ./preferences.sh

./theme.sh

pacman -R gnome-console --noconfirm # ew go away
