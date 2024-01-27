#!/bin/bash

array=(
    19   # user-themes
    4451 # logo-menu
    1514 # rounded-corners
    1460 # vitals
    4481 # forge
)

for i in "${array[@]}"
do
    gnome-shell-extension-installer $i --yes
done
