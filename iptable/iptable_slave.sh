#!/bin/bash
ROOT_DIR=/home/kunl/iptable_config
IP_WHITELIST=$ROOT_DIR/whitelist
PORT_LIST=$ROOT_DIR/portlist

LAST_IP_WHITELIST=$ROOT_DIR/last_whitelist
LAST_PORT_LIST=$ROOT_DIR/last_portlist

whitelist=`sudo cat $IP_WHITELIST`
last_whitelist=`sudo cat $LAST_IP_WHITELIST`
portlist=`sudo cat $PORT_LIST`
last_portlist=`sudo cat $LAST_PORT_LIST`


if [ "$whitelist" == "" ]
then
sudo iptables -F tpson 
echo "clear iptables";
exit 0;
fi


if [ "$whitelist" == "$last_whitelist" ] && [ "$portlist" == "$last_portlist" ]
then
echo "no ip_whitelist change";
exit 0;
fi;

#clear current rule and close specific port
echo "clear current iptables";
sudo iptables -F tpson 
echo "close ports";

for port in $portlist
do
isnum=`echo ${port:0:1} | grep [0-9]`;if [ "$isnum" == "" ]; then continue; else echo "close $port"; fi;
sudo iptables -I tpson -p tcp --dport $port -j DROP
done


for ip in $whitelist
do

isnum=`echo ${ip:0:1} | grep [0-9]`;if [ "$isnum" == "" ]; then continue; fi;
#open specific ip
for port in $portlist
do
isnum=`echo ${port:0:1} | grep [0-9]`;if [ "$isnum" == "" ]; then continue; else echo "open $ip $port"; fi;
sudo iptables -s $ip -I tpson -p tcp --dport $port -j ACCEPT
done

done

sudo cat $IP_WHITELIST > $LAST_IP_WHITELIST
sudo cat $PORT_LIST > $LAST_PORT_LIST
