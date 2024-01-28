#!/bin/bash

current_user=$(logname)
user_home=$(eval echo ~$SUDO_USER)

# background
mkdir $user_home/.local/share/backgrounds
wget -O $user_home/.local/share/backgrounds/background.png "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/pastel-car.png"
cp $user_home/.local/share/backgrounds/background.png /usr/share/backgrounds/gnome/background.png

# pfp
wget -O $user_home/.local/share/backgrounds/pfp.jpg "https://i.redd.it/fak1zg09u1v61.jpg"

# gtk 4 is weird about shell theme
cp -r /usr/share/themes/Catppuccin-Mocha-Standard-Mauve-Dark/gtk-4.0/ ~/.config/

# places earlier in sudo part

chmod +x ./theme-login.sh
source theme-login.sh

chmod +x ./theme-user.sh
sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ./theme-user.sh
