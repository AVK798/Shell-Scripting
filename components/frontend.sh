#!/bin/bash

source components/common.sh

Apt_updates

Download_services

Head "Install nginx"
apt install nginx -y &>>$Log
status $?

Head "install old version of nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash >>$Log
source ~/.bashrc
status $?

Head "Export nvm package"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" &>>$Log
status $?

Head "Install nvm packages"
 cd frontend/ && nvm install 14 &>>$Log && nvm use 14
 status $?

Head "Install npm"
apt install npm -y &>>$Log
npm install &>>$Log
status $?

Head "Build npm project"
npm run build &>>$Log
status $?

Head "Copy html content to /var/www/htnl dir"
cp -r dist/. /var/www/html/
status $?

Head "set the ports for services in nginx conf file"

sed -i \ -e "s/localhost:8080/localhost:3001/g" \ -e "s/8080/80/g" \ -e "s#var/www/html/frontend/dist#var/www/html#g" todo.conf

status $?


Head "Define the config file for todo app"
cp todo.conf/. /etc/nginx/sites-enabled/.
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

