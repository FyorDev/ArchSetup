#!/bin/bash

# keyboard
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+altgr-intl')]"

# set fishshell

chsh -s $(which fish)
fish -c 'set -U fish_greeting ""'

# neofetch
wget -O ~/.config/neofetch/config.conf https://raw.githubusercontent.com/chick2d/neofetch-themes/main/normal/acenoster.conf
# and add to fishshell
echo "neofetch | lolcat -F 0.05" >> ~/.config/fish/config.fish

# exa viewer with l shortcut
echo "alias l 'exa -la --icons'" >> ~/.config/fish/config.fish

# init zoxide and z shortcut
echo -e "eval (zoxide init fish --hook prompt)\nalias z='zoxide'\nz init fish | source" >> ~/.config/fish/config.fish



# display
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# TODO: set to 125%? or ask user what percentage to set it to

# CTRL+ALT+T terminal shortcut
# remove conflicting forge shortcuts
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-center "@as []"
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-one-third-left "@as []"
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-one-third-right "@as []"
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-two-third-left "@as []"
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-two-third-left "@as []"

dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Control><Alt>t'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'tilix'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'terminal'"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[ \
  '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/' \
]"

# minimize button on windows
dconf write /org/gnome/desktop/wm/preferences/button-layout "'appmenu:minimize,close'"

# midnight commander
mkdir $HOME/.config/mc/
echo -e '\n[Midnight-Commander]\nskin=modarcon16-defbg' >> $HOME/.config/mc/ini

# arch logo
dconf write /org/gnome/shell/extensions/Logo-menu/menu-button-icon-image 6
dconf write /org/gnome/shell/extensions/Logo-menu/menu-button-icon-size 30

# time display
dconf write /system/locale/region "'en_US.UTF-8'"
dconf write /org/gnome/desktop/interface/clock-show-weekday true
dconf write /org/gnome/desktop/interface/clock-show-seconds true
