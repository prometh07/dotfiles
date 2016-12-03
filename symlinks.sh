#!/bin/bash

########## Variables
dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc vim gitconfig gitignore atom"    # list of files/folders to symlink in homedir
terminator_dir="$HOME/.config/terminator"

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/.$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

# add terminator dotfiles
if [ -d $HOME/.config/terminator ]
then
  echo "Moving the old terminator directory to $olddir"
  mv $HOME/.config/terminator $olddir/
fi
echo "Creating symlink to terminator in $terminator_dir."
ln -s $dir/terminator/ $terminator_dir

# install atom packages
if [ ! -d ~/.atom/packages/package-sync ]; then
  if type apm > /dev/null 2>&1; then
    echo "Installing Atom package-sync package."
    apm install package-sync
  fi
fi
