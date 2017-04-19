#!/bin/bash

# install.sh
# Creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# Variables
dir=~/dotfiles              # dotfiles directory
olddir=$dir/old             # old dotfiles backup directory
files="bashrc vimrc"        # list of files/folders to symlink in homedir

# Create /old in ~/dotfiles
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "Done."

# Change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "Done."

# Move any existing dotfiles in homedir to dotfiles/old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/.$file $olddir
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

