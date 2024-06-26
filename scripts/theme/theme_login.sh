#!/bin/bash

# set login theme
cd /usr/share/themes/Catppuccin-Mocha-Standard-Mauve-Dark/gnome-shell/
sudo cp /usr/share/backgrounds/gnome/background.png ./background.png

mv ./assets/* ./

cp ${cwd}/data/gnome/gnome-shell-theme.gresource.xml ./

echo -e "\n#lockDialogGroup {\n  background: url(background.png);\n  background-size: cover;\n}" >> gnome-shell.css

glib-compile-resources ./gnome-shell-theme.gresource.xml
cp ./gnome-shell-theme.gresource /usr/share/gnome-shell/
cd ${cwd}
