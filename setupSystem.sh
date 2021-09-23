#!/bin/bash

echo "Installing packages..."

sudo pacman -S --noconfirm xorg git firefox pcmanfm tlp rofi rxvt-unicode ntfs-3g udiskie udisks2 feh alsa-utils pulseaudio lightdm lightdm-gtk-greeter lynis node-lts-fermium ttf-liberation network-manager-applet networkmanager-openvpn dunst

echo $(tput setaf 2) Package installation complete.
echo $(tput sgr0)

printf "\n"

echo $(tput setaf 1)"Would you like to install trizen package manager from the aur? (yes/no):"
echo $(tput sgr0)
read trizen

if [ $trizen == "yes" ] || [ $trizen == "y" ]
then
 echo "Installing dependencies for trizen..." 
 sudo pacman -S --noconfirm pacutils perl-data-dump perl-json perl-libwww perl-lwp-protocol-https perl-term-readline-gnu perl-term-ui 
 echo "Cloning trizen from the AUR..."
 git clone https://aur.archlinux.org/trizen.git; echo Clone completed.
 cd trizen
 echo "Building packages..."
 makepkg;echo "Package build completed."
 sudo pacman -U trizen-1:1.64-1-any.pkg.tar.zst --noconfirm;
 cd ..
 rm -rf trizen
else
  echo "Skipping trizen..."
fi

printf "\n"
echo "Enabling services..."

sudo systemctl enable tlp
sudo systemctl enable lightdm

echo $(tput setaf 2) Services have been enabled.
echo $(tput sgr0)

printf "\n"
echo "Cloning config files..."
git clone https://github.com/TarxMatz/my-dot-files.git;echo "Clone completed."
cp -r my-dot-files/* ~;rm -rf my-dot-files

printf "\n\n\n"
echo "System Setup Script has finished execution."
