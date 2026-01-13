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
sudo apt install -y arandr network-manager-gnome flameshot vlc blueman mousepad evince keepassxc ncdu nemo gnome-disk-utility tmux

# Установка эмулятора терминала kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Удаление мусора
sudo apt clean
sudo apt autoremove

# Создание папок
su $MAINUSER -с mkdir -p $HOME/.programs
su $MAINUSER -с mkdir -p $HOME/.scripts
su $MAINUSER -с mkdir -p $HOME/.fonts

# Установка шрифтов
su $MAINUSER -с cp $HOME/system_config/fonts/Hack/* $HOME/.fonts/
su $MAINUSER -с cp $HOME/system_config/fonts/JetBrainsMono/* $HOME/.fonts/
su $MAINUSER -с fc-cache -f -v

# Развертывание конфигов
su $MAINUSER -с cp $HOME/system_config/configs/i3wm/* $HOME/.config/i3/
su $MAINUSER -с cp $HOME/system_config/configs/i3blocks/ $HOME/.config/
su $MAINUSER -c cp $HOME/system_config/configs/terminator/config $HOME/.config/terminator
su $MAINUSER -c mkdir -p $HOME/.config/terminator

# Установка rofi-power-menu
cp /home/$MAINUSER/system_config/rofi-power-menu/rofi-power-menu/rofi-power-menu /usr/bin/
