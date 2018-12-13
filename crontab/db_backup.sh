#!/bin/bash

DATE=`date +%Y%m%d%H%M`;
#curDate=`date +%Y-%m-%d-%H-%M`;

BAK_ROOT=/home/kunl/important_backup/databases
BAK_DIR=$BAK_ROOT/bak"$DATE"

time mkdir -p $BAK_DIR
cd $BAK_DIR
if [ $? != 0 ];then echo "dir make failed!"; exit; fi;
echo `pwd`

mysqldump -h118.25.14.190 -P3306 -uroot -ptpson102304 tp_fire_cloud_stable > tp_fire_cloudS_stable.sql
mysqldump -h118.25.14.190 -P3306 -uroot -ptpson102304 tpson_well_cloud > tpson_well_cloud.sql
mysqldump -h118.25.14.190 -P3306 -uroot -ptpson102304 tpson_fire_cloud_ouhai > tpson_fire_cloud_ouhai.sql
mysqldump -h118.25.14.190 -P3306 -uroot -ptpson102304 tpson_fire_jinhua > tpson_fire_jinhua.sql
mysqldump -h118.25.14.190 -P3306 -uroot -ptpson102304 tpson_gateway_h3c_oasis_master > tpson_gateway_h3c_oasis_master.sql
mysqldump -h118.25.14.190 -P3306 -uroot -ptpson102304 tpson_intelligent_community > tpson_intelligent_community.sql
mysqldump -h118.25.14.190 -P3306 -uroot -ptpson102304 tpson_device_router > tpson_device_router.sql
#mysqldump -h192.168.0.70 -P3306 -uroot -ptpson test1 > test1.sql

#备份成功后，就删除14天以前的备份

cd $BAK_ROOT
if [ $? != 0 ];then echo "no dir!"; exit; fi;
echo `pwd`

if [ $? == 0 ];then echo ok;find * -prune -name "bak[0-9]*" -mtime +14 | xargs rm -rf;  else echo ==backup failed==;fi;
