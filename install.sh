#!/usr/bin/env bash

# TODO: Set up the installation script
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar -xzvf nvim-linux64.tar.gz
sudo mv nvim-linux64/* /usr
sudo rm -rf nvim-linux64 nvim-linux64.tar.gz
