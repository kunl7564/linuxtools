#!/bin/bash

#force to run iptables
isForce=0
#run as master or slave mode
isMaster=0
currentDate=`date +%Y%m%d`;

while getopts "mfr:" arg #选项后面冒号表示该选项需要参数
do
    case $arg in
        m)
            echo "run as master" #参数存在$OPTARG中
			isMaster=1
            ;;
        f)
            echo "force to run no matter whitelist change"
			isForce=1
            ;;
		r)
            echo "reserved para is $OPTARG"
            ;;
        ?)
            echo "unkonw argument"
            exit 1
        ;;
    esac
done

if [ "$isMaster" == "1" ]; then
	ROOT_DIR=/home/guest/iptable_config
else 
	ROOT_DIR=/home/kunl/iptable_config
fi

IP_WHITELIST=$ROOT_DIR/whitelist
# interface for other scripts
DYNAMIC_IP_WHITELIST=$ROOT_DIR/ip.txt
if [ -f $DYNAMIC_IP_WHITELIST ]; then echo "dynamic ip.txt exist"; else touch $DYNAMIC_IP_WHITELIST; fi;

PORT_LIST=$ROOT_DIR/portlist

LAST_IP_WHITELIST=$ROOT_DIR/.last_whitelist
LAST_PORT_LIST=$ROOT_DIR/.last_portlist

whitelist=`sudo cat $DYNAMIC_IP_WHITELIST $IP_WHITELIST`
last_whitelist=`sudo cat $LAST_IP_WHITELIST`
portlist=`sudo cat $PORT_LIST`
last_portlist=`sudo cat $LAST_PORT_LIST`

#for port in $portlist
#do
#isnum=`echo ${port:0:1} | grep [0-9]`;if [ "$isnum" == "" ]; then continue; else echo $port; fi; 
#done
#exit 0

if [ "$whitelist" == "" ]
then
	sudo iptables -F tpson 
	echo "clear iptables";
	exit 0;
fi


if [ "$whitelist" == "$last_whitelist" ] && [ "$portlist" == "$last_portlist" ]
then
	echo "no ip_whitelist change";
	if [ "$isForce" == "1" ]; then
		echo "force to run"
		else 
		exit 0;
	fi
fi;

if [ "$isMaster" == "1" ]; then
	#copy to slave server
	scp $PORT_LIST kunl@118.25.14.190:/home/kunl/iptable_config
	scp $IP_WHITELIST kunl@118.25.14.190:/home/kunl/iptable_config
	scp $PORT_LIST kunl@fire.tpson.cn:/home/kunl/iptable_config
	scp $IP_WHITELIST kunl@fire.tpson.cn:/home/kunl/iptable_config
fi


#clear current rule and close specific port
echo "clear current iptables";
sudo iptables -F tpson 
echo "close ports";

for port in $portlist
do
	isnum=`echo ${port:0:1} | grep [0-9]`;if [ "$isnum" == "" ]; then continue; else echo "close $port"; fi;
	sudo iptables -I tpson -p tcp --dport $port -j DROP
done


#allow specific ip to access restricted ports
sudo cat $DYNAMIC_IP_WHITELIST $IP_WHITELIST | while read ipline;
do
	isnum=`echo ${ipline:0:1} | grep [0-9]`;if [ "$isnum" == "" ]; then continue; fi;
	validDate=`echo $ipline | awk '{print $2}'`	
	#有效期小于当前时间,过期
	if [ "$validDate" == "" ] || [ $currentDate -le $validDate ]; then echo $ipline valid!; else continue;fi;
	ip=`echo $ipline | awk '{print $1}'`
	#open specific ip
	for port in $portlist
	do 
		isnum=`echo ${port:0:1} | grep [0-9]`;if [ "$isnum" == "" ]; then continue; fi;
		echo "open $ip $port"
		sudo iptables -s $ip -I tpson -p tcp --dport $port -j ACCEPT
	done
done

#handle nginx case
NGINX_IPTABLE="/etc/nginx/conf.d/iptable.cfg"
if [ -f "$NGINX_IPTABLE" ]
then
	#clear current iptable.cfg
        sudo echo "" > $NGINX_IPTABLE
	sudo cat $DYNAMIC_IP_WHITELIST $IP_WHITELIST | while read ipline;
	do
	        isnum=`echo ${ipline:0:1} | grep [0-9]`;if [ "$isnum" == "" ]; then continue; fi;
	        validDate=`echo $ipline | awk '{print $2}'`
	        #有效期小于当前时间,过期
	        if [ "$validDate" == "" ] || [ $currentDate -le $validDate ]; then echo $ipline valid!;else continue;fi;
	        ip=`echo $ipline | awk '{print $1}'`
		sudo echo "allow $ip;" >> $NGINX_IPTABLE
	done

	sudo echo "deny all;" >> $NGINX_IPTABLE

	sudo nginx -t
	if [ "$?" == "0" ]
	then
		echo "reload nginx"
		sudo nginx -s reload
	else
		#something wrong, roll back
		sudo echo "" > $NGINX_IPTABLE
	fi;
fi;

sudo cat $DYNAMIC_IP_WHITELIST $IP_WHITELIST > $LAST_IP_WHITELIST
sudo cat $PORT_LIST > $LAST_PORT_LIST
