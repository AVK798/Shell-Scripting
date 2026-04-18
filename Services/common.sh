#!/bin/bash

Head() {
    echo -e "\e[1;36m +++++++++++++++++++ $1 \e[0m"

}

Apt_updates() {
  Head "Update APT Repos"
  set-hostname ${service}
  apt update
}