#!/bin/bash

# --- Получение данных ---

# Генерация мастер ключа
MASTERKEY="f$"$(od -N 1 -An -tx1 /dev/urandom | tr -d '[:space:]')"-"$(od -N 16 -An -tx1 /dev/urandom | tr -d '[:space:]')
echo "Master key will be in /etc/systemd/system/melisearch.service"

# Создание пользователя meilisearch
PASSHASH=$(openssl passwd -6 "$MASTERKEY")
sudo useradd -m -s /bin/bash -p "$PASSHASH" meilisearch

# Получение IP
HOSTIP=$(ip a | grep "inet " | awk 'NR==2 {print $2}')

# --- Установка meilisearch ---
cd /home/meilisearch/
curl -L https://install.meilisearch.com | sh
chown -R meilisearch:meilisearch ./*

# Создание сервиса
sudo cat << EOL > "/etc/systemd/system/meilisearch.service"
[Unit]
Description=MeiliSearch
After=network.target

[Service]
Type=exec
User=meilisearch
Group=meilisearch
#ExecStart=/usr/local/bin/meilisearch
# Примеры часто используемых аргументов:
# --env production - для продакшена
# --db-path /var/lib/meilisearch/data.ms - путь к БД
# --http-addr 127.0.0.1:7700 - адрес и порт
# --master-key "your_master_key" - мастер-ключ (важно!)
ExecStart=/home/meilisearch/meilisearch --master-key="$MASTERKEY" --env development --db-path /home/meilisearch/data.ms --http-addr $HOSTIP:7700
Restart=always
RestartSec=3

# Убедитесь, что директории доступны пользователю meilisearch
#StateDirectory=meilisearch # Это создаст /var/lib/meilisearch, если не существует, и установит права владельца
WorkingDirectory=/home/meilisearch/

# Логирование через journald
StandardOutput=journal
StandardError=journal
SyslogIdentifier=meilisearch

[Install]
WantedBy=multi-user.target
EOL


# Запуск сервиса
sudo systemctl start  meilisearch.service
sudo systemctl enable meilisearch.service
sudo systemctl status meilisearch.service

echo "Meilisearch installed and started!"
printf "After all, you may need to change ExecStart command to \033[33m%s\033[0m" "/etc/systemctl/system/meilisearch.service"
printf "Change to \033[33m%s\033[0m and \033[33m%s\033[0m" "--env production" "--http-addr 127.0.0.1:7700"