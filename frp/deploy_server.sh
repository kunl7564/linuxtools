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
	cp tpson_server.service /lib/systemd/system/
else 
	cp tpson_server.service /usr/lib/systemd/system/
fi

systemctl status tpson_server > /dev/null
if [ "$?" == "0" ]; then
	systemctl stop tpson_server
fi

cp tpson_server.service $HOME
cp tpson_server.ini $HOME
cp tpson_server $HOME

systemctl daemon-reload
systemctl enable tpson_server
systemctl restart tpson_server

if [ "$?" == "0" ]; then
	echo success
	ps -aux | grep tpson_server
else
	echo failed
fi
#/home/tpson/netproxy/tpson_server -c /home/tpson/netproxy/tpson_server.ini
