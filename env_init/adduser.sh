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

sudo mkdir /home/$USERNAME
#sudo chown $USERNAME:$USERNAME /home/$USERNAME
sudo chmod 755 /home/$USERNAME

sudo ln -s /home/$USERNAME /home/$USERNAME
#sudo chown $USERNAME:$USERNAME /home/$USERNAME

sudo cp -n /home/kunl/tools/env_init/.bashrc /home/$USERNAME
sudo chown -R $USERNAME:$USERNAME /home/$USERNAME
