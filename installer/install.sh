#!/bin/bash

# NOTE: First things first: 
# $ su root 
# $ install sudo git
# $ sudo usermod -aG sudo $USER
# $ git clone https://github.com/Frideru/system_config.git

# Стандартный набор программ для установки
bash ./system_utilites

# Дополнительный набор программ
bash ./system_other

# Удаление мусора
sudo apt clean
sudo apt autoremove

# Настройка конфигурации
bash ./system_configuration

