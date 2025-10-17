#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

printf "Смотри \033[33m%s\033[0m для большей информации\n" "https://rust-lang.org/ru/tools/install/"
printf "Если хочешь удалить Rust: \033[33m%s\033[0m\n" "rustup self uninstall"