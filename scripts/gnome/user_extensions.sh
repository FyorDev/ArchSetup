#!/bin/bash

extensions=(
    forge@jmmaranan.com
    logomenu@aryan_k
    Rounded_Corners@lennart-k
    user-theme@gnome-shell-extensions.gcampax.github.com
    Vitals@CoreCoding.com
)
for i in "${extensions[@]}"
do
    busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${i}
done

# default included, allows multiple instances to be launched via the menu
gnome-extensions enable launch-new-instance@gnome-shell-extensions.gcampax.github.com

# remove to clear up CTRL+ALT+T shortcut, used for terminal
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-center "@as []"
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-one-third-left "@as []"
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-one-third-right "@as []"
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-two-third-left "@as []"
dconf write /org/gnome/shell/extensions/forge/keybindings/window-snap-two-third-right "@as []"
