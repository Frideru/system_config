#!/bin/bash
# Обновление системы
sudo apt-get update
# Установка зависимостей
sudo apt-get install apt-transport-https ca-certificates curl
# Установка докера CLI
sudo apt-get install docker.io
# Проверка что докер установился
sudo docker --version
# Команда для теситрования правильности установки докера
sudo docker run hello-world

# Сразу установить docker-compose
sudo apt install docker-compose