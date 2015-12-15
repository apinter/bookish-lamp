#!/bin/bash

## Don't forget to enable Canonical partner repos 
## in software sources or in apt: /etc/apt/sources.list and uncomment:
## deb http://archive.canonical.com/ubuntu

## Add Oracle Java repo
sudo add-apt-repository ppa:webupd8team/java

## Add Numix repo
sudo add-apt-repository ppa:numix/ppa

##Add Owncloud repo
wget -nv https://download.owncloud.org/download/repositories/stable/Ubuntu_15.10/Release.key -O Release.key
apt-key add - < Release.key
sh -c "echo 'deb http://download.owncloud.org/download/repositories/stable/Ubuntu_15.10/ /' >> /etc/apt/sources.list.d/owncloud.list"

## Install updates 

sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y

####################################################################
## Install every cool stuff

apt-get install aptitude vlc skype virtualbox chromium-browser epiphany-browser numix-gtk-theme numix-icon-theme-circle numix-wallpaper* mc git build-essential gcc oracle-java8-installer docker vagrant gimp inkscape okular scribus geary owncloud ufw gufw uget baobab gparted  p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller ffmpeg gstreamer0.10-plugins-ugly gxine libdvdread4 icedax tagtool easytag id3tool lame libxine2-ffmpeg nautilus-script-audio-convert libmad0 mpg321 libavcodec-extra gstreamer1.0-libav ubuntu-restricted-extras buntu-restricted-addons -y 

## Download and install Atom
cd ~/Downloads
wget https://atom.io/download/deb -O atom.deb
dpkg -i atom.deb

## Download and install Truecrypt 
wget http://sourceforge.net/projects/truecrypt/files/TrueCrypt/Other/TrueCrypt-7.2-Linux-x64.tar.gz/download -O truecrypt.tar.gz
tar xzvf truecrypt.tar.gz
./truecrypt-7.2-setup-x64

## Cealn up and leave a fresh apt index
apt-get autoremove
apt-get clean
apt-get autoclean
apt-get update


