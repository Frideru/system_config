[rofi theme](https://github.com/catppuccin/rofi/tree/main/basic)
## Neovim install
https://github.com/neovim/neovim/blob/master/INSTALL.md
```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```
### Then add this to your shell config (~/.bashrc, ~/.zshrc, ...):
```sh
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```
## "Packer" install 
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
### Then go to ~/.config/nvim/lua/plugins.lua and write :PackerSync
