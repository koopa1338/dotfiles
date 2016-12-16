#!/bin/bash
echo "Checking for system updates..."
sudo pacman -Syy
sudo pacman -Syu

#variables
pacman=true
aur=true
old=$HOME/dotfiles_old
dir=$HOME/dotfiles
pkgs=$(cat $dir/pkglist_aur.txt)
bin=$HOME/bin
config=$HOME/.config
fileshome="zshrc Xresources i3status xprofile aliases"    # list of files/folders to symlink in homedir
filesbin="togglePad.sh toggleTapClick.sh autoxrandr.sh testcolors.sh pkglist_gen.sh"    # list of files/folders to symlink in bin

echo "Do you wish to install needed packages?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) unset pacman; pacman=false; break;;
    esac
done

if $pacman; then
  echo "Installing needed packages..."
  sudo pacman -S - < $dir/pkglist.txt --noconfirm
fi
echo "done!"

echo "Do you wish to install packages from AUR?"
select yn in "Yes" "No"; do
    case $yn in
      Yes ) break;;
      No ) unset aur; aur=false; break;;
    esac
done

if $aur; then
  echo "installing AUR packages..."
  for pkg in $pkgs; do
      yaourt -S $pkg
  done
fi
echo "done!"

echo "sleep for 50"
sleep 50

if [ ! -d $old ] ; then
  mkdir $old
fi

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $fileshome; do
    echo "Creating symlink to $file in home directory."
    sudo mv $HOME/.$file $old/$file
    sudo ln -s $dir/$file $HOME/.$file
done

if [ -f /etc/X11/xinit/xinitrc ] ; then
  sudo mv -f /etc/X11/xinit/xinitrc $old
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
ln -s $dir/config $config/i3/config
echo "custom lockscreen..."
#blurlock
if [ ! -d $HOME/.i3lock ] ; then
  sudo mkdir $HOME/.i3lock
fi
if [ -f $HOME/.i3lock/lock ] ; then
  sudo mv -f $HOME/.i3lock/lock $old
  unset f
fi
if [ -f $HOME/.i3lock/lock.png ] ; then
  sudo mv -f $HOME/.i3lock/lock.png $old
  unset f
fi
sudo ln -s $dir/i3lock/blur-lock.sh $HOME/.i3lock/lock
sudo cp $dir/i3lock/lock.png $HOME/.i3lock/lock.png
echo "htop config..."
#htoprc
if [ ! -d $config/htop ] ; then
  sudo mkdir $config/htop
fi
if [ -f $config/htop/htoprc ] ; then
  sudo mv -f $config/htop/htoprc $old
  unset f
fi
sudo ln -s $dir/htoprc $config/htop/htoprc
echo "done"

#dunstrc
if [ ! -d $config/dunst ] ; then
  sudo mkdir $config/dunst
fi
if [ -f $config/dunst/dunstrc ] ; then
  sudo mv -f $config/dunst/dunstrc $old
  unset f
fi
sudo ln -s $dir/dunstrc $config/htop/dunstrc
echo "done"

if [ ! -d $bin ] ; then
  sudo mkdir $bin
fi

echo -n "Changing to the $bin directory ..."
cd $bin
echo "done"

for file in $filesbin; do
  echo "Creating symlink to $file in home directory."
  sudo mv $bin/$file $old/$file
  sudo ln -s $dir/bin/$file $bin/$file
done

echo "Do you wish to to set qt environment variable?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) source $dir/bin/qt.sh; echo "Pls qt5ct and qt4-config to set qt gtk-theme" break;;
        No ) break;;
      esac
done
