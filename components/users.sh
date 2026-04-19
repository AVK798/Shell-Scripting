#!/bin/bash

source components/common.sh


Apt_updates

Download_services

Head " Install Java"
apt install openjdk-8-jdk -y &>>$Log
status $?

Head "mvn compile"
cd users/
mvn clean package &>>$Log
status $?

Head "Copy the jar file"
cp -r target/*.jar users.jar
status $?

Head "copy the systemd servie for users"
cp users.service /etc/systemd/system/.
status $?

Head "start users service"
systemctl daemon-reload && systemctl enable users.service && systemctl restart users.service
status $?