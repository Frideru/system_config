## Neovim install
```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
```
### Then add this to your shell config (~/.bashrc, ~/.zshrc, ...):
```sh
export PATH="$PATH:/opt/nvim-linux64/bin"
```
## "Packer" install 
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
### Then go to ~/.config/nvim/lua/plugins.lua and write :PackerSync
