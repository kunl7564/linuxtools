sudo ps -aux | grep tomcat
tomcat_pid=`ps -aux | grep tomca[t] | awk {'print $2'} | head -n 1`
sudo kill -9 $tomcat_pid 
sleep 1
sudo /work/liulm/apache-tomcat-8.0.44/bin/startup.sh 
sudo ps -aux | grep tomcat
