#!/bin/bash

DATE=`date +%Y%m%d%H%M`;
#curDate=`date +%Y-%m-%d-%H-%M`;

GERRIT_BAK_ROOT=/home/kunl/important_backup/gerrit

time mkdir -p $GERRIT_BAK_ROOT
#time rm -rf $GERRIT_BAK_ROOT/"$DATE"
time scp -r kunl@182.61.39.220:/work/gerrit/ $GERRIT_BAK_ROOT/bak"$DATE"
#time scp -r kunl@182.61.39.220:/work/kunl/ss $GERRIT_BAK_ROOT/bak"$DATE"

#备份成功后，就删除14天以前的备份
cd $GERRIT_BAK_ROOT
if [ $? == 0 ];then echo ok;find * -prune -name "bak[0-9]*" -mtime +7 | xargs rm -rf;  else echo ==backup failed==;fi;
