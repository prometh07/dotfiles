#!/bin/bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &&
vim +PluginInstall +qall &&
cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
