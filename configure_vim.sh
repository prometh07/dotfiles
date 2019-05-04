#!/bin/bash
VUNDLE_DIR=$HOME/.vim/bundle/Vundle.vim
mkdir -p "$VUNDLE_DIR" &&
git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR" &&
vim +PluginInstall +qall
