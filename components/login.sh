#!/bin/bash

source components/common.sh

Apt_updates

Download_services

Head "Install go packages"
apt install golang -y &>>$Log
cd login/ && go mod tidy
 status $?

 Head "Build login service"
  go build -o login 
  status $?

Head " update the conf details for users service"
sed -i "s/localhost:8080/localhost:3003/g" systemd.service
sed -i "s/AUTH_API_PORT=8080/AUTH_API_PORT=3001/g" systemd.service
status $?

Head "copy the systemd service"
 cp systemd.service /etc/systemd/system/login.service
 status $?

 Head "enable login servie"
 systemctl daemon-reload && systemctl enable login.service && systemctl restart login.service
 status $?