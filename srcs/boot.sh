apt-get -y update
apt-get -y upgrade
apt-get install -y nginx
apt-get -y install mariadb-server
apt-get -y install wget
apt-get -y install php php-fpm php-mysql php-common php-cli php-common php-json php-opcache php-readline


wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz

mkdir -p /var/www/localhost
cp /localhost-conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/default

#DATABASE SETUP
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
cd
mysql wordpress -u root --password=  < wordpress.sql

#WORDPRESS INSTALL
cd
cp wordpress.tar.gz /var/www/localhost/
cd /var/www/localhost/
tar -xf wordpress.tar.gz
rm wordpress.tar.gz

chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

/etc/init.d/php7.3-fpm start
service nginx restart
service mysql start