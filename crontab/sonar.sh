#tp_fire_cloud java
cd /work/kunl/sonarqube-7.0/tpsonprojects/tp_fire_cloud
git remote update
git checkout origin/master
mvn compile
mvn sonar:sonar -Dsonar.host.url=http://47.100.63.41:9000 -Dsonar.login=e517411d30a212973013230aae0af2686887259a

#tp_fire_cloud web
#cd ~/sonarqube-7.0/tpsonprojects/tp_fire_cloud/src/main/webapp 
#sonar-scanner -Dsonar.projectKey=fire_web -Dsonar.sources=. -Dsonar.host.url=http://47.100.63.41:9000 -Dsonar.login=e517411d30a212973013230aae0af2686887259a

##tpson_device_rooter java
#cd ~/sonarqube-7.0/tpsonprojects/tpson_device_router/
#git remote update
#git checkout origin/dev
#mvn compile
#mvn sonar:sonar -Dsonar.host.url=http://47.100.63.41:9000 -Dsonar.login=4f8e7a5f22f055ebfbbaea2eb471a0aceabeeaed

##tpong_device_router_protocol java
#cd ~/sonarqube-7.0/tpsonprojects/tpong_device_router_protocol/
#git remote update
#git checkout origin/master
#mvn compile
#mvn sonar:sonar -Dsonar.host.url=http://47.100.63.41:9000 -Dsonar.login=a604c693994539344f6e1f697ffea4ae605c52ca

##device_config_module java
#cd ~/sonarqube-7.0/tpsonprojects/iot_device_config_module/
#git remote update
#git checkout origin/master
#mvn compile
#mvn sonar:sonar \
#  -Dsonar.host.url=http://sonar.tpson.cn \
#  -Dsonar.login=baa4457b2287fbdbe2d73e817a92b30faf8b53e0

#community java
#cd /work/kunl/sonarqube-7.0/tpsonprojects/intelligent_community
#git remote update
#git checkout origin/master
#mvn compile
#mvn sonar:sonar -Dsonar.host.url=http://47.100.63.41:9000 -Dsonar.login=e517411d30a212973013230aae0af2686887259a

#community web
#cd ~/sonarqube-7.0/tpsonprojects/intelligent_community/src/main/webapp
#sonar-scanner -Dsonar.projectKey=community_webapp -Dsonar.sources=. -Dsonar.host.url=http://47.100.63.41:9000 -Dsonar.login=e517411d30a212973013230aae0af2686887259a

