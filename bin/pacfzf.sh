#!/bin/bash

: "${AUR_PKG_URL:=https://aur.archlinux.org/packages.gz}"
: "${CACHE_PATH:="$HOME/.cache/pacfzf"}"

: "${CACHE:="$CACHE_PATH"/cache}"
: "${CACHEHIST:="$CACHE_PATH"/hist}"

pacman -Slq > "$CACHE"
curl --fail --silent "$AUR_PKG_URL" | gunzip --stdout | sed 1d >> "$CACHE"
cat $CACHE | fzf --color=16 --prompt='packages: ' --height=35 --ansi --preview='paru -Si {}' --preview-window=right:wrap --layout=reverse > $CACHEHIST
paru -S $(cat $CACHEHIST)
