#!/bin/bash

sudo grep -rl "hzwhuang/ss-qt5" /etc

if [ "$?" -eq 1 ]; then
    sudo add-apt-repository ppa:hzwhuang/ss-qt5
    sudo apt-get update
    sudo apt-get install shadowsocks-qt5
fi
