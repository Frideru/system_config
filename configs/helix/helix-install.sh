#!/bin/bash

wget https://github.com/Frideru/system_config/raw/refs/heads/main/configs/helix/hx
chmod +x hx
sudo mv hx /usr/bin

mkdir -p "$HOME/.config/helix"

cat << EOL > "$HOME/.config/helix/config.toml"
theme = "dark_plus"

[editor]
true-color = true
line-number = "relative"
bufferline = "multiple"
color-modes = true

[editor.cursor-shape]
insert = "bar"
select = "underline"
EOL

sudo mkdir -p /root/.config/helix
sudo ln -sf $HOME/.config/helix/config.toml /root/.config/helix/config.toml

echo "Helix installed!"
