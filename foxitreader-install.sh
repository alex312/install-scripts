#!/bin/bash

command -v FoxitReader >/dev/null 2>&1 || {
	wget 'http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.4/en_us/FoxitReader2.4.1.0609_Server_x64_enu_Setup.run.tar.gz' \
		-O $HOME/下载/foxitreader.tar.gz
	mkdir -p $HOME/tartmp
	tar -zvxf $HOME/下载/foxitreader.tar.gz -C $HOME/tartmp/
	runfile=$(ls $HOME/tartmp/ | grep "FoxitReader\S*.run$")

	if grep 'FoxitReader' $HOME/.bashrc >/dev/null 2>&1; then
		sed -i '/alias freader=/c\alias freader="x FoxitReader"' $HOME/.bashrc
	else
		sed -i '$a\alias freader="x FoxitReader"' $HOME/.bashrc
	fi

	rm $HOME/tartmp -Rf
}
