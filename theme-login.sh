#!/bin/bash

# set login theme
cwd=$(eval pwd)
cd /usr/share/themes/Catppuccin-Mocha-Standard-Mauve-Dark/gnome-shell/
sudo cp /usr/share/backgrounds/gnome/background.png ./background.png

mv ./assets/* ./

cp $cwd/gnome/gnome-shell-theme.gresource.xml ./

cp $cwd/gnome/gnome-shell.css ./

glib-compile-resources ./gnome-shell-theme.gresource.xml
cp ./gnome-shell-theme.gresource /usr/share/gnome-shell/
cd $cwd
