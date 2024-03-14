#!/bin/bash

url="https://github.com/traccar/traccar/releases/download/v5.12/traccar-linux-64-5.12.zip"

wget -O traccar.zip "${url}"
unzip traccar.zip && chmod +x traccar.run

service mysql stop && service traccar stop

mv /opt/traccar /opt/traccar-old_$(date +"%Y-%m-%d")
./traccar.run
cp /home/ubuntu/traccar.xml /opt/traccar/conf/traccar.xml

service mysql start && service traccar start