function mirrorupdate
	sudo reflector --verbose -l 20 -p https --sort rate --save /etc/pacman.d/mirrorlist; and echo 'Mirrorlist has been updated with the fastest servers!'
end
