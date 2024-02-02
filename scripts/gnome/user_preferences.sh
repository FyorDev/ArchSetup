#!/bin/bash

# keyboard
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+altgr-intl')]"

# begone terminal bell
dconf write /org/gnome/desktop/sound/event-sounds "false"

# set fishshell

chsh -s $(which fish)
fish -c 'set -U fish_greeting ""'

# ohmyfish with git aware bobthefish
cwd=$(eval pwd)
cd /tmp
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > oh-my-fish-install
fish oh-my-fish-install --noninteractive
rm ./oh-my-fish-installi

fish -c "omf install bobthefish"
cd $cwd
echo "fish stuff completed"

# tilix theme
dconf load /com/gexperts/Tilix/ < ./data/tilix/tilix.dconf

# neofetch
mkdir ~/.config/neofetch
cp ./dotfiles/neofetch/config.conf ~/.config/neofetch/config.conf

# and add to fishshell
cp ./dotfiles/fish/config.fish ~/.config/fish/
cp ./dotfiles/fish/fish_variables ~/.config/fish/

# display
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# TODO: set to 125%? or ask user what percentage to set it to

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
