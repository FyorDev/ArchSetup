#!/bin/bash

# nvim NvChad
git clone https://github.com/NvChad/NvChad.git ~/.config/nvim --depth 1

# setup rust
rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy
mkdir -p ~/.config/fish/completions
rustup completions fish > ~/.config/fish/completions/rustup.fish
