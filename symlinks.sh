#!/bin/bash
dotfiles=$HOME/dotfiles
date=`date +"%Y-%m-%d_%H-%M"`
dotfiles_old=$HOME/dotfiles_old/$date
mkdir -p $dotfiles_old/$date

files=".vimrc .vim .gitconfig .gitignore"
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

#if [ ! -d ~/.atom/packages/package-sync ]; then
#  if type apm > /dev/null 2>&1; then
#    echo "Installing Atom package-sync package."
#    apm install package-sync
#  fi
#fi
