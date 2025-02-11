#!/bin/bash

# Step 1: 安装 nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Step 2: 加载 nvm
echo "Loading nvm..."
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Step 3: 安装指定版本的 Node.js (Node.js 16)
echo "Installing Node.js version 16..."
nvm install 16

# Step 4: 使用指定版本的 Node.js
echo "Using Node.js version 16..."
nvm use 16

# Step 5: 验证安装
echo "Verifying Node.js and npm installation..."
node -v
npm -v

# Step 6: 克隆 NodeGo-Auto-Bot 仓库
echo "Cloning NodeGo-Auto-Bot repository..."
git clone https://github.com/airdropinsiders/NodeGo-Auto-Bot.git
cd NodeGo-Auto-Bot

# Step 7: 安装依赖
echo "Installing dependencies..."
npm install

# Step 8: 自动输入 token 并保存到 data.txt 文件
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imd1b2d1b3h1bjdAZ21haWwuY29tIiwidXNlcklkIjoiNjdhYjAyYTJmMGVjOWJmNGZmYzAyNzY5IiwiaWF0IjoxNzM5MjYwODkxLCJleHAiOjE3NDE4NTI4OTF9.lTSYmXv-VyDCbHVOzFGFX7t7OckYBPEXfbujiAEsqlw"
echo $TOKEN > data.txt

# Step 9: 创建一个新的 screen 会话并运行 NodeGo-Auto-Bot 脚本
echo "Starting NodeGo-Auto-Bot in a new screen session..."
screen -dmS bot_session bash -c 'node index.js'

echo "NodeGo-Auto-Bot installation complete! Use 'screen -r bot_session' to reattach to the session."
