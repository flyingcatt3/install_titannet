#!/bin/bash

# 更新 apt 包索引
sudo apt update

# 安裝依賴包
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 更新 apt 包索引
sudo apt update

# 安裝 Docker CE
sudo apt install docker-ce docker-ce-cli containerd.io -y

# 啟動 Docker 服務
sudo systemctl start docker

# 驗證 Docker 是否安裝成功
docker --version

sudo systemctl enable docker.service
sudo systemctl enable containerd.service
