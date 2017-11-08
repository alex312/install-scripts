#/bin/bash

sudo apt-get update
sudo apt-get install build-essential libssl-dev

source ~/.bashrc
command -v nvm
if [ ! $? -eq 0 ]; then
    wget -qO- "https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.shi" | bash
fi

source ~/.bashrc
command -v nvm
