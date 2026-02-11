#!/data/data/com.termux/files/usr/bin/bash

# TubeGrab Installer Script
# Quick and easy installation for Termux

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

clear

echo -e "${CYAN}${BOLD}"
echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║                                                               ║"
echo "║                    TubeGrab Installer                         ║"
echo "║           YouTube Video & MP3 Downloader Setup                ║"
echo "║                                                               ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo -e "${NC}\n"

# Function to display progress
show_progress() {
    echo -e "${GREEN}[✓]${NC} $1"
}

show_error() {
    echo -e "${RED}[✗]${NC} $1"
}

show_info() {
    echo -e "${BLUE}[*]${NC} $1"
}

# Check if running in Termux
if [ ! -d "/data/data/com.termux" ]; then
    show_error "This script must be run in Termux!"
    exit 1
fi

show_info "Starting installation process...\n"

# Update packages
show_info "Updating package lists..."
pkg update -y > /dev/null 2>&1
if [ $? -eq 0 ]; then
    show_progress "Package lists updated"
else
    show_error "Failed to update packages"
    exit 1
fi

# Upgrade packages
show_info "Upgrading packages..."
pkg upgrade -y > /dev/null 2>&1
show_progress "Packages upgraded"

# Install Python
show_info "Installing Python..."
pkg install python -y > /dev/null 2>&1
if command -v python &> /dev/null; then
    show_progress "Python installed"
else
    show_error "Failed to install Python"
    exit 1
fi

# Install ffmpeg
show_info "Installing ffmpeg..."
pkg install ffmpeg -y > /dev/null 2>&1
if command -v ffmpeg &> /dev/null; then
    show_progress "ffmpeg installed"
else
    show_error "Failed to install ffmpeg"
    exit 1
fi

# Install git
show_info "Installing git..."
pkg install git -y > /dev/null 2>&1
if command -v git &> /dev/null; then
    show_progress "git installed"
else
    show_error "Failed to install git"
    exit 1
fi

# Install yt-dlp
show_info "Installing yt-dlp..."
pip install yt-dlp > /dev/null 2>&1
if command -v yt-dlp &> /dev/null; then
    show_progress "yt-dlp installed"
else
    show_error "Failed to install yt-dlp"
    exit 1
fi

# Setup storage
show_info "Setting up storage access..."
if [ ! -d "$HOME/storage" ]; then
    termux-setup-storage
    sleep 2
    show_progress "Storage access configured"
else
    show_progress "Storage already configured"
fi

# Create downloads directory if it doesn't exist
if [ ! -d "$HOME/storage/downloads" ]; then
    mkdir -p "$HOME/storage/downloads"
    show_progress "Downloads directory created"
fi

# Download the main script
show_info "Downloading TubeGrab script..."
if [ -f "youtube-downloader.sh" ]; then
    rm youtube-downloader.sh
fi

# For GitHub, this would download from your repo
# curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/youtube-downloader.sh -o youtube-downloader.sh

# For now, check if script exists in current directory
if [ -f "youtube-downloader.sh" ]; then
    show_progress "Script found"
else
    show_error "Script not found. Please ensure youtube-downloader.sh is in the current directory"
    exit 1
fi

# Make script executable
chmod +x youtube-downloader.sh
show_progress "Script permissions set"

echo ""
echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}${BOLD}║                                                               ║${NC}"
echo -e "${GREEN}${BOLD}║              Installation completed successfully!             ║${NC}"
echo -e "${GREEN}${BOLD}║                                                               ║${NC}"
echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${CYAN}${BOLD}Quick Start:${NC}"
echo -e "${YELLOW}  Run the downloader:${NC}  ./youtube-downloader.sh"
echo ""

echo -e "${CYAN}${BOLD}Installed Components:${NC}"
echo -e "  ✓ Python $(python --version 2>&1 | cut -d' ' -f2)"
echo -e "  ✓ yt-dlp $(yt-dlp --version)"
echo -e "  ✓ ffmpeg $(ffmpeg -version 2>&1 | head -1 | cut -d' ' -f3)"
echo ""

echo -e "${YELLOW}Would you like to run TubeGrab now? (y/n): ${NC}"
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    clear
    ./youtube-downloader.sh
else
    echo -e "\n${GREEN}Thanks for installing TubeGrab!${NC}"
    echo -e "${CYAN}Run ${BOLD}./youtube-downloader.sh${NC}${CYAN} whenever you're ready.${NC}\n"
fi
