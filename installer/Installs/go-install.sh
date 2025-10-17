#!/bin/bash

#wget https://go.dev/dl/go1.25.3.linux-amd64.tar.gz

CURRENT=$(curl --silent https://go.dev/VERSION?m=text | head -n 1)
lscpu | grep ARM 1>/dev/null && ARCH=arm64 || ARCH=amd64
curl -O https://dl.google.com/go/${CURRENT}.linux-${ARCH}.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf ${CURRENT}.linux-${ARCH}.tar.gz

while true; do
    read -p "Установить PATH в .bashrc? (y/n): " yn
    case $yn in
        [Yy]* )
            echo "Устанавливается."
            echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc
            break
            ;;
        [Nn]* )
            echo "Завершение обновления."
            break
            ;;
        * )
            echo "Введите y или n."
            ;;
    esac
done

rm ${CURRENT}.linux-${ARCH}.tar.gz
printf "Выполни \033[33m%s\033[0m и проверь установку Go с помощью \033[33m%s\033[0m\n" "source $HOME/.bashrc" "go version"

printf "Смотри \033[33m%s\033[0m для большей информации\n" "https://go.dev/doc/install"