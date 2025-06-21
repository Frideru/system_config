# Конфигурация только что установленной Debian
В каждой папке лежит файл с описанием

## TODO
- [ ] Авторазвертывание конфигураций
- [ ] Автоматическое создание нужных папок

## После установки всех пакетов
Для использования NetworkManager нужно убать все, кроме строк `lo` в `/etc/interfaces` и перезагрузить систему (не помню точно как это сделать, пишу на память).

>NOTE:Нужно сделать авто установщик и авто развертывание конфигов и папок. Референсы ниже

```bash
#!/usr/bin/env bash

# Hyprland dependencies
bash ~/debian-hyprland/resources/01-dependencies
bash ~/debian-hyprland/resources/02-waypackages

# File Manager (thunar)
bash ~/debian-hyprland/resources/03-filemanager

# Install Hyprland
bash ~/debian-hyprland/resources/04-hyprland

# nwg-look
bash ~/debian-hyprland/resources/05-nwg-look

# fonts
bash ~/debian-hyprland/resources/06-fonts

# rofi wayland
bash ~/debian-hyprland/resources/07-rofi-wayland

# SDDM
bash ~/debian-hyprland/resources/08-login-manager


sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
```

01-dependencies.sh
```bash
#!/usr/bin/env bash

# Hyperland dependencies - PACKAGE INCLUDES build-essential.
sudo apt install -y build-essential  cmake cmake-extras curl gettext gir1.2-graphene-1.0 git glslang-tools gobject-introspection golang hwdata jq libavcodec-dev libavformat-dev libavutil-dev libcairo2-dev libdeflate-dev libdisplay-info-dev libdrm-dev libegl1-mesa-dev libgbm-dev libgdk-pixbuf-2.0-dev libgdk-pixbuf2.0-bin libgirepository1.0-dev libgl1-mesa-dev libgraphene-1.0-0 libgraphene-1.0-dev libgtk-3-dev libgulkan-0.15-0 libgulkan-dev libinih-dev libinput-dev libjbig-dev libjpeg-dev libjpeg62-turbo-dev liblerc-dev libliftoff-dev liblzma-dev libnotify-bin libpam0g-dev libpango1.0-dev libpipewire-0.3-dev libqt6svg6 libseat-dev libstartup-notification0-dev libswresample-dev libsystemd-dev libtiff-dev libtiffxx6 libtomlplusplus-dev libudev-dev libvkfft-dev libvulkan-dev libvulkan-volk-dev libwayland-dev libwebp-dev libxcb-composite0-dev libxcb-cursor-dev libxcb-dri3-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-present-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-util-dev libxcb-xinerama0-dev libxcb-xinput-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev libxkbregistry-dev libxml2-dev libxxhash-dev meson ninja-build openssl psmisc python3-mako python3-markdown python3-markupsafe python3-yaml qt6-base-dev scdoc seatd spirv-tools vulkan-utility-libraries-dev wayland-protocols xdg-desktop-portal xwayland
```
