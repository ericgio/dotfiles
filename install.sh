#!/bin/bash

# install.sh
# Creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# Variables
DIR=~/dotfiles      # dotfiles directory
OLDDIR=$dir/old     # old dotfiles backup directory

# List of files/folders to symlink in homedir
FILES="bash_profile bashrc hushlogin tmux.conf vimrc"
FOLDERS="vim"

# Create /old in ~/dotfiles
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $OLDDIR
echo "Done."

# Change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $DIR
echo "Done."

# Move any existing dotfiles in homedir to dotfiles/old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $FILES; do
  echo "Moving any existing dotfiles from ~ to $OLDDIR"
  mv ~/.$file $OLDDIR
  echo "Creating symlink to $file in home directory."
  ln -s $DIR/$file ~/.$file
done
