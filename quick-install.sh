#!/data/data/com.termux/files/usr/bin/bash

# TubeGrab Quick Installer
# One-line installation: curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/quick-install.sh | bash

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

clear

echo -e "${CYAN}${BOLD}"
cat << "EOF"
╔═══════════════════════════════════════════════════════════════╗
║                                                               ║
║                    TubeGrab Quick Install                     ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}\n"

echo -e "${YELLOW}Installing TubeGrab...${NC}\n"

# Check if in Termux
if [ ! -d "/data/data/com.termux" ]; then
    echo -e "${RED}Error: This installer must be run in Termux!${NC}"
    exit 1
fi

# Update packages
echo -e "${CYAN}[1/6]${NC} Updating packages..."
pkg update -y > /dev/null 2>&1

# Install git
echo -e "${CYAN}[2/6]${NC} Installing git..."
pkg install git -y > /dev/null 2>&1

# Clone repository
echo -e "${CYAN}[3/6]${NC} Cloning TubeGrab repository..."
cd ~
if [ -d "tubegrab" ]; then
    rm -rf tubegrab
fi
git clone https://github.com/HYDRA-TERMUX/tubegrab.git > /dev/null 2>&1

# Enter directory
cd tubegrab

# Make scripts executable
echo -e "${CYAN}[4/6]${NC} Setting permissions..."
chmod +x *.sh

# Install dependencies
echo -e "${CYAN}[5/6]${NC} Installing dependencies..."
pkg install python ffmpeg -y > /dev/null 2>&1
pip install yt-dlp > /dev/null 2>&1

# Setup storage
echo -e "${CYAN}[6/6]${NC} Setting up storage..."
if [ ! -d "$HOME/storage" ]; then
    termux-setup-storage
    sleep 2
fi

echo ""
echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}${BOLD}║           Installation completed successfully! ✓              ║${NC}"
echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${CYAN}${BOLD}Quick Start:${NC}"
echo -e "  ${YELLOW}cd tubegrab${NC}"
echo -e "  ${YELLOW}./youtube-downloader.sh${NC}"
echo ""

echo -e "${CYAN}${BOLD}Repository:${NC} ${GREEN}https://github.com/HYDRA-TERMUX/tubegrab${NC}"
echo -e "${CYAN}${BOLD}Star us on GitHub! ⭐${NC}\n"

# Ask to run now
echo -e "${YELLOW}Launch TubeGrab now? (y/n): ${NC}"
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    ./youtube-downloader.sh
else
    echo -e "${GREEN}Run ${BOLD}cd tubegrab && ./youtube-downloader.sh${NC}${GREEN} when ready!${NC}\n"
fi
