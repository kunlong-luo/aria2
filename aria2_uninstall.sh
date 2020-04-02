#!/usr/bin/bash
ARIA2_DIR=$HOME/.aria2
SERVICE_NAME=aria2c

get_pid() {
  SERVICE_NAME=$1
  PID=$(ps aux | grep "[${SERVICE_NAME:0:1}]${SERVICE_NAME:1}" | awk '{print $2}')
  echo "$PID"
}

kill_pid() {
  OLD_PID=$1
  if [ -n "${OLD_PID}" ]; then
    echo -e "\e[93m正在关闭进程" ${OLD_PID} "...\e[0m"
    {
      kill ${OLD_PID};
      while kill -0 ${OLD_PID}; do sleep 1; done;
    } 2> /dev/null
    echo -e "\e[93m进程" ${OLD_PID} "已关闭。\e[0m"
  else
    echo -e "\e[93m服务没有运行。\e[0m"
  fi
}

stop_service() {
  OLD_PID=$(get_pid $SERVICE_NAME)
  if [[ $OLD_PID =~ [^0-9] ]]; then
    echo -e "\e[91m停止服务失败，使用服务名 $SERVICE_NAME 找到多个进程。请将变量 SERVICE_NAME 改为唯一的服务名。\e[0m"
    return 1
  else
    kill_pid ${OLD_PID}
  fi
}

main() {
  stop_service
  sudo yum remove aria2 -y \
  &&  sudo yum clean all \
  &&  sudo rm -rf $ARIA2_DIR
}

main
