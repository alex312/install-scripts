#/bin/bash

sudo apt-get update
sudo apt-get install build-essential libssl-dev

source ~/.bashrc
command -v nvm || {
    wget -qO- "https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.shi" | bash
}

source ~/.bashrc
command -v nvm
