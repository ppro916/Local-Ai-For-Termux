#!/bin/bash

# ===============================================
# | Name: Install Deepseek R1
# | Author: Miguel Euraque
# | Date: 2025-01-30
# | Description: Automated installation script for Deepseek R1 on Android
# | Copyright: All rights reserved.
# ===============================================

# Update Termux
pkg update -y

# Install additional tools
pkg install -y neofetch fish

# Install Arch Linux
proot-distro install archlinux

# Enter Arch Linux and execute configuration
proot-distro login archlinux << 'EOF'
# Update Arch Linux packages
pacman -Syu --noconfirm

# Install Ollama
curl -fsSL https://ollama.com/install.sh | sh

# Start Ollama server
ollama server > /dev/null 2>&1 &

# Wait for server to be ready
while ! curl -s http://localhost:11434/api/version > /dev/null; do
    sleep 1
done

# Run the model
ollama run deepseek-r1:1.5b
EOF
