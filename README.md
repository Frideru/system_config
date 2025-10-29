# Конфигурация
Установка i3wm на Debian 12.

Так же работает с Debian 13, но изменились классы у окон по пути `~/.config/i3/config.d/windows.conf`

## После установки Debian
1. Войти под суперпользователем
```sh
su root
```
2. Установить пакеты
```sh
apt install sudo git
```
3. Дать права суперпользователя
```sh
sudo usermod -aG sudo <USER>
```
4. Склонировать этот репозиторий
```sh
git clone https://github.com/Frideru/system_config.git
```

## Развертывание системы
Для автоматического развертывания нужно запустить скрипт `install.sh`
```sh
cd system_config && ./installer/install.sh
```

## Настройка `NetworkManager`
Для использования `NetworkManager` нужно
1. Перейти в `/etc/network/interfaces`
2. Оставить только
```config
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback
```
3. Перезагрузить систему.
```sh
sudo systemctl reboot now
```