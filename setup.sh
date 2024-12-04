#!/bin/bash

echo 'testing' > /root/testfile-created-during-build-process

cd /root/
wget 'https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.6_all.deb'
if [ -f 'protonvpn-stable-release_1.0.6_all.deb' ]; then
  dpkg -i protonvpn-stable-release_1.0.6_all.deb
  apt update -y
  apt install proton-vpn-gnome-desktop -y
  rm -f protonvpn-stable-release_1.0.6_all.deb
else
  echo "ProtonVPN package download failed. Exiting."
  exit 1
fi

# Download BurpSuite
cd /root/BurpSuitePro
wget --content-disposition 'https://portswigger-cdn.net/burp/releases/download?product=pro&type=Jar&version=2024.11.1'
if [ ! -f burpsuite_pro_v2024.11.1.jar ]; then
  echo "BurpSuite download failed. Exiting."
  exit 1
fi
