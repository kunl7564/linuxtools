#!/bin/bash

DATE=`date +%Y%m%d%H%M`;
#curDate=`date +%Y-%m-%d-%H-%M`;

GERRIT_BAK_ROOT=/home/kunl/tpson_data/gerrit

time mkdir -p $GERRIT_BAK_ROOT
#time rm -rf $GERRIT_BAK_ROOT/"$DATE"
time scp -r root@review.tpson.cn:/work/gerrit/gerrit_site $GERRIT_BAK_ROOT/bak"$DATE"

#备份成功后，就删除10天以前的备份
cd $GERRIT_BAK_ROOT
filename=`ls | wc | awk '{print $1}'`
#最小保留一定的数目
if [ $filename -lt 4 ];then echo "no need delete"; exit 0; else echo "let's go"; fi;
if [ $? == 0 ];then echo ok;find * -prune -name "bak[0-9]*" -mtime +15 | xargs sudo rm -rf;  else echo ==backup failed==;fi;
