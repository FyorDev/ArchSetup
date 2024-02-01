#!/bin/bash

prefix="./scripts/gnome/"
current_user=$(logname)

sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ${prefix}user_extensions.sh

sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ${prefix}user_preferences.sh
