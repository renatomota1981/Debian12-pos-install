#!/bin/bash
cp sources.list /etc/apt/sources.list -f
apt update -y && apt upgrade -y
apt install sudo wget gpg firmware-misc-nonfree curl -y

#sudo
echo "renato ALL=(ALL:ALL) ALL" >> /etc/sudoers

#Chrome
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null
echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
apt update

#VSCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

#Edge
echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge/ stable main" | sudo tee /etc/apt/sources.list.d/microsoft-edge.list
cd /tmp && curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && cd $HOME

sudo dpkg --add-architecture i386
apt install apt-transport-https
apt update
apt install python-is-python3 python3-pip microsoft-edge-stable google-chrome-stable code steam-installer build-essential gnome-shell-extension-manager openssh-server openssh-client libreoffice-gtk3 -y
sudo systemctl enable --now ssh
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer
