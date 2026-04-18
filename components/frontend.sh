#!/bin/bash

source components/common.sh

Apt_updates

Head "Install npm"
apt install npm -y &>>$Log
npm install &>>$Log
status $?

Head "Build npm project"
npm run build &>>$Log
status $?

Head "Copy html content to /var/www/htnl dir"
cp -r /dist /var/www/html/
status $?

Head "Install nginx"
apt install nginx -y &>>$Log
status $?

Head "Restart Nginx"
systemctl restart nginx
status $?



# Apt update

# for node.js code (reactjs/vue)
# Apt install npm -y

# for frontend app/UI

# apt istall nginx -y

# to install npm packages

# npm install (14 version acceptable)

# To build the project

# npm run build

# copy the app build to /var/www/html

# cp -r /dist or build/* /var/www/html/

# restart nginx

# systemctl restart nginx

