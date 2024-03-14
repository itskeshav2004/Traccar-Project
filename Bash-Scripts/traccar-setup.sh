#!/bin/bash

MYSQL_ROOT_PASSWORD="YOUR_ROOT_PASS"
MYSQL_DB_NAME="YOUR_DB_NAME"
MYSQL_USER="USER_NAME"
MYSQL_PASSWORD="USER_PASSWORD"
url="https://github.com/traccar/traccar/releases/download/v5.12/traccar-linux-64-5.12.zip"

apt update && apt install wget unzip mysql-server -y

wget -O traccar.zip "${url}"

unzip traccar.zip && chmod +x traccar.run
./traccar.run

cp /home/ubuntu/traccar.xml /opt/traccar/conf/traccar.xml

sudo mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

service mysql restart && service traccar restart