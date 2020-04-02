#!/usr/bin/bash

ARIA2_WD=$HOME/.aria2
SESSION=${ARIA2_WD}/aria2.session
LOG=${ARIA2_WD}/aria2.log
RPC_SECRET="token"
WORK_DIR=$(dirname $(readlink -f $0))

# init
sudo yum update -y -q \
&&  sudo yum install aria2 -y -q \
&&  sudo mkdir $ARIA2_WD \
&&  sudo cp ${WORK_DIR}/aria2.conf $ARIA2_WD \
&&  sudo touch $SESSION \
&&  sudo touch $LOG

# startup
if [[ -n $1 ]]; then
  RPC_SECRET=$1
fi

sudo aria2c --rpc-secret=$RPC_SECRET --conf-path=${ARIA2_WD}/aria2.conf -D
echo -e "\033[32mAria2 Starup Success!\033[0m"