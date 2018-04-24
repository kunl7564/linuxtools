#!/bin/bash

DATE=`date +%Y%m%d%H%M`;
#curDate=`date +%Y-%m-%d-%H-%M`;

time sudo mkdir -p /work/kunl/backup/wiki/ 
time sudo cp -r /var/www/kuluwiki /work/kunl/backup/wiki/kuluwiki_"$DATE"
time sudo chmod -R 777 /work/kunl/backup/wiki/kuluwiki_"$DATE"
