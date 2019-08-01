#!/bin/bash

DATE=`date +%Y%m%d%H%M`;
#curDate=`date +%Y-%m-%d-%H-%M`;

SVN_BAK_ROOT=/home/kunl/tpson_data/svn

time mkdir -p $SVN_BAK_ROOT
time sudo cp -r /home/svn $SVN_BAK_ROOT/bak"$DATE"

#备份成功后，就删除10天以前的备份
cd $SVN_BAK_ROOT
filename=`ls | wc | awk '{print $1}'`
#最小保留一定的数目
if [ $filename -lt 4 ];then echo "no need delete"; exit 0; else echo "let's go"; fi;
if [ $? == 0 ];then echo ok;find * -prune -name "bak[0-9]*" -mtime +15 | xargs sudo rm -rf;  else echo ==backup failed==;fi;
