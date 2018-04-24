sudo iptables -N tpson
sudo iptables -C INPUT -j tpson


if [ $? == 0 ];
then 
echo "already initialized"; 
else
sudo iptables -I INPUT -j tpson;
echo "initialized ok"
fi;
