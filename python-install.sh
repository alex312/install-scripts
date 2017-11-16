#!/bin/bash

cwd=`pwd`
pyenvPath=$HOME/python/.env
pythonEnvFile=$HOME/python/.envrc

if [ ! -d "$pyenvPath" ]; then
    mkdir -p $pyenvPath
    git clone https://github.com/pyenv/pyenv.git $pyenvPath
    
    rm -f ~/python/.envrc
    echo 'export PYENV_ROOT='$pyenvPath >> $pythonEnvFile
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $pythonEnvFile
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> $pythonEnvFile
else
    cd $pyenvPath
    git pull origin master
fi

if [ ! -d "$pyenvPath/plugins/pyenv-virtualenv" ]; then
    git clone https://github.com/pyenv/pyenv-virtualenv.git $pyenvPath/plugins/pyenv-virtualenv
    echo 'eval "$(pyenv virtualenv-init -)"' >> $pythonEnvFile
else
    cd $pyenvPath/plugins/pyenv-virtualenv
    git pull origin master
fi
cd $cwd

grep '#PYTHON' $HOME/.bashrc >>/dev/null
if [ $? -eq 0 ]; then
    line=$((`sed -n '/#PYTHON/=' $HOME/.bashrc`+1))
    sed -i $line' c source '$pythonEnvFile $HOME/.bashrc
else
    sed -i '$ a #PYTHON\nsource '$pythonEnvFile $HOME/.bashrc
fi

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev

exec "$SHELL"

