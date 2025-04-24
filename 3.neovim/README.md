## Neovim installation
### Способ AppImage (Универсальный)
The Releases page provides an AppImage that runs on most Linux systems. No installation is needed, just download nvim.appimage and run it. (It might not work if your Linux distribution is more than 4 years old.)

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```

If the `./nvim.appimage` command fails, try:

```bash
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally.
mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim
```

[Source](https://github.com/neovim/neovim/wiki/Installing-Neovim/921fe8c40c34dd1f3fb35d5b48c484db1b8ae94b)

### Способ через Curl
The Releases page provides pre-built binaries for Linux systems.

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

Then add this to your shell config (~/.bashrc, ~/.zshrc, ...):
`export PATH="$PATH:/opt/nvim-linux-x86_64/bin"`

[Source](https://github.com/neovim/neovim/blob/master/INSTALL.md)

## Packer installation
`git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim`

[Source](https://github.com/wbthomason/packer.nvim)
