curDate=`date +%Y%m%d%H%M%S`;
echo $curDate

if [ "$1" = "" ]
then
    echo "Please input job number"
    exit 255
fi

JOB=$1

cd /work/liulm/apache-tomcat-8.0.44/webapps
sudo mv epcs-service-webapp epcs-service-webapp_$curDate
sudo mkdir epcs-service-webapp
cd epcs-service-webapp
sudo wget http://182.61.39.220/jenkins/job/epcs/lastSuccessfulBuild/artifact/target/Epcs-0.0.1-"$JOB".war
sudo unzip *.war
#sudo vi /work/liulm/apache-tomcat-8.0.44/webapps/epcs-service-webapp/WEB-INF/classes/db.properties
sudo sed 's/123456/root1234/g' -i /work/liulm/apache-tomcat-8.0.44/webapps/epcs-service-webapp/WEB-INF/classes/db.properties
sudo sed 's/Kulu@123/root1234/g' -i /work/liulm/apache-tomcat-8.0.44/webapps/epcs-service-webapp/WEB-INF/classes/db.properties
tomcat_pid=`ps -aux | grep tomca[t] | awk {'print $2'} | head -n 1`
sudo kill -9 $tomcat_pid 
sleep 1
sudo /work/liulm/apache-tomcat-8.0.44/bin/startup.sh 
sudo ps -aux | grep tomcat
