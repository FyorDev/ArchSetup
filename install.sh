#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo."
    exit 1
fi

# Get the non-root username
current_user=$(logname)

pacman -S --needed --noconfirm base-devel

su -c "git clone https://aur.archlinux.org/yay.git" "$current_user"

cd yay
sudo -u $current_user makepkg -sii

cd ..
rm -r yay

chmod +x ./gnome-bloat-folder.sh
sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ./gnome-bloat-folder.sh

packages=(
  fish tilix # fish shell, tilix commandline
  mc # mc (midnight commander, file explorer in commandline)
  exa nerd-fonts zoxide # exa (ls replacement), nerd-fonts terminal symbols, zoxide (cd replacement)
  neofetch lolcat sl # fun
  gnome-tweaks gnome-shell-extensions
  papirus-icon-theme # THEME
)
pacman -S "${packages[@]}" --noconfirm

pacman -R gnome-console --noconfirm # ew go away

aurpackages=(
  catppuccin-gtk-theme-mocha # THEME
  gnome-shell-extension-installer
)
sudo -u $current_user yay -S "${aurpackages[@]}" --noconfirm

chmod +x ./gnome-extensions.sh
su -c ./gnome-extensions.sh $current_user

chmod +x ./preferences.sh
sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ./preferences.sh
