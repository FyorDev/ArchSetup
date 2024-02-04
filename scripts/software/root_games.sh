#!/bin/bash

current_user=$(logname)

pacman -S steam openra --noconfirm

sudo -u $current_user yay -S minecraft-launcher --noconfirm
