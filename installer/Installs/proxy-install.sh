#!/bin/bash

HOST=$1
PORT=$2

if [ -n "$HOST" ] && [ -n "$PORT" ]; then
    echo "Acquire::http::Proxy \"http://$HOST:$PORT\";" | sudo tee /etc/apt/apt.conf
    echo "http_proxy=http://$HOST:$PORT" | sudo tee /etc/environment
    echo "https_proxy=http://$HOST:$PORT" | sudo tee -a /etc/environment
else
    echo "Usage: ./proxy-install.sh proxy_host proxy_port (ex. 10.11.3.112 8822)"
fi