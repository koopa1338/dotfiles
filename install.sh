#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
fileshome="zshrc zprofile Xresources i3status xprofile aliases"    # list of files/folders to symlink in homedir
filesbin="togglePad.sh toggleTapClick.sh autoxrandr.sh"    # list of files/folders to symlink in bin

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $fileshome; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    mv ~/.config/i3/config ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

for file in $filesbin; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/bin/$file
done

#move i3 config in place
ln -s /dotfiles/config ~/.config/i3/config
#blurlock
ln -s $dir/i3lock/blur-lock.sh ~/.i3lock/lock
cp $dir/i3lock/lock.png ~/.i3lock/lock.png
#htoprc
ln -s $dir/htoprc ~/.config/htop/htoprc
