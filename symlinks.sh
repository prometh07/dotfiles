#!/bin/bash
dotfiles=$HOME/dotfiles
date=`date +"%Y-%m-%d_%H-%M"`
dotfiles_old=$HOME/dotfiles_old/$date
mkdir -p $dotfiles_old/$date

files=".vimrc .vim .gitconfig .gitignore .tmux.conf .bash_aliases .bash_commons"
dirs=".vim .config/terminator .config/fish .atom"

echo "Creating backup in $dotfiles_old"
for file in $files; do mv $HOME/$file $dotfiles_old; done
for dir in $dirs; do mv $HOME/$dir $dotfiles_old; done

echo "Copying new dotfiles from $dotfiles"
cd $dotfiles
for file in $files; do ln -s $dotfiles/$file $HOME/$file; done
for dir in $dirs; do
  if [[ "$dir" == *"/"* ]]
  then
    ln -s $dotfiles/$dir $HOME/${dir%/*}
  else
    ln -s $dotfiles/$dir $HOME
  fi
done
