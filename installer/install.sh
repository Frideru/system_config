#!/bin/bash

# First things first: 
# $ su root
# $ install sudo git
# $ sudo usermod -aG sudo $USER
# $ git clone https://github.com/Frideru/system_config.git

MAINUSER=$(cat /etc/passwd | grep 1000 | awk -F: '{print $1}')

# Стандартный набор программ для установки
# chromium
sudo apt install -y xorg i3 i3blocks lightdm terminator network-manager pulseaudio pavucontrol firefox-esr pkexec polkitd lxpolkit curl gcc xclip feh mc htop rofi kbdd

# Дополнительный набор программ
# mutt picom conky lxappearance emacs
sudo apt install -y arandr network-manager-gnome flameshot vlc blueman mousepad evince keepassxc ncdu nemo gnome-disk-utility

# Удаление мусора
sudo apt clean
sudo apt autoremove

# Переходим с рута на пользователя системы
su $MAINUSER

# Создание папок
mkdir -p $HOME/.programs
mkdir -p $HOME/.scripts
mkdir -p $HOME/.fonts
mkdir -p $HOME/.config/terminator

# Установка шрифтов
cp $HOME/system_config/fonts/Hack/* $HOME/.fonts/
cp $HOME/system_config/fonts/JetBrainsMono/* $HOME/.fonts/
fc-cache -f -v

cp $HOME/system_config/configs/terminator/config $HOME/.config/terminator/
cp $HOME/system_config/configs/i3wm/* $HOME/.config/i3/
cp $HOME/system_config/configs/i3blocks/ $HOME/.config/
sudo cp $HOME/system_config/rofi-power-menu/rofi-power-menu/rofi-power-menu /usr/bin/