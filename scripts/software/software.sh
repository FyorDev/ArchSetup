#!/bin/bash

prefix="./scripts/software/"
current_user=$(logname)

${prefix}root_browser.sh

${prefix}root_development.sh

sudo -u $current_user DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u $current_user)/bus" ${prefix}user_development.sh

${prefix}root_games.sh
