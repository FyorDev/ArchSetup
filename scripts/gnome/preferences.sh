#!/bin/bash

# forge no window highlight
dconf write /org/gnome/shell/extensions/forge/focus-border-toggle "false"

# remove to clear up CTRL+ALT+T shortcut, used for terminal
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-center "@as []"
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-one-third-left "@as []"
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-one-third-right "@as []"
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-two-third-left "@as []"
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-two-third-right "@as []"

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
rm ./oh-my-fish-install

fish -c "omf install bobthefish"
cd $cwd
echo "fish stuff completed"

# tilix theme
dconf load /com/gexperts/Tilix/ < ./data/tilix/tilix.dconf

# neofetch
mkdir ~/.config/neofetch
cp ./dotfiles/neofetch/config.conf ~/.config/neofetch/config.conf

# ranger
mkdir ~/.config/ranger
cp ./dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# and add to fishshell
cp ./dotfiles/fish/config.fish ~/.config/fish/
cp ./dotfiles/fish/fish_variables ~/.config/fish/
# git alias
git config --global alias.l 'log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %C(brightgreen)%s %C(dim blue)(%cr)%C(reset) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --date=relative'
git config --global alias.f 'fetch'
git config --global alias.l 'pull'
git config --global alias.s 'status'
git config --global alias.d 'diff'
git config --global alias.a 'add .'
git config --global alias.c 'commit'
git config --global alias.p 'push'

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

# arch logo
dconf write /org/gnome/shell/extensions/Logo-menu/menu-button-icon-image 6
dconf write /org/gnome/shell/extensions/Logo-menu/menu-button-icon-size 30

# time display
dconf write /system/locale/region "'en_US.UTF-8'"
dconf write /org/gnome/desktop/interface/clock-show-weekday true
dconf write /org/gnome/desktop/interface/clock-show-seconds true
