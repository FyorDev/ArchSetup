#!/bin/bash

prefix="./scripts/setup/"
current_user=$(logname)

pacman -S git wget --noconfirm # prerequisites

${prefix}root_yay.sh

${prefix}root_essentials.sh

${prefix}root_wine.sh

sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ${prefix}user_bloat_app_folder.sh
