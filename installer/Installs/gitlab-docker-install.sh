#!/bin/bash

SERVERIP=$1

printf "Убедитесь что у вас установлен Nginx и доступны \033[33m%s\033[0m, \033[33m%s\033[0m, \033[33m%s\033[0m порты" "443" "80" "22"

sudo docker pull gitlab/gitlab-ce:latest
sudo mkdir -p /srv/gitlab/config /srv/gitlab/logs /srv/gitlab/data

sudo docker run --detach \
  --hostname $SERVERIP \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab \
  --restart always \
  --volume /srv/gitlab/config:/etc/gitlab \
  --volume /srv/gitlab/logs:/var/log/gitlab \
  --volume /srv/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce:latest

sudo cat << EOL > "/etc/nginx/sites-enabled/gitlab"
server {
    listen 80;
    server_name $SERVERIP;
    location / {
        proxy_pass http://localhost:8081;  # Прокси на GitLab
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOL

printf "Ссылка на источник: \033[33m%s\033[0m" "https://dockerhosting.ru/blog/kak-ustanovit-gitlab-ce-s-docker-v-ubuntu-23-04/"