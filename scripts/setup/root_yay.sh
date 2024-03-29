#!/bin/bash

cd /tmp
pacman -S --needed --noconfirm base-devel git

su -c "git clone https://aur.archlinux.org/yay.git" "$current_user"

cd yay
sudo -u $current_user makepkg -sii --noconfirm

cd ..
rm -r yay

cd $cwd
