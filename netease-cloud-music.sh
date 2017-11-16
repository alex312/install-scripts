#!/bin/bash

which netease-cloud-music |grep netease-cloud-music
if [ ! $? -eq 0 ]; then
    wget http://s1.music.126.net/download/pc/netease-cloud-music_1.0.0-2_amd64_ubuntu16.04.deb -O $HOME/下载/netease-cloud-music.deb
    sudo dpkg -i $HOME/下载/netease-cloud-music.deb
    sudo apt-get install -f
fi

grep 'alias netease-music=' $HOME/.bashrc >/dev/null
if [ $? -eq 0 ]; then
    echo update bashrc
    sed -i '/^alias netease-music=/c alias netease-music="x netease-cloud-music"' $HOME/.bashrc
else
    sed -i '$ alias netease-music="x netease-cloud-music"' $HOME/.bashrc
fi

exec "$SHELL"