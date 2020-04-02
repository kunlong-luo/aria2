#!/usr/bin/bash

ARIA2_WD=$HOME/.aria2
SESSION=${ARIA2_WD}/aria2.session
LOG=${ARIA2_WD}/aria2.log
RPC_SECRET=$1

# init
sudo yum update -y -q \
&&  sudo yum install aria2 -y -q \
&&  sudo mkdir $ARIA2_WD \
&&  sudo wget --no-check-certificate -c -P $ARIA2_WD  https://raw.githubusercontent.com/tony-parker-luo/aria2/master/aria2.conf \
&&  sudo touch $SESSION \
&&  sudo touch $LOG \
&&  sudo aria2c --rpc-secret="" aria2c --conf-ARIA2_WD=/root/.aria2/aria2.conf -D

# startup
if [[ -n "RPC_SECRET" ]]; then
  sudo aria2c --rpc-secret="$RPC_SECRET" --conf-ARIA2_WD=/root/.aria2/aria2.conf -D
  echo -e "\033[32mAria2 Starup Success!\033[0m"
else
  sudo aria2c --conf-ARIA2_WD=${ARIA2_WD}/aria2.conf -D
  echo -e "\033[32mAria2 Starup Success!\033[0m"
fi