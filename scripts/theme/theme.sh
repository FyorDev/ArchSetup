#!/bin/bash

# background
mkdir ${user_home}/.local/share/backgrounds
wget -O ${user_home}/.local/share/backgrounds/background.png "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/pastel-car.png"
cp ${user_home}/.local/share/backgrounds/background.png /usr/share/backgrounds/gnome/background.png

# pfp
wget -O ${user_home}/.local/share/backgrounds/pfp.jpg "https://i.redd.it/fak1zg09u1v61.jpg"

# gtk 4 is weird about shell theme
cp -r /usr/share/themes/Catppuccin-Mocha-Standard-Mauve-Dark/gtk-4.0 ${user_home}/.config/

# set user theme config

userdo dconf write /org/gnome/shell/extensions/user-theme/name "'Catppuccin-Mocha-Standard-Mauve-Dark'"
userdo dconf write /org/gnome/desktop/interface/gtk-theme "'Catppuccin-Mocha-Standard-Mauve-Dark'"
userdo dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
userdo dconf write /org/gnome/desktop/interface/icon-theme "'Papirus-Dark'"

userdo dconf write /org/gnome/desktop/background/picture-uri-dark "'file:///home/${current_user}/.local/share/backgrounds/background.png'"
userdo dconf write /org/gnome/desktop/scrrsteensaver/picture-uri "'file:///home/${current_user}/.local/share/backgrounds/background.png'"
