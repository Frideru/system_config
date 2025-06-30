# Полное развертывание NeoVim

**Установка NeoVim**
1. [Зайти на сайт](https://github.com/neovim/neovim/releases/)
2. Скачать нужный AppImage
3. Сделать его исполняемым `chmod +x ./nvim-linux-x86_64.appimage`
4. Переместить в `/usr/bin/` как `sudo mv ./nvim-linux-x86_64.appimage /usr/bin/nvim`
5. Скопировать папку `nvim` в `~/.config/`
6. Выполнить команду 
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
7. Зайти в NeoVim и выполнить `:PackerSync`

Вот и все!

## Дела на потом:
- [ ] Взять скрипт для автоматической установки neovim
- [ ] Автоматически устанавливать packer, если установился neovim
