#!/bin/bash

prefix="./scripts/theme/"
current_user=$(logname)

${prefix}root_theme.sh

${prefix}root_login_screen.sh

sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ${prefix}user_theme.sh
