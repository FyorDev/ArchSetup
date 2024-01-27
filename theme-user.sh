#!/bin/bash

current_user=$(logname)

dconf write /org/gnome/shell/extensions/user-theme/name "'Catppuccin-Mocha-Standard-Mauve-Dark'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Catppuccin-Mocha-Standard-Mauve-Dark'"
dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
dconf write /org/gnome/desktop/interface/icon-theme "'Papirus-Dark'"

dconf write /org/gnome/desktop/background/picture-uri-dark "'file:///home/$current_user/.local/share/backgrounds/background.png'"
dconf write /org/gnome/desktop/screensaver/picture-uri "'file:///home/$currenr_user/.local/share/backgrounds/background.png'"
