#!/bin/bash

# nvim NvChad
git clone https://github.com/NvChad/NvChad.git ~/.config/nvim --depth 1

# setup rust
rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy
mkdir -p ~/.config/fish/completions
rustup completions fish > ~/.config/fish/completions/rustup.fish

# godot
mkdir -p ~/.config/godot/text_editor_themes
cp ./dotfiles/godot/catppuccin_mocha.tet ~/.config/godot/text_editor_themes/

# blender theme
blender
sleep 1
blenderfolder=$(ls -d ~/.config/blender/*/ | head -n 1 | xargs -n 1 basename)
mkdir -p ~/.config/blender/"$blenderfolder"/scripts/presets/interface_theme/
cp ./dotfiles/blender/mocha_mauve.xml ~/.config/blender/*/scripts/presets/interface_theme/

