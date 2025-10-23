#!/bin/bash
cd $HOME
wget https://github.com/Frideru/system_config/raw/refs/heads/main/configs/.vimrc
sudo ln -s $HOME/.vimrc /root/.vimrc
echo "Done!"