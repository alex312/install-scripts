#!/bin/bash
# Install and Config git

command -v git >/dev/null 2>&1 || {
echo >&2 "Install git";
sudo apt-get install git;
}

git version;

wget https://github.com/git-lfs/git-lfs/releases/download/v2.3.4/git-lfs-linux-amd64-2.3.4.tar.gz -O $HOME/下载/git-lfs.tar.gz
if [ ! -d $HOME/tartmp ];then
    mkdir $HOME/tartmp
fi
tmp=`tar -zvxf $HOME/下载/git-lfs.tar.gz -C $HOME/tartmp | sed -n '$p'`
dir=${tmp%%/*}
echo $dir
sudo bash $HOME/tartmp/$dir/install.sh

rm -rf $HOME/tartmp
