#tp_fire_cloud java
cd /work/kunl/sonarqube-7.0/tpsonprojects/tp_fire_cloud
git remote update
git checkout origin/master

mvn compile
mvn sonar:sonar -Dsonar.host.url=http://47.100.63.41:9000 -Dsonar.login=e517411d30a212973013230aae0af2686887259a

#tp_fire_cloud web
cd ~/sonarqube-7.0/tpsonprojects/tp_fire_cloud/src/main/webapp 
sonar-scanner -Dsonar.projectKey=fire_web -Dsonar.sources=. -Dsonar.host.url=http://47.100.63.41:9000 -Dsonar.login=e517411d30a212973013230aae0af2686887259a


#community java
cd /work/kunl/sonarqube-7.0/tpsonprojects/intelligent_community
git remote update
git checkout origin/master

mvn compile
mvn sonar:sonar -Dsonar.host.url=http://47.100.63.41:9000 -Dsonar.login=e517411d30a212973013230aae0af2686887259a

#community web
cd ~/sonarqube-7.0/tpsonprojects/intelligent_community/src/main/webapp
sonar-scanner -Dsonar.projectKey=community_webapp -Dsonar.sources=. -Dsonar.host.url=http://47.100.63.41:9000 -Dsonar.login=e517411d30a212973013230aae0af2686887259a

