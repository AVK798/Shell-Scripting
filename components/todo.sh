#!/bin/bash


source components/common.sh

Apt_updates

Download_services

Head "Install npm"
cd todo/
 npm install &>>$Log
 status $?

 Head "update config details of redis server"
 sed -i -e "s/redis-endpoint/localhost/g" todo.service
 status $?

 Head "Create the systemd service for todo"
 cp todo.service /etc/systemd/system/.
 status $?

 Head "restart todo.service"
systemctl daemon-reload && systemctl enable todo.service && systemctl restart todo.service
status $?




