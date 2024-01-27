#!/bin/bash

current_user=$(logname)
user_home=$(eval echo ~$SUDO_USER)

# background
wget -O $user_home/.local/share/backgrounds/background.png "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/pastel-car.png"
cp $user_home/.local/share/backgrounds/background.png /usr/share/backgrounds/gnome/background.png

# pfp
wget -O $user_home/.local/share/backgrounds/pfp.jpg "https://i.redd.it/fak1zg09u1v61.jpg"

# gtk 4 is weird about shell theme
cp -r /usr/share/themes/Catppuccin-Mocha-Standard-Mauve-Dark/gtk-4.0/ ~/.config/

# places earlier in sudo part

# set login theme
sudo cp /usr/share/backgrounds/gnome/background.png /usr/share/themes/Catppuccin-Mocha-Standard-Mauve-Dark/gnome-shell

mv /usr/share/themes/Catppuccin-Mocha-Standard-Mauve-Dark/gnome-shell/assets/* /usr/share/themes/Catppuccin-Mocha-Standard-Mauve-Dark/gnome-shell/

echo '<?xml version="1.0" encoding="UTF-8"?>
<gresources>
  <gresource prefix="/org/gnome/shell/theme">
    <file>calendar-today.svg</file>
    <file>checkbox.svg</file>
    <file>checkbox-off.svg</file>
    <file>gnome-shell.css</file>
    <file>pad-osd.css</file>
    <file>process-working.svg</file>
    <file>background.png</file>
  </gresource>
</gresources>' > /usr/share/themes/Catppuccin-Mocha-Standard-Mauve-Dark/gnome-shell/gnome-shell-theme.gresource.xml

cwd=$(eval pwd)
cd /usr/share/themes/Catppuccin-Mocha-Standard-Mauve-Dark/gnome-shell/
glib-compile-resources ./gnome-shell-theme.gresource.xml
cd $cwd

cp /usr/share/themes/Catppuccin-Mocha-Standard-Mauve-Dark/gnome-shell/gnome-shell-theme.gresource /usr/share/gnome-shell/

chmod +x ./theme-user.sh
sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ./theme-user.sh
