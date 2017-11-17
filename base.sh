#!/bin/bash

function install_x {
    if [ ! -d $HOME/bin ];then
        mkdir $HOME/bin
    fi

    echo '#!/bin/bash' >> $HOME/bin/x
    echo '"$@" 1>/dev/null 2>&1 &' >> $HOME/bin/x
    chmod +x $HOME/bin/x
}

command -v x >/dev/null 2>&1 || install_x

grep "alias ll=" $HOME/.bashrc >/dev/null
if [ $? -eq 0 ]; then
    sed -i '/^alias ll=/c\alias ll="ls -alFh"' $HOME/.bashrc
else
    sed -i '$a\alias ll="ls -alFh"' $HOME/.bashrc
fi