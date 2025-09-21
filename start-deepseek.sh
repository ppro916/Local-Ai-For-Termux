#!/data/data/com.termux/files/usr/bin/bash
# Start Arch Linux + Ollama + DeepSeek

# Arch Linux मध्ये login
proot-distro login archlinux -- bash -c "
  # Ollama server background मध्ये start
  nohup ollama serve > /dev/null 2>&1 &
  sleep 3
  # DeepSeek run
  ollama run deepseek-r1:1.5b
"
