#!/bin/bash

cd /tmp

pacman -S --needed --noconfirm git base-devel
userdo git clone https://aur.archlinux.org/yay.git

cd yay
userdo makepkg -si --noconfirm

cd ..
rm -r yay

cd $cwd
