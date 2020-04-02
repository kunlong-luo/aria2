# aria2

## 项目介绍
基于原版 [aria2](https://aria2.github.io) 轻量级的多协议和多源命令行下载实用程序 安装手册。

## aria2 server install
```bash
wget https://raw.githubusercontent.com/tony-parker-luo/aria2/master/aria2_install.sh && \
chmod +x aria2_install.sh && \
./aria2_install.sh
```

## aria2 server uninstall
```bash
wget https://raw.githubusercontent.com/tony-parker-luo/aria2/master/aria2_uninstall.sh && \
chmod +x aria2_uninstall.sh && \
./aria2_uninstall.sh
```

## aria2 server install with docker
```bash
docker pull tonyparker/aria2
docker run --name aria2 --restart=always -e RPC_SECRET="xxx" -v aria2_conf:/config -v aria2_data:/downloads -p 6800:6800 -d tonyparker/aria2
```