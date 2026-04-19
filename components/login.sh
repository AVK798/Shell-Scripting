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

Head "copy the systemd service"
 cp systmed.service /etc/systemd/system/login.service
 status $?

 Head "enable login servie"
 systemctl daemon-reload && systemctl eanble login.service && systemctl restart login.service
 status $?