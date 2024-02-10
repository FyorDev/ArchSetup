# ArchSetup

This repository contains scripts for configuring a GNOME based Arch Linux setup.

# Usage

Get a bootable USB Arch Linux installer https://wiki.archlinux.org/title/installation_guide

Run the `archinstall` and walk through the setup, or manually set up a bare-bones Arch GNOME install

Make sure your kernel is up to date with `pacman -Syu`, if this upgrades the kernel, reboot first.

`sudo pacman -S git`

`git clone https://github.com/FyorDev/ArchSetup.git`

`cd ./ArchSetup`

`sudo install.sh`

If, next to my setup, you also want to install all software that I use. Run `sudo install.sh -s`

Post install steps if you opted for the `-s`:

- In a KeePassXC database go to Settings -> Browser Integration -> Enable browser integration (and enable for Firefox)
- Run `nvim`, press `Y` to install, and press `space`, `t`, `h` and select the Catppuccin theme.
- Run Blender and `mkdir -p ~/.config/blender/*/scripts/presets/interface_theme/`
  then `cp ./dotfiles/blender/mocha_mauve.xml ~/.config/blender/*/scripts/presets/interface_theme/`
  inside Blender go to edit -> preferences -> themes -> switch Blender Dark to mocha mauve
- In Godot, go to Editor -> Editor Settings -> Text Editor -> Theme
  Select `catppuccin_mocha` as Color Theme
  Then go to Editor -> Editor Settings -> Interface -> Theme
  Set base `1e1e2e` accent `cba6f7` contrast `0.2` icon saturation `0.6`
