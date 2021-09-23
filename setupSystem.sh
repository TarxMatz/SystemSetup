#!/bin/bash

echo "Installing packages..."

sudo pacman -S --noconfirm xorg git firefox pcmanfm tlp rxvt-unicode ntfs-3g udiskie udisks2 feh alsa-utils pulseaudio lightdm lightdm-gtk-greeter lynis node-lts-fermium ttf-liberation network-manager-applet networkmanager-openvpn

echo $(tput setaf 2) Package installation complete.
echo $(tput sgr0)
echo "Enabling services..."

sudo systemctl enable tlp
sudo systemctl enable lightdm

echo $(tput setaf 2) Services have been enabled.
echo $(tput sgr0)
