#!/bin/bash

sudo cp promtail /usr/local/bin/

sudo mkdir -p /etc/promtail/
sudo touch /etc/promtail/promtail.yaml

sudo cat << EOL > "/etc/promtail/promtail.yaml"
server:
  http_listen_port: 9080
  grpc_listen_port: 0

positions:
  filename: /var/log/positions.yaml

clients:
  - url: http://10.11.3.177:3100/loki/api/v1/push

scrape_configs:
  - job_name: system
    static_configs:
    - targets:
        - localhost
      labels:
        job: varlogs
        __path__: /var/log/*log

  - job_name: nginx_access
    static_configs:
      - targets:
          - localhost
        labels:
          job: nginx_access_logs
          __path__: /var/log/nginx/access.log # Adjust path if different
          environment: production
          service: nginx
    pipeline_stages:
      - regex:
          expression: '^(?P<ip>\S+) - (?P<user>\S+) \[(?P<time>[^\]]+)\] "(?P<method>\S+) (?P<uri>\S+) (?P<protocol>\S+)" (?P<status>\d+) (?P<bytes_sent>\d+) "(?P<referer>[^"]*)" "(?P<user_agent>[^"]*)"'
      - labels:
          ip:
          user:
          method:
          uri:
          status:

  - job_name: nginx_error
    static_configs:
      - targets:
          - localhost
        labels:
          job: nginx_error_logs
          __path__: /var/log/nginx/error.log # Adjust path if different
          environment: production
          service: nginx
          level: error
EOL

sudo touch /etc/systemd/system/promtail.service

sudo cat << EOL > "/etc/systemd/system/promtail.service"
[Unit]
Description=Promtail log collector
After=network.target

[Service]
Type=simple
User=root
ExecStart=/usr/local/bin/promtail -config.file=/etc/promtail/promtail.yaml
Restart=always
RestartSec=5s
User=root
Group=root

[Install]
WantedBy=multi-user.target
EOL
