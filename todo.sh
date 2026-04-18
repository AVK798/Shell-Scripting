#!/bin/bash

source /Services/common.sh

service=$1

if [ ! -f Services/${service}.sh ]; then
  echo "service file not found"
  exit 1
fi

user_name=$(whoami)

if [ "${user_name}" != "root" ]; then
  echo "invalid user please try to swtich to root user"
  exit 1
fi

export service

bash  Services/${service}.sh