#!/bin/bash

cat << EOL > "/etc/apt/sources.list"
deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware

deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
deb-src http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware

deb http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
EOL

sudo apt update
sudo apt install nvidia-detect
DRIVER=nvidia-detect | awk '/It is recommended to install the/{getline; print $0}' | sed 's/^[ \t]*//;s/[ \t]*$//'

sudo apt install $DRIVER

echo "Теперь можно перезагрузить систему"