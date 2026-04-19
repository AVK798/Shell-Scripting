#!/bin/bash


source components/common.sh

Apt_updates

Download_services

Head "Install npm"
cd todo/
 npm install &>>$Log
 status $?

Head "build the npm"
 npm run build &>>$Log

 status $?



