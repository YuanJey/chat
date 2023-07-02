#!/bin/bash

# 执行 make build-multiarch 构建二进制文件
make build-multiarch

# 执行 docker-compose up -d 启动容器
docker-compose up -d

# 等待一段时间以确保容器启动完成
sleep 10

# 检查 chat 目录下的 bin、config、logs 和 scripts 目录是否有内容
if [[ -n $(ls -A ./chat/bin) ]]; then
  echo "bin 目录不为空"
else
  echo "bin 目录为空"
fi

if [[ -n $(ls -A ./chat/config) ]]; then
  echo "config 目录不为空"
else
  echo "config 目录为空"
fi

if [[ -n $(ls -A ./chat/logs) ]]; then
  echo "logs 目录不为空"
else
  echo "logs 目录为空"
fi

if [[ -n $(ls -A ./chat/scripts) ]]; then
  echo "scripts 目录不为空"
else
  echo "scripts 目录为空"
fi

