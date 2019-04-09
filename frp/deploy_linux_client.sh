#!/bin/bash

HOME=/home/tpson/netproxy/

if [ ! -f "$HOME" ]; then
	mkdir -p $HOME
fi

IS_UBUNTU=0

if [ -f "/etc/lsb-release" ]; then
	IS_UBUNTU=1
	echo OS=ubuntu
else
	IS_UBUNTU=0
	echo OS=centos
fi

if [ "$IS_UBUNTU" == "1" ]; then
	cp tpson_client.service /lib/systemd/system/
else 
	cp tpson_client.service /usr/lib/systemd/system/
fi

systemctl status tpson_client > /dev/null
if [ "$?" == "0" ]; then
	systemctl stop tpson_client
fi

cp tpson_client.service $HOME
cp tpson_client.ini $HOME
cp tpson_client $HOME

systemctl daemon-reload
systemctl enable tpson_client
systemctl restart tpson_client

if [ "$?" == "0" ]; then
	echo success
	ps -aux | grep tpson_client
else
	echo failed
fi
#/home/tpson/netproxy/tpson_client -c /home/tpson/netproxy/tpson_client.ini
