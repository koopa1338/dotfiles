#!/bin/bash

date=$(date +%d-%m-%y)
sudo -v
sudo btrfs subvolume delete "/.snapshots/snap-"*
sudo btrfs subvolume snapshot / /.snapshots/snap-$date
echo -e "\e[01;32m[-]\e[00m created snapshot snap-$date"
sudo rm /boot/vmlinuz-linux-??-??-??
echo -e "\e[01;32m[-]\e[00m removed old kernel"
sudo cp /boot/vmlinuz-linux /boot/vmlinuz-linux-$date
echo -e "\e[01;32m[-]\e[00m created kernel linux-$date"
sudo rm /boot/initramfs-linux-??-??-??.img
echo -e "\e[01;32m[-]\e[00m removed old initramfs"
sudo cp /boot/initramfs-linux.img /boot/initramfs-linux-$date.img
echo -e "\e[01;32m[-]\e[00m created initramfs-linux-$date"
sudo rm /.snapshots/snap-$date/etc/fstab
sudo cp /home/koopa/dotfiles/snap/fstab /.snapshots/snap-$date/etc/
sudo sed -i 's/xxxxxx/$date/g' /.snapshots/snap-$date/etc/fstab
echo -e "\e[01;32m[-]\e[00m updated fstab for snapshot snap-$date"
sudo mv /boot/loader/entries/arch-??-??-??.conf /boot/loader/entries/arch-$date.conf
sudo sed -ri s/[0-9]{2}-[0-9]{2}-[0-9]{2}/$date/g /boot/loader/entries/arch-$date.conf
echo -e "\e[01;32m[-]\e[00m updated systemd-bootmenu"
sudo btrfs balance start -dusage=5 /btrfs
echo -e "\e[01;32m[-]\e[00m balanced btrfs filesystem"
