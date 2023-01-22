function mirrorupdate
    sudo reflector --verbose -l 50 -p https -f 20 --save /etc/pacman.d/mirrorlist;
    and echo "Fastes mirrors has been written to the mirrorlist"
end
