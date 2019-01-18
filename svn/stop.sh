pid=`ps -ax | grep svnserve | awk {'print $1'} | head -n 1`
echo svnpid=$pid
kill -9 $pid
