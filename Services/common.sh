#!/bin/bash

Head() {
    echo -e "\e[1;36m +++++++++++++++++++ $1 \e[0m"

}

OS_update() {
  Head "OS_update"
  set-hostname $1
    apt update -y
}