#/bin/bash

if [ ! -f "/etc/apt/sources.list.d/google-chrome.list" ]; then
	sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
fi

function install() {
	sudo apt-get update
	sudo apt-get install google-chrome-stable

	grep 'alias chrome=' $HOME/.bashrc
	if [ $? -eq 0 ]; then
		sed -i '/alias chrome=/c\alais chrome="x google-chrome-stable"' $HOME/.bashrc
	else
		sed -i '$a\alias chrome="x google-chrome-stable"' $HOME/.bashrc
	fi

	cp $(dirname $0)/google-chrome.desktop $HOME/.local/share/applications/

	exec "$SHELL"
}

command -v google-chrome-stable >/dev/null 2>&1 || install
