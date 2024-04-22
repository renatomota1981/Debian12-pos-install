#!/bin/bash
apt update -y && apt upgrade -y

#Flatpak
sudo apt install flatpak gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Spotify
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /e>
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list


sudo apt install ddccontrol gddccontrol ddccontrol-db i2c-tools telegram-desktop libavcodec-extra spotify-client blueman gparted transmission-gtk vlc pavucontrol geany gimp inkscape audacity filezilla ffmpeg git wget nano vim htop locate p7zip p7zip-full unzip -y
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer
