#!/bin/bash

APP_FOLDER_NAME="Bloat"

APPS_DIR="/usr/share/applications"
 
dconf write /org/gnome/shell/favorite-apps "['com.gexperts.Tilix.desktop']"

gsettings set org.gnome.desktop.app-folders folder-children "['$APP_FOLDER_NAME']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/$APP_FOLDER_NAME/ name "$APP_FOLDER_NAME"


APPS=$(ls $APPS_DIR/*.desktop)

echo $APPS

APP_LIST="["
for APP in $APPS; do
    APP_LIST+="'"$(basename "$APP")"', "
done

APP_LIST="${APP_LIST%, }]"
echo $APP_LIST

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/$APP_FOLDER_NAME/ apps "$APP_LIST"
