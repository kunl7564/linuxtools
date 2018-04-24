sudo apt-get install apache2
sudo apt-get install php7.0-fpm php7.0-cli php-apcu php7.0-gd php7.0-xml php7.0-curl php7.0-json php7.0-mcrypt php7.0-cgi php7.0 libapache2-mod-php7.0
sudo cp wiki.conf /etc/apache2/sites-available/wiki.conf
sudo ln -s /etc/apache2/sites-available/wiki.conf /etc/apache2/sites-enabled/wiki.conf
#vi /etc/apache2/sites-available/wiki.conf
#vi /etc/apache2/ports.conf
sudo mv /etc/apache2/ports.conf /etc/apache2/back_ports.conf
sudo cp ports.conf /etc/apache2/ports.conf
sudo service apache2 restart
