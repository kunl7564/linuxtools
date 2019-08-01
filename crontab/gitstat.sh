#!/bin/bash
DAY=`date +%Y-%m-%d`;
TIME=`date +%H:%M:%S`;
YEAR=`date +%Y`;
MONTH=`date +%Y-%m`;
WEEK=`date +%u`
NOW=$DAY'\ '$TIME

DAY_START=$DAY'\ 0:0:0'
DAY_END=$NOW

let WEEK_OFFSET=$WEEK+1
WEEK_DAY=`date -d "$WEEK_OFFSET day ago" +%Y-%m-%d`
WEEK_START=$WEEK_DAY'\ 0:0:0'
WEEK_END=$NOW

MONTH_START=$MONTH'-01\ 0:0:0'
MONTH_END=$NOW

YEAR_START=$YEAR'-01-01\ 0:0:0'
YEAR_END=$NOW

GERRIT_ROOT=/work/gerrit/gerrit_site/git
GITSTATS_ROOT=/work/gerrit/gitstats
GITSTATS_DAY=$GITSTATS_ROOT/day
GITSTATS_WEEK=$GITSTATS_ROOT/week
GITSTATS_MONTH=$GITSTATS_ROOT/month
GITSTATS_YEAR=$GITSTATS_ROOT/year
sudo mkdir -p $GITSTATS_DAY $GITSTATS_WEEK $GITSTATS_MONTH $GITSTATS_YEAR

#统计当天
sudo gitstats -c start_date="$DAY_START" -c end_date="$DAY_END" $GERRIT_ROOT/[^A]*.git  $GITSTATS_DAY
#统计上周末到本周当天
sudo gitstats -c start_date="$WEEK_START" -c end_date="$WEEK_END" $GERRIT_ROOT/[^A]*.git  $GITSTATS_WEEK
#统计本月
sudo gitstats -c start_date="$MONTH_START" -c end_date="$MONTH_END" $GERRIT_ROOT/[^A]*.git  $GITSTATS_MONTH
#统计本年
sudo gitstats -c start_date="$YEAR_START" -c end_date="$YEAR_END" $GERRIT_ROOT/[^A]*.git  $GITSTATS_YEAR


#sudo gitstats -c start_date=2018-3-30 -c end_date=2018-3-30 /work/gerrit/gerrit_site/git/tp_fire_cloud.git tmp

echo $DAY_START $DAY_END
echo $WEEK_START $WEEK_END
echo $MONTH_START $MONTH_END
echo $YEAR_START $YEAR_END
