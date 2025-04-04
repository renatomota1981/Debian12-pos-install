#!/bin/bash
function add-repository () {
        sudo add-apt-repository contrib non-free -y
}

function apt-update () {
        sudo apt update
}

function apt-upgrade () {
        sudo apt upgrade -y
}

function gnome () {
	sudo apt install gnome-shell gnome-console gnome-text-editor gnome-disk-utility gnome-calculator gnome-system-monitor gnome-tweaks nautilus -y
	sudo systemctl enable gdm3
}

function base () {
	sudo apt install software-properties-common gparted neofetch flatpak apt-transport-https ca-certificates curl -y
}

function extensoes () {
        sudo apt install gnome-shell-extensions gnome-shell-extension-dashtodock gnome-shell-extension-caffeine -y
}

function chrome () {
        #1 - Import the Google Chrome GPG Key
	curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null
	#2 - Add the Google Chrome Repository
	echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
	#3 - Update the APT Package List and Install
	sudo apt update && sudo apt install google-chrome-stable -y
}

function spotify () {
        #1 - You will first need to configure our debian repository:
	curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
	#2 - Then you can install the Spotify client:
	sudo apt update && sudo apt install spotify-client -y 
}

function steam () {
        sudo dpkg --add-architecture i386
	sudo apt update && sudo apt install steam-installer -y
}

function flathub () {
        sudo apt install gnome-software-plugin-flatpak -y
	sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo 
}

function flatpak-install () {
        sudo flatpak install -y --noninteractive flathub org.telegram.desktop
        sudo flatpak install -y --noninteractive flathub com.heroicgameslauncher.hgl
        sudo flatpak install -y --noninteractive flathub org.libreoffice.LibreOffice
}

function dark () {
        gsettings set org.gnome.desktop.interface color-scheme prefer-dark && gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
}

function networking () {
        sudo systemctl disable networking
        sudo systemctl stop networking
        sudo rm /etc/network/interfaces
}

function reiniciar () {
        sudo reboot
}

add-repository
apt-update
apt-upgrade
gnome
base
extensoes
chrome
spotify
steam
flathub
#flatpak-install
dark
networking
reiniciar
