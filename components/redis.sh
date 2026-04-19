#!/bin/bash

source components/common.sh

Apt_updates

Download_services

Head "Install redis server"
apt install redis-server &>>$Log
status $?

Head "Define config settings"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf
status $?

Head "restart redis server"
systemctl restart redis
status $?
