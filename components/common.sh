#!/bin/bash

Head() {
    echo -e "\e[1;36m +++++++++++++++++++ $1 \e[0m"

}

export Log=/tmp/${service}.log

status() {
  if [ "$1" -eq 0 ]; then 
    echo -e "\e[1;32m SUCCESS \e[0m"
  else
   echo -e "\e[1;31m FAILURE \e[0m"
   echo -e "\e[1;33m please refer the log file for more info "$Log" \e[0m"
   exit 1
  fi
}

Apt_updates() {
  Head "Update APT Repos"
  set-hostname "${service}"
  apt update &>>$Log
  status $?
}

Download_services() {
  Head "Download the ${service} service"
  cd /home/ubuntu/
  git clone https://github.com/AVK798/${service}.git &>>$Log
}