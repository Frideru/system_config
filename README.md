# Конфигурация
Для установки i3wm на Debian 12.

Так же работает с Debian 13, но изменились классы у окон по пути `~/.config/i3/config.d/windows.conf`

## После установки всех пакетов
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
