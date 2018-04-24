#!/bin/bash

#filename=`date +%Y-%m-%d-%H-%M-%S`;
curDate=`date +%Y-%m-%d-%H-%M`;

#sync with github
cd /work/kunl/github/pbett_work/
#git fetch
git reset --hard HEAD
git clean -df 
#git checkout origin/master


for file in `sudo cat /work/kunl/tools/crontab/tpson_backup_list`; 
do 
	out_file=`basename $file`.des3
	time sudo tar -czvf - $file | openssl des3 -salt -k tpsonkunl| dd of=/work/kunl/tmp/$out_file
	sudo cp /work/kunl/tmp/$out_file /work/kunl/github/pbett_work/
done;

for file in `sudo cat /work/kunl/tools/crontab/env_backup_list`; 
do 
	out_file=`basename $file`.des3
	echo $out_file=====$file
	time sudo tar -czvf - $file | openssl des3 -salt -k tpsonkunl| dd of=/work/kunl/tmp/$out_file
	sudo cp /work/kunl/tmp/$out_file /work/kunl/github/pbett_work/
done;

#exit
#push to github
cd /work/kunl/github/pbett_work/
git add -A .
git commit -m "$curDate"
git push -u origin master

#dd if=env.des3 | openssl des3 -d -k pbett123 | tar xvzf -
#dd if=tpson.des3 | openssl des3 -d -k tpsonkunl | tar xvzf -
#http://blog.csdn.net/guolb57/article/details/6697812

