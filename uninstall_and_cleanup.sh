#!/bin/bash

# Step 1: 停止 tmux 会话
echo "Stopping tmux session..."
tmux kill-session -t bot_session

# Step 2: 删除 NodeGo-Auto-Bot 目录
echo "Removing NodeGo-Auto-Bot directory..."
rm -rf NodeGo-Auto-Bot

# Step 3: 卸载 Node.js 和 nvm
echo "Uninstalling Node.js and nvm..."
nvm deactivate
nvm uninstall 16
rm -rf ~/.nvm

# Step 4: 删除 token 文件
echo "Removing token file..."
rm -f data.txt

# Step 5: 删除安装脚本
echo "Removing install script..."
rm -f install_and_run_bot.sh

# Step 6: 删除 tmux 配置文件（如果有）
echo "Removing tmux configuration file..."
rm -f ~/.tmux.conf

# Step 7: 清除 tmux 残留会话
echo "Clearing tmux residual sessions..."
tmux kill-server

# Step 8: 清理完毕
echo "Cleanup complete!"
