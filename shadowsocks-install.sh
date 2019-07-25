#!/bin/bash

user=$(env | grep "^USER=" | cut -d "=" -f 2)

if [ "$user" != "root" ]; then
    echo "需要以 root 身份运行"
    exit 1
fi

PKG_INFO=$(dpkg -l | grep shadowsocks)

if [ "$PKG_INFO" == "" ]; then
    echo "安装shadowsocks"
    apt-get install -y shadowsocks
fi


if [ ! -d "~/etc" ]; then
    mkdir -p ~/etc
fi

cat > ~/etc/shadowsocks.json << EOF
{
    "server":"45.63.27.182",
    "server_port":61018,
    "local_port":1080,
    "timeout":300,
    "method":"aes-256-cfb",
    "password":"&*!@qaZwsXalex"
}
EOF

grep "^\s*sslocal -c" /etc/rc.local
if [ $? -eq 0 ]; then
    sed -i -e "/^\s*sslocal -c/s|\s*sslocal\s*-c\s*.*$|sslocal -c $HOME/etc/shadowsocks.json|g" /etc/rc.local
else
    sed -i "/^\s*exit\s*0/i sslocal -c $HOME/etc/shadowsocks.json" /etc/rc.local
fi

PKG_INFO=$(dpkg -l | grep privoxy)
if [ "$PKG_INFO" == "" ]; then
    apt-get install -y privoxy
fi

sed -i '/^\s*forward-socks5/d'
echo forward-socks5 / 127.0.0.1:1080 . >> /etc/privoxy/config

sed -i '/^\s*export\s*https\?_proxy=/d' /etc/profile
sed -i '/^\s*export\s*HTTPS\?_PROXY=/d' /etc/profile

proxy_url=http://127.0.0.1:8118
echo export http_proxy=$proxy_url >> /etc/profile
echo export https_proxy=$proxy_url >> /etc/profile
echo export HTTP_PROXY=$proxy_url >> /etc/profile
echo export HTTPS_PROXY=$proxy_url >> /etc/profile

istart=Y                                                                    
while true; do
    
    echo "是否立即启动shadowsocks?(Y/n):" & read istart
    if echo $istart | grep ^[yYnN]$ 2>&1 >/dev/null; then
        break
    fi

done

if echo $istart | grep ^[yY]$ 2>&1 >/dev/null; then
    systemctl restart privoxy
    nohup sslocal -c $HOME/etc/shadowsocks.json & 
fi

source /etc/profile
