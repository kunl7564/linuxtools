#!/bin/bash
cd /home/kunl/opengrok/src/global_fire_fighting_platform
git remote update 
git checkout origin/master

cd /home/kunl/opengrok/src/tp_fire_cloud
git remote update 
git checkout origin/master

cd /home/kunl/opengrok/src/fire_cloud_v2_vue
git remote update 
git checkout origin/master

PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
echo $PATH
which ctags
which ls

java -Djava.util.logging.config.file=/home/kunl/opengrok/logging.properties -jar /home/kunl/opengrok/opengrok-1.1.2/lib/opengrok.jar -s /home/kunl/opengrok/src -d /home/kunl/opengrok/data -H -P -S -G -W /home/kunl/opengrok/etc/configuration.xml
