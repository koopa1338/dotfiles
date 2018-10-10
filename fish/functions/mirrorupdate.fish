function mirrorupdate
	sudo reflector --verbose -l 10 -p https --sort rate --save /etc/pacman.d/mirrorlist;
	and echo "Fastes mirrors has been written to the mirrorlist"
end
