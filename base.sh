#!/bin/bash

function install_x() {
	if [ ! -d $HOME/bin ]; then
		mkdir $HOME/bin
	fi

	echo '#!/bin/bash' >>$HOME/bin/x
	echo '"$@" 1>/dev/null 2>&1 &' >>$HOME/bin/x
	chmod +x $HOME/bin/x
}

command -v x >/dev/null 2>&1 || install_x

grep "alias ll=" $HOME/.bashrc >/dev/null
if [ $? -eq 0 ]; then
	sed -i '/^alias ll=/c\alias ll="ls -alFh"' $HOME/.bashrc
else
	sed -i '$a\alias ll="ls -alFh"' $HOME/.bashrc
fi

DL_DIR=$HOME/下载

wget 'http://kdl1.cache.wps.com/ksodl/download/linux/a21//wps-office_10.1.0.5707~a21_amd64.deb' -O $DL_DIR/wps-office.deb
sudo dpkg -i $DL_DIR/wps-office.deb
sudo apt-get install -f

wget 'http://kdl.cc.ksosoft.com/wps-community/download/fonts/wps-office-fonts_1.0_all.deb' $DL_DIR/wps-office-fonts.deb
sudo dpkg -i $DL_DIR/wps-office-fonts.deb
sudo apt-get install -f

wget 'http://cdn2.ime.sogou.com/dl/index/1509619794/sogoupinyin_2.2.0.0102_amd64.deb?st=nwMOF9j7R0arpmasfKw9JA&e=1511109222&fn=sogoupinyin_2.2.0.0102_amd64.deb' \
	-O $DL_DIR/sogoupinyin.deb
sudo dpkg -i $DL_DIR/sogoupinyin.deb
sudo apt-get install -f

sudo apt-get purge -y libreoffice-common unity-webapps-common rhythmbox brasero \
	simple-scan gnome-mahjongg empathy aisleriot gnome-mines \
	cheese transmission-common gnome-orca webbrowser-app gnome-sudoku \
	landscape-client-ui-install

sudo apt-get autoremove
sudo apt-get autoclean

command -v shfmt ||
	{
		sudo wget 'https://github.com/mvdan/sh/releases/download/v2.0.0/shfmt_v2.0.0_linux_amd64' -O /usr/bin/shfmt
		sudo chmod +x /usr/bin/shfmt
	}
