function cleanpaccache
	sudo -v
	paccache -rvuk0&
	await "Cleaning cache of uninstalled packages "
	paccache -rvk2&
	await "cleaning cache of installed packages (keeping last two versions) "
end
