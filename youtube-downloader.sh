#!/data/data/com.termux/files/usr/bin/bash

# YouTube Video & MP3 Downloader for Termux
# A colorful, feature-rich downloader with quality selection

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Gradient-like effect colors
GRAD1='\033[38;5;201m' # Pink
GRAD2='\033[38;5;198m'
GRAD3='\033[38;5;199m'
GRAD4='\033[38;5;45m'  # Cyan
GRAD5='\033[38;5;51m'

# Clear screen
clear

# Banner function
show_banner() {
    echo -e "${GRAD1}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GRAD2}║                                                               ║${NC}"
    echo -e "${GRAD2}║  ${BOLD}${WHITE}████████╗██╗   ██╗██████╗ ███████╗     ██████╗ ██████╗  █████╗ ██████╗ ${NC}${GRAD2}  ║${NC}"
    echo -e "${GRAD3}║  ${BOLD}${WHITE}╚══██╔══╝██║   ██║██╔══██╗██╔════╝    ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗${NC}${GRAD3}  ║${NC}"
    echo -e "${GRAD3}║  ${BOLD}${WHITE}   ██║   ██║   ██║██████╔╝█████╗      ██║  ███╗██████╔╝███████║██████╔╝${NC}${GRAD3}  ║${NC}"
    echo -e "${GRAD4}║  ${BOLD}${WHITE}   ██║   ██║   ██║██╔══██╗██╔══╝      ██║   ██║██╔══██╗██╔══██║██╔══██╗${NC}${GRAD4}  ║${NC}"
    echo -e "${GRAD4}║  ${BOLD}${WHITE}   ██║   ╚██████╔╝██████╔╝███████╗    ╚██████╔╝██║  ██║██║  ██║██████╔╝${NC}${GRAD4}  ║${NC}"
    echo -e "${GRAD5}║  ${BOLD}${WHITE}   ╚═╝    ╚═════╝ ╚═════╝ ╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ${NC}${GRAD5}  ║${NC}"
    echo -e "${GRAD5}║                                                               ║${NC}"
    echo -e "${GRAD5}║        ${CYAN}${BOLD}YouTube Video & MP3 Downloader for Termux${NC}${GRAD5}                ║${NC}"
    echo -e "${GRAD5}║              ${YELLOW}All Qualities • Fast • Easy to Use${NC}${GRAD5}                   ║${NC}"
    echo -e "${GRAD1}╚═══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# Check if yt-dlp is installed
check_dependencies() {
    echo -e "${CYAN}${BOLD}[*] Checking dependencies...${NC}"
    
    if ! command -v yt-dlp &> /dev/null; then
        echo -e "${YELLOW}[!] yt-dlp not found. Installing...${NC}"
        pkg update -y && pkg upgrade -y
        pkg install python -y
        pip install yt-dlp
        echo -e "${GREEN}[✓] yt-dlp installed successfully!${NC}"
    else
        echo -e "${GREEN}[✓] yt-dlp is already installed!${NC}"
    fi
    
    if ! command -v ffmpeg &> /dev/null; then
        echo -e "${YELLOW}[!] ffmpeg not found. Installing...${NC}"
        pkg install ffmpeg -y
        echo -e "${GREEN}[✓] ffmpeg installed successfully!${NC}"
    else
        echo -e "${GREEN}[✓] ffmpeg is already installed!${NC}"
    fi
    
    echo ""
}

# Get video info
get_video_info() {
    local url=$1
    echo -e "${CYAN}${BOLD}[*] Fetching video information...${NC}"
    yt-dlp --get-title --get-duration "$url" 2>/dev/null | head -2
    echo ""
}

# Display available formats
show_formats() {
    local url=$1
    echo -e "${MAGENTA}${BOLD}[*] Available formats:${NC}\n"
    yt-dlp -F "$url"
    echo ""
}

# Download video
download_video() {
    local url=$1
    local quality=$2
    
    echo -e "${CYAN}${BOLD}[*] Starting video download...${NC}"
    echo -e "${YELLOW}[*] Quality: $quality${NC}\n"
    
    case $quality in
        1)
            echo -e "${GREEN}[*] Downloading Best Quality (MP4)...${NC}"
            yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" \
                   --merge-output-format mp4 \
                   -o "~/storage/downloads/%(title)s.%(ext)s" "$url"
            ;;
        2)
            echo -e "${GREEN}[*] Downloading 1080p (MP4)...${NC}"
            yt-dlp -f "bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[height<=1080]" \
                   --merge-output-format mp4 \
                   -o "~/storage/downloads/%(title)s.%(ext)s" "$url"
            ;;
        3)
            echo -e "${GREEN}[*] Downloading 720p (MP4)...${NC}"
            yt-dlp -f "bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]/best[height<=720]" \
                   --merge-output-format mp4 \
                   -o "~/storage/downloads/%(title)s.%(ext)s" "$url"
            ;;
        4)
            echo -e "${GREEN}[*] Downloading 480p (MP4)...${NC}"
            yt-dlp -f "bestvideo[height<=480][ext=mp4]+bestaudio[ext=m4a]/best[height<=480]" \
                   --merge-output-format mp4 \
                   -o "~/storage/downloads/%(title)s.%(ext)s" "$url"
            ;;
        5)
            echo -e "${GREEN}[*] Downloading 360p (MP4)...${NC}"
            yt-dlp -f "bestvideo[height<=360][ext=mp4]+bestaudio[ext=m4a]/best[height<=360]" \
                   --merge-output-format mp4 \
                   -o "~/storage/downloads/%(title)s.%(ext)s" "$url"
            ;;
        6)
            echo -e "${GREEN}[*] Showing all available formats...${NC}\n"
            show_formats "$url"
            echo -e "${YELLOW}Enter format code (e.g., 137+140 for video+audio): ${NC}"
            read format_code
            yt-dlp -f "$format_code" --merge-output-format mp4 \
                   -o "~/storage/downloads/%(title)s.%(ext)s" "$url"
            ;;
    esac
    
    if [ $? -eq 0 ]; then
        echo -e "\n${GREEN}${BOLD}[✓] Video downloaded successfully!${NC}"
        echo -e "${CYAN}[*] Location: ~/storage/downloads/${NC}"
    else
        echo -e "\n${RED}${BOLD}[✗] Download failed!${NC}"
    fi
}

# Download MP3
download_mp3() {
    local url=$1
    local quality=$2
    
    echo -e "${CYAN}${BOLD}[*] Starting MP3 download...${NC}"
    echo -e "${YELLOW}[*] Quality: $quality${NC}\n"
    
    case $quality in
        1)
            echo -e "${GREEN}[*] Downloading Best Quality MP3 (320kbps)...${NC}"
            yt-dlp -x --audio-format mp3 --audio-quality 0 \
                   -o "~/storage/downloads/%(title)s.%(ext)s" "$url"
            ;;
        2)
            echo -e "${GREEN}[*] Downloading High Quality MP3 (256kbps)...${NC}"
            yt-dlp -x --audio-format mp3 --audio-quality 2 \
                   -o "~/storage/downloads/%(title)s.%(ext)s" "$url"
            ;;
        3)
            echo -e "${GREEN}[*] Downloading Medium Quality MP3 (192kbps)...${NC}"
            yt-dlp -x --audio-format mp3 --audio-quality 4 \
                   -o "~/storage/downloads/%(title)s.%(ext)s" "$url"
            ;;
        4)
            echo -e "${GREEN}[*] Downloading Standard Quality MP3 (128kbps)...${NC}"
            yt-dlp -x --audio-format mp3 --audio-quality 5 \
                   -o "~/storage/downloads/%(title)s.%(ext)s" "$url"
            ;;
        5)
            echo -e "${GREEN}[*] Downloading Low Quality MP3 (96kbps)...${NC}"
            yt-dlp -x --audio-format mp3 --audio-quality 7 \
                   -o "~/storage/downloads/%(title)s.%(ext)s" "$url"
            ;;
    esac
    
    if [ $? -eq 0 ]; then
        echo -e "\n${GREEN}${BOLD}[✓] MP3 downloaded successfully!${NC}"
        echo -e "${CYAN}[*] Location: ~/storage/downloads/${NC}"
    else
        echo -e "\n${RED}${BOLD}[✗] Download failed!${NC}"
    fi
}

# Main menu
main_menu() {
    while true; do
        show_banner
        
        echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════╗${NC}"
        echo -e "${BOLD}${WHITE}║                      MAIN MENU                            ║${NC}"
        echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════╝${NC}\n"
        
        echo -e "${GRAD1}  [1]${NC} ${WHITE}Download Video (All Qualities)${NC}"
        echo -e "${GRAD2}  [2]${NC} ${WHITE}Download MP3 (All Qualities)${NC}"
        echo -e "${GRAD3}  [3]${NC} ${WHITE}Check Dependencies${NC}"
        echo -e "${GRAD4}  [4]${NC} ${WHITE}Update yt-dlp${NC}"
        echo -e "${GRAD5}  [5]${NC} ${RED}Exit${NC}\n"
        
        echo -e "${CYAN}${BOLD}Enter your choice [1-5]: ${NC}"
        read choice
        
        case $choice in
            1)
                clear
                show_banner
                echo -e "${YELLOW}${BOLD}Enter YouTube URL: ${NC}"
                read url
                
                if [ -z "$url" ]; then
                    echo -e "${RED}[✗] URL cannot be empty!${NC}"
                    sleep 2
                    continue
                fi
                
                echo ""
                get_video_info "$url"
                
                echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════╗${NC}"
                echo -e "${BOLD}${WHITE}║                   VIDEO QUALITY OPTIONS                   ║${NC}"
                echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════╝${NC}\n"
                
                echo -e "${GRAD1}  [1]${NC} ${GREEN}Best Quality (Highest Available)${NC}"
                echo -e "${GRAD2}  [2]${NC} ${GREEN}1080p (Full HD)${NC}"
                echo -e "${GRAD3}  [3]${NC} ${YELLOW}720p (HD)${NC}"
                echo -e "${GRAD4}  [4]${NC} ${YELLOW}480p (SD)${NC}"
                echo -e "${GRAD5}  [5]${NC} ${YELLOW}360p (Low)${NC}"
                echo -e "${MAGENTA}  [6]${NC} ${CYAN}Custom Format (Show all formats)${NC}\n"
                
                echo -e "${CYAN}${BOLD}Select quality [1-6]: ${NC}"
                read video_quality
                
                echo ""
                download_video "$url" "$video_quality"
                
                echo -e "\n${YELLOW}Press Enter to continue...${NC}"
                read
                ;;
                
            2)
                clear
                show_banner
                echo -e "${YELLOW}${BOLD}Enter YouTube URL: ${NC}"
                read url
                
                if [ -z "$url" ]; then
                    echo -e "${RED}[✗] URL cannot be empty!${NC}"
                    sleep 2
                    continue
                fi
                
                echo ""
                get_video_info "$url"
                
                echo -e "${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════╗${NC}"
                echo -e "${BOLD}${WHITE}║                    MP3 QUALITY OPTIONS                    ║${NC}"
                echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════╝${NC}\n"
                
                echo -e "${GRAD1}  [1]${NC} ${GREEN}Best (320 kbps)${NC}"
                echo -e "${GRAD2}  [2]${NC} ${GREEN}High (256 kbps)${NC}"
                echo -e "${GRAD3}  [3]${NC} ${YELLOW}Medium (192 kbps)${NC}"
                echo -e "${GRAD4}  [4]${NC} ${YELLOW}Standard (128 kbps)${NC}"
                echo -e "${GRAD5}  [5]${NC} ${YELLOW}Low (96 kbps)${NC}\n"
                
                echo -e "${CYAN}${BOLD}Select quality [1-5]: ${NC}"
                read mp3_quality
                
                echo ""
                download_mp3 "$url" "$mp3_quality"
                
                echo -e "\n${YELLOW}Press Enter to continue...${NC}"
                read
                ;;
                
            3)
                clear
                show_banner
                check_dependencies
                echo -e "${YELLOW}Press Enter to continue...${NC}"
                read
                ;;
                
            4)
                clear
                show_banner
                echo -e "${CYAN}${BOLD}[*] Updating yt-dlp...${NC}\n"
                pip install --upgrade yt-dlp
                echo -e "\n${GREEN}${BOLD}[✓] Update complete!${NC}"
                echo -e "${YELLOW}Press Enter to continue...${NC}"
                read
                ;;
                
            5)
                clear
                show_banner
                echo -e "${MAGENTA}${BOLD}Thank you for using TubeGrab!${NC}"
                echo -e "${CYAN}Visit: https://github.com/HYDRA-TERMUX/tubegrab${NC}\n"
                exit 0
                ;;
                
            *)
                echo -e "${RED}[✗] Invalid option! Please choose 1-5.${NC}"
                sleep 2
                ;;
        esac
    done
}

# Check storage permission
if [ ! -d ~/storage/downloads ]; then
    echo -e "${YELLOW}[!] Setting up storage access...${NC}"
    termux-setup-storage
    sleep 2
fi

# Run dependency check on first launch
check_dependencies

# Start the program
main_menu
