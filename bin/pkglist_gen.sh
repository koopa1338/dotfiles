#!/bin/bash
pacman -Qqet | grep -v "$(pacman -Qqg base)" | grep -v "$(pacman -Qqm)" > ~/dotfiles/pkglist.txt
pacman -Qqm > ~/dotfiles/pkglist_aur.txt
