#/bin/bash

if [ ! -f "/etc/apt/sources.list.d/google-chrome.list" ]; then
    sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
fi

if [ ! `command -v google-chrome-stable` ]; then
    sudo apt-get update
    sudo apt-get install google-chrome-stable
fi