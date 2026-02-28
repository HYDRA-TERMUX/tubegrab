#!/data/data/com.termux/files/usr/bin/bash

################################################################################
# TubeGrab - Single Script Installer
# Downloads and installs TubeGrab YouTube Downloader automatically
# 
# Usage: bash <(curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/setup.sh)
################################################################################

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
NC='\033[0m'

# Gradient colors
GRAD1='\033[38;5;201m'
GRAD2='\033[38;5;198m'
GRAD3='\033[38;5;45m'

clear

# Banner
echo -e "${GRAD1}${BOLD}"
cat << "EOF"
╔═══════════════════════════════════════════════════════════════╗
║                                                               ║
║  ████████╗██╗   ██╗██████╗ ███████╗     ██████╗ ██████╗  █████╗ ██████╗   ║
║  ╚══██╔══╝██║   ██║██╔══██╗██╔════╝    ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗  ║
║     ██║   ██║   ██║██████╔╝█████╗      ██║  ███╗██████╔╝███████║██████╔╝  ║
║     ██║   ██║   ██║██╔══██╗██╔══╝      ██║   ██║██╔══██╗██╔══██║██╔══██╗  ║
║     ██║   ╚██████╔╝██████╔╝███████╗    ╚██████╔╝██║  ██║██║  ██║██████╔╝  ║
║     ╚═╝    ╚═════╝ ╚═════╝ ╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝   ║
║                                                               ║
║              Single Script Installation v1.0                  ║
║         YouTube Video & MP3 Downloader for Termux             ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}\n"

echo -e "${CYAN}${BOLD}[*] Starting automatic installation...${NC}\n"
# Progress indicators
show_progress() {
    echo -e "${GREEN}${BOLD}[✓]${NC} $1"
}

show_error() {
    echo -e "${RED}${BOLD}[✗]${NC} $1"
}

show_info() {
    echo -e "${BLUE}${BOLD}[*]${NC} $1"
}

show_warning() {
    echo -e "${YELLOW}${BOLD}[!]${NC} $1"
}
termux-open "https://hydratermux.blogspot.com/2026/02/tubegrab-download-youtube-videos-mp3-in.html"
sleep 0.20
# Check if running in Termux
if [ ! -d "/data/data/com.termux" ]; then
    show_error "This script must be run in Termux!"
    echo -e "${YELLOW}Download Termux from F-Droid: https://f-droid.org/packages/com.termux/${NC}"
    exit 1
fi

show_progress "Running in Termux"
sleep 0.5

# Step 1: Update Termux packages
show_info "Step 1/8: Updating Termux packages..."
if pkg update -y > /dev/null 2>&1; then
    show_progress "Packages updated successfully"
else
    show_warning "Update had some issues, continuing anyway..."
fi
sleep 0.5

# Step 2: Upgrade packages
show_info "Step 2/8: Upgrading installed packages..."
if pkg upgrade -y > /dev/null 2>&1; then
    show_progress "Packages upgraded successfully"
else
    show_warning "Upgrade had some issues, continuing anyway..."
fi
sleep 0.5

# Step 3: Install Git
show_info "Step 3/8: Installing Git..."
if command -v git &> /dev/null; then
    show_progress "Git already installed"
else
    pkg install git -y > /dev/null 2>&1
    if command -v git &> /dev/null; then
        show_progress "Git installed successfully"
    else
        show_error "Failed to install Git"
        exit 1
    fi
fi
sleep 0.5

# Step 4: Install Python
show_info "Step 4/8: Installing Python..."
if command -v python &> /dev/null; then
    show_progress "Python already installed"
else
    pkg install python -y > /dev/null 2>&1
    if command -v python &> /dev/null; then
        show_progress "Python installed successfully"
    else
        show_error "Failed to install Python"
        exit 1
    fi
fi
sleep 0.5

# Step 5: Install FFmpeg
show_info "Step 5/8: Installing FFmpeg..."
if command -v ffmpeg &> /dev/null; then
    show_progress "FFmpeg already installed"
else
    pkg install ffmpeg -y > /dev/null 2>&1
    if command -v ffmpeg &> /dev/null; then
        show_progress "FFmpeg installed successfully"
    else
        show_error "Failed to install FFmpeg"
        exit 1
    fi
fi
sleep 0.5

# Step 6: Install yt-dlp
show_info "Step 6/8: Installing yt-dlp..."
if command -v yt-dlp &> /dev/null; then
    show_progress "yt-dlp already installed"
    # Update to latest version
    show_info "Updating yt-dlp to latest version..."
    pip install --upgrade yt-dlp > /dev/null 2>&1
    show_progress "yt-dlp updated to latest version"
else
    pip install yt-dlp > /dev/null 2>&1
    if command -v yt-dlp &> /dev/null; then
        show_progress "yt-dlp installed successfully"
    else
        show_error "Failed to install yt-dlp"
        exit 1
    fi
fi
sleep 0.5

# Step 7: Setup storage access
show_info "Step 7/8: Setting up storage access..."
if [ ! -d "$HOME/storage" ]; then
    show_warning "Storage permission required - Please allow when prompted!"
    sleep 2
    termux-setup-storage
    sleep 3
    if [ -d "$HOME/storage" ]; then
        show_progress "Storage access granted"
    else
        show_warning "Storage access not granted, but continuing..."
    fi
else
    show_progress "Storage access already configured"
fi

# Create TubeGrab directories
show_info "Creating TubeGrab directories..."
mkdir -p /sdcard/TubeGrab/Video 2>/dev/null || mkdir -p $HOME/storage/downloads/TubeGrab/Video
mkdir -p /sdcard/TubeGrab/MP3 2>/dev/null || mkdir -p $HOME/storage/downloads/TubeGrab/MP3
show_progress "TubeGrab directories created"
sleep 0.5

# Step 8: Clone TubeGrab repository
show_info "Step 8/8: Downloading TubeGrab..."
cd $HOME
if [ -d "tubegrab" ]; then
    show_info "TubeGrab directory exists, updating..."
    cd tubegrab
    git pull > /dev/null 2>&1
    show_progress "TubeGrab updated successfully"
else
    git clone https://github.com/HYDRA-TERMUX/tubegrab.git > /dev/null 2>&1
    if [ -d "tubegrab" ]; then
        show_progress "TubeGrab downloaded successfully"
    else
        show_error "Failed to download TubeGrab"
        exit 1
    fi
    cd tubegrab
fi

# Make scripts executable
chmod +x *.sh 2>/dev/null
show_progress "Scripts configured"

echo ""
echo -e "${GREEN}${BOLD}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}${BOLD}║                                                               ║${NC}"
echo -e "${GREEN}${BOLD}║          🎉 Installation Completed Successfully! 🎉           ║${NC}"
echo -e "${GREEN}${BOLD}║                                                               ║${NC}"
echo -e "${GREEN}${BOLD}╚═══════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Display installed versions
echo -e "${CYAN}${BOLD}📦 Installed Components:${NC}"
echo -e "  ${GREEN}✓${NC} Python:  $(python --version 2>&1 | cut -d' ' -f2)"
echo -e "  ${GREEN}✓${NC} yt-dlp:  $(yt-dlp --version 2>&1)"
echo -e "  ${GREEN}✓${NC} FFmpeg:  $(ffmpeg -version 2>&1 | head -1 | cut -d' ' -f3)"
echo -e "  ${GREEN}✓${NC} Git:     $(git --version 2>&1 | cut -d' ' -f3)"
echo ""

# Display paths
echo -e "${CYAN}${BOLD}📁 Download Locations:${NC}"
echo -e "  ${YELLOW}Videos:${NC} /sdcard/TubeGrab/Video/"
echo -e "  ${YELLOW}MP3s:${NC}   /sdcard/TubeGrab/MP3/"
echo ""

# Display quick start
echo -e "${CYAN}${BOLD}🚀 Quick Start Guide:${NC}"
echo -e "  ${MAGENTA}1.${NC} To start TubeGrab:"
echo -e "     ${YELLOW}cd ~/tubegrab && ./youtube-downloader.sh${NC}"
echo ""
echo -e "  ${MAGENTA}2.${NC} Create a shortcut (optional):"
echo -e "     ${YELLOW}echo 'alias tube=\"cd ~/tubegrab && ./youtube-downloader.sh\"' >> ~/.bashrc${NC}"
echo -e "     ${YELLOW}source ~/.bashrc${NC}"
echo -e "     Then just type: ${BOLD}tube${NC}"
echo ""

# Display help
echo -e "${CYAN}${BOLD}📚 Documentation:${NC}"
echo -e "  ${GREEN}•${NC} README:  https://github.com/HYDRA-TERMUX/tubegrab"
echo -e "  ${GREEN}•${NC} Usage:   Run ${YELLOW}cat ~/tubegrab/USAGE.md${NC}"
echo -e "  ${GREEN}•${NC} Support: https://github.com/HYDRA-TERMUX/tubegrab/issues"
echo ""

# Display features
echo -e "${CYAN}${BOLD}✨ Features:${NC}"
echo -e "  ${GREEN}✓${NC} Download videos in all qualities (360p to 8K)"
echo -e "  ${GREEN}✓${NC} Extract MP3 audio (96-320 kbps)"
echo -e "  ${GREEN}✓${NC} Beautiful colorful interface"
echo -e "  ${GREEN}✓${NC} Organized folders (Video/MP3)"
echo ""

# Ask to run now
echo -e "${YELLOW}${BOLD}Would you like to start TubeGrab now? (y/n):${NC} "
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    clear
    ./youtube-downloader.sh
else
    echo ""
    echo -e "${GREEN}${BOLD}Thank you for installing TubeGrab!${NC}"
    echo -e "${CYAN}Run it anytime with:${NC} ${YELLOW}cd ~/tubegrab && ./youtube-downloader.sh${NC}"
    echo ""
    echo -e "${MAGENTA}⭐ Star us on GitHub:${NC} ${BLUE}https://github.com/HYDRA-TERMUX/tubegrab${NC}"
    echo -e "${MAGENTA}💖 Support development:${NC} ${BLUE}https://www.paypal.com/paypalme/techcochi${NC}"
    echo ""
fi
