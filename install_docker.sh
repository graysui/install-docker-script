#!/bin/bash

# 更新软件包列表
apt update

# 升级所有已安装的软件包
apt upgrade -y

# 安装必要的软件包
apt install -y curl vim wget gnupg dpkg apt-transport-https lsb-release ca-certificates

# 添加 Docker 的 GPG 密钥
curl -sSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-ce.gpg

# 添加 Docker 的软件包源
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-ce.gpg] https://download.docker.com/linux/debian $(lsb_release -sc) stable" | tee /etc/apt/sources.list.d/docker.list

# 再次更新软件包列表
apt update

# 安装 Docker
apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# 下载并安装 Docker Compose
curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# 验证 Docker 和 Docker Compose 安装
docker --version
docker-compose --version
