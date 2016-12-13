#!/bin/bash
echo "saving packages from AUR..."
pacman -Qqm > ~/dotfiles/pkglist_aur.txt
echo "done."
echo "saving remaining installed packages..."
pacman -Qqet | grep -v "$(pacman -Qqg base)" | grep -v "$(pacman -Qqm)" > ~/dotfiles/pkglist.txt
echo "done."
