#!/bin/bash

# background
mkdir $user_home/.local/share/backgrounds
wget -O $user_home/.local/share/backgrounds/background.png "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/pastel-car.png"
cp $user_home/.local/share/backgrounds/background.png /usr/share/backgrounds/gnome/background.png

# pfp
wget -O $user_home/.local/share/backgrounds/pfp.jpg "https://i.redd.it/fak1zg09u1v61.jpg"

# gtk 4 is weird about shell theme
cp -r /usr/share/themes/Catppuccin-Mocha-Standard-Mauve-Dark/gtk-4.0 $user_home/.config/

# places earlier in sudo part

