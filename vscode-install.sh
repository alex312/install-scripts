#/bin/bash

set downloaddir=~/下载

# 先检查vscode是否已经被下载过
ls $downloaddir |grep '^vscode.tar.gz$'

if [ $? == 0 ]; then
    rm ${downloaddir}/vscode.deb
fi


wget -O ~/下载/vscode.deb https://vscode.cdn.azure.cn/stable/b813d12980308015bcd2b3a2f6efa5c810c33ba5/code_1.17.2-1508162334_amd64.deb

sudo dpkg -i ~/下载/vscode.deb
