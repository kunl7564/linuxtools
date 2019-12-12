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
cd ~/sonarqube-7.0/tpsonprojects/tpong_device_router_protocol/
git remote update
git checkout origin/master
mvn compile
mvn sonar:sonar \
  -Dsonar.host.url=http://47.100.63.41:9000 \
  -Dsonar.login=2b30497e192a5c0ecd40fd430306a3f33361d64b

##mercury_backend
cd ~/sonarqube-7.0/tpsonprojects/mercury_backend /
git remote update
git checkout origin/master
mvn compile
mvn sonar:sonar \
  -Dsonar.host.url=http://sonar.tpson.cn \
  -Dsonar.login=190aace8014a7c90a86568e81d1d78a3a717cbb8

##elec_maintenance
cd ~/sonarqube-7.0/tpsonprojects/elec_maintenance/platform-parent/
git remote update
git checkout origin/master
mvn compile
mvn sonar:sonar \
  -Dsonar.host.url=http://sonar.tpson.cn \
  -Dsonar.login=84cfc1c4eb78786192bd0a6d83c527e5e5e6582b

##global_fire_fighting_platform
#cd ~/sonarqube-7.0/tpsonprojects/global_fire_fighting_platform/
#git remote update
#git checkout origin/master
#cd platform-parent
#mvn compile
#mvn sonar:sonar \
#  -Dsonar.host.url=http://47.100.63.41:9000 \
#  -Dsonar.login=611721865e8be0163615c20b976458f1c74121d0


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

