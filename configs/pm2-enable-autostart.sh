#!/bin/bash
# Установить pm2
sudo npm install -g pm2

# Переключиться на пользователя
sudo su - bridge

# Запустить проект через pm2
cd /path/to/project
pm2 start app.js --name myapp

# Сохранить процессы pm2
pm2 save

# Настроить автозапуск pm2
pm2 startup systemd -u bridge --hp /home/bridge

# Вывод команды будет похожим, нужно выполнить ее от пользователя root:
sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u bridge --hp /home/bridge

# Перезагрузить систему и посмотреть результат
systemctl reboot
# after
sudo su - bridge 
pm2 ls