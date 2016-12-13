#!/bin/bash
echo "Checking for system updates..."
sudo pacman -Sy
sudo pacman -Syu

echo "Installing needed packages..."
sudo pacman -S - < ~/dotfiles/pkglist.txt
pkgs=$(cat ~/dotfiles/pkglist_aur.txt)
for pkg in $pkgs; do
    yaourt -S $pkg
done
echo "done!"

if [ ! -d ~/dofiles_old ] ; then
  mkdir ~/dotfiles_old
fi
old=~/dotfiles_old
dir=~/dotfiles
bin=~/bin
config=~/.config

fileshome="zshrc Xresources i3status xprofile aliases"    # list of files/folders to symlink in homedir
filesbin="togglePad.sh toggleTapClick.sh autoxrandr.sh testcolors.sh pkglist_gen.sh"    # list of files/folders to symlink in bin

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $fileshome; do
    echo "Creating symlink to $file in home directory."
    sudo mv ~/.$file $old/$file
    sudo ln -s $dir/$file ~/.$file
done

if [ -f /etc/X11/xinit/xinitrc ] ; then
  sudo mv -f /etc/X11/xinit/xinitrc
  unset f
fi
echo "Creating symlink for xinitrc"
sudo ln -s $dir/xinitrc /etc/X11/xinit/xinitrc

echo "i3 config..."
#move i3 config in place
if [ ! -d $config/i3 ] ; then
  sudo mkdir $config/i3
fi
if [ -f $config/i3/config ] ; then
  sudo mv -f $config/i3/config $old
  unset f
fi
ln -s /dotfiles/config $config/i3/config
echo "custom lockscreen..."
#blurlock
if [ ! -d ~/.i3lock ] ; then
  sudo mkdir ~/.i3lock
fi
if [ -f ~/.i3lock/blur-lock.sh ] ; then
  sudo mv -f ~/.i3lock/blur-lock.sh $old
  unset f
fi
if [ -f ~/.i3lock/lock.png ] ; then
  sudo mv -f ~/.i3lock/lock.png $old
  unset f
fi
sudo ln -s $dir/i3lock/blur-lock.sh ~/.i3lock/lock
sudo cp $dir/i3lock/lock.png ~/.i3lock/lock.png
echo "htop config..."
#htoprc
if [ ! -d $config/htop ] ; then
  sudo mkdir ~/.config/htop
fi
if [ -f $config/htop/htoprc ] ; then
  sudo mv -f $config/htop/htoprc $old
  unset f
fi
sudo ln -s $dir/htoprc $config/htop/htoprc
echo "done"

if [ ! -d ~/bin ] ; then
  sudo mkdir ~/bin
fi

echo -n "Changing to the $bin directory ..."
cd $bin
echo "done"

for file in $filesbin; do
  echo "Creating symlink to $file in home directory."
  sudo mv $bin/$file $old/$file
  sudo ln -s $dir/bin/$file $bin/$file
done
