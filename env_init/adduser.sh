#!/bin/bash

if [ "$1" = "" ]
then
    echo please input username
    exit 255
fi
USERNAME=$1
echo $USERNAME

sudo useradd $USERNAME 
sudo passwd $USERNAME

sudo mkdir /work/$USERNAME
#sudo chown $USERNAME:$USERNAME /work/$USERNAME
sudo chmod 755 /work/$USERNAME

sudo ln -s /work/$USERNAME /home/$USERNAME
#sudo chown $USERNAME:$USERNAME /home/$USERNAME

sudo cp -n /work/kunl/tools/env_init/.bashrc /work/$USERNAME
sudo chown -R $USERNAME:$USERNAME /work/$USERNAME
