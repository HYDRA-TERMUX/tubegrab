# 🎬 TubeGrab - YouTube Downloader for Termux

<div align="center">

<img src="banner.svg" alt="TubeGrab Banner" width="100%">
<br><br>

[![Made with Bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg?style=flat-square)](https://www.gnu.org/software/bash/)
[![Works on Termux](https://img.shields.io/badge/Works%20on-Termux-00d4ff?style=flat-square&logo=android)](https://termux.com/)
[![Powered by yt-dlp](https://img.shields.io/badge/Powered%20by-yt--dlp-ff0066?style=flat-square)](https://github.com/yt-dlp/yt-dlp)

**🎬 Colorful YouTube Video & MP3 Downloader for Termux**

[Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [Documentation](USAGE.md) • [FAQ](#-faq)

</div>

---

## ✨ Features

🎥 **Video Downloads**
- Best Quality (Highest Available)
- 1080p Full HD
- 720p HD
- 480p SD
- 360p Low Quality
- Custom Format Selection

🎵 **MP3 Downloads**
- 320 kbps (Best)
- 256 kbps (High)
- 192 kbps (Medium)
- 128 kbps (Standard)
- 96 kbps (Low)

🎨 **Beautiful Interface**
- Colorful gradient banner
- Easy-to-use menu system
- Real-time download progress
- Color-coded status messages

⚡ **Advanced Features**
- Auto-dependency installation
- Format selection guide
- Video information display
- Smart file merging
- Update checker

---

## 📋 Requirements

- Android device (5.0+)
- Termux app ([F-Droid](https://f-droid.org/packages/com.termux/) or [GitHub](https://github.com/termux/termux-app))
- Storage permission
- Internet connection

---

## 🚀 Installation

### Method 1: Automatic Installation (Recommended)

```bash
# Install git if not already installed
pkg install git -y

# Clone the repository
git clone https://github.com/HYDRA-TERMUX/tubegrab.git

# Navigate to the directory
cd tubegrab

# Make the script executable
chmod +x youtube-downloader.sh

# Run the script
./youtube-downloader.sh
```

### Method 2: Manual Installation

```bash
# Update packages
pkg update && pkg upgrade -y

# Install required packages
pkg install python ffmpeg -y

# Install yt-dlp
pip install yt-dlp

# Download the script
curl -O https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/youtube-downloader.sh

# Make it executable
chmod +x youtube-downloader.sh

# Run the script
./youtube-downloader.sh
```

### Method 3: Quick Install (One-liner)

```bash
curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/quick-install.sh | bash
```

---

## 📖 Documentation

<table>
<tr>
<td width="50%">

### 🚀 Getting Started
- **[QUICKSTART.md](QUICKSTART.md)** - Get up and running in 5 minutes
- **[INSTALL.md](INSTALL.md)** - Detailed installation guide
- **[README.md](README.md)** - Overview and quick reference

</td>
<td width="50%">

### 📚 User Guides  
- **[USAGE.md](USAGE.md)** - **Complete usage guide** ⭐
- **[GITHUB_SETUP.md](GITHUB_SETUP.md)** - Repository setup
- **[BADGES.md](BADGES.md)** - GitHub badges reference

</td>
</tr>
<tr>
<td width="50%">

### 🔧 Development
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Contribution guidelines
- **[CHANGELOG.md](CHANGELOG.md)** - Version history

</td>
<td width="50%">

### 💡 Resources
- **[LICENSE](LICENSE)** - MIT License
- **[Issues](https://github.com/HYDRA-TERMUX/tubegrab/issues)** - Report bugs
- **[Discussions](https://github.com/HYDRA-TERMUX/tubegrab/discussions)** - Ask questions

</td>
</tr>
</table>

### 🌟 Recommended Reading Order:
1. **[QUICKSTART.md](QUICKSTART.md)** - Install TubeGrab
2. **[USAGE.md](USAGE.md)** - Learn all features ⭐ **Most Important!**
3. **[CONTRIBUTING.md](CONTRIBUTING.md)** - Help improve the project

---

## 💡 Usage

### Starting the Program

```bash
./youtube-downloader.sh
```

> 📚 **For detailed usage guide, see [USAGE.md](USAGE.md)**

### Download Video

1. Select option `[1]` from the main menu
2. Enter the YouTube video URL
3. Choose your preferred quality
4. Wait for the download to complete
5. Find your video in `~/storage/downloads/`

### Download MP3

1. Select option `[2]` from the main menu
2. Enter the YouTube video URL
3. Choose your preferred audio quality
4. Wait for the download to complete
5. Find your MP3 in `~/storage/downloads/`

### Other Options

- **[3]** Check/Install Dependencies
- **[4]** Update yt-dlp to latest version
- **[5]** Exit the program

---

## 📸 Screenshots

### Main Banner
```
╔═══════════════════════════════════════════════════════════════╗
║                                                               ║
║  ████████╗██╗   ██╗██████╗ ███████╗     ██████╗ ██████╗  █████╗ ██████╗   ║
║  ╚══██╔══╝██║   ██║██╔══██╗██╔════╝    ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗  ║
║     ██║   ██║   ██║██████╔╝█████╗      ██║  ███╗██████╔╝███████║██████╔╝  ║
║     ██║   ██║   ██║██╔══██╗██╔══╝      ██║   ██║██╔══██╗██╔══██║██╔══██╗  ║
║     ██║   ╚██████╔╝██████╔╝███████╗    ╚██████╔╝██║  ██║██║  ██║██████╔╝  ║
║     ╚═╝    ╚═════╝ ╚═════╝ ╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝   ║
║                                                               ║
║        YouTube Video & MP3 Downloader for Termux             ║
║              All Qualities • Fast • Easy to Use              ║
╚═══════════════════════════════════════════════════════════════╝
```

---

## 🎯 Examples

> 💡 **See [USAGE.md](USAGE.md) for more examples and advanced usage**

### Download a music video in best quality
```bash
# Run the script
./youtube-downloader.sh

# Choose option 1 (Video)
# Paste: https://www.youtube.com/watch?v=dQw4w9WgXcQ
# Select quality: 1 (Best Quality)
```

### Download audio only (MP3)
```bash
# Run the script
./youtube-downloader.sh

# Choose option 2 (MP3)
# Paste: https://www.youtube.com/watch?v=dQw4w9WgXcQ
# Select quality: 1 (320 kbps)
```

### Custom format download
```bash
# Run the script
./youtube-downloader.sh

# Choose option 1 (Video)
# Paste your URL
# Select quality: 6 (Custom)
# View available formats and choose your preferred format codes
```

---

## ❓ FAQ

> 📚 **For comprehensive troubleshooting and tips, see [USAGE.md](USAGE.md)**

### Q: Where are my downloaded files saved?
**A:** All downloads are saved in `~/storage/downloads/` which is your phone's Download folder.

### Q: The script says "Permission denied"
**A:** Make sure you've made the script executable:
```bash
chmod +x youtube-downloader.sh
```

### Q: Downloads are failing
**A:** Try updating yt-dlp using option [4] in the main menu, or run:
```bash
pip install --upgrade yt-dlp
```

### Q: Can I download playlists?
**A:** Currently, the script downloads single videos. For playlists, paste each video URL individually.

### Q: Storage permission issues?
**A:** Run `termux-setup-storage` and grant Termux access to your storage when prompted.

### Q: How do I update the script?
**A:** Pull the latest changes from the repository:
```bash
cd tubegrab
git pull
```

### Q: Video and audio are not merging
**A:** Make sure ffmpeg is installed:
```bash
pkg install ffmpeg -y
```

---

## 🛠️ Troubleshooting

### Error: "yt-dlp: command not found"
```bash
pip install yt-dlp
```

### Error: "ffmpeg: command not found"
```bash
pkg install ffmpeg -y
```

### Error: "No module named 'pip'"
```bash
pkg install python -y
```

### Downloads are very slow
- Check your internet connection
- Try a different time of day
- Some videos may have speed limitations

### Script freezes or crashes
```bash
# Force update all dependencies
pkg update && pkg upgrade -y
pip install --upgrade yt-dlp
```

---

## 🔄 Updates

To update TubeGrab to the latest version:

```bash
cd tubegrab
git pull
chmod +x youtube-downloader.sh
```

---

## 📝 Changelog

### v1.0.0 (2024-02-11)
- Initial release
- Video download with multiple quality options
- MP3 download with multiple bitrate options
- Colorful terminal interface
- Auto-dependency installation
- Format selection guide
- Progress indicators

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## ⚠️ Disclaimer

This tool is for personal use only. Please respect copyright laws and YouTube's Terms of Service. Only download videos you have permission to download or that are in the public domain.

---

> ### 📘 Need Help?
> 
> Check out **[USAGE.md](USAGE.md)** for the complete user guide with:
> - Detailed usage instructions
> - Quality selection recommendations
> - Advanced features and tips
> - Comprehensive troubleshooting
> - Keyboard shortcuts and tricks
>
> **[→ Read the Full Usage Guide](USAGE.md)**

---

## 🌟 Support

If you find this tool helpful, please give it a ⭐ on GitHub!

### Report Issues
Found a bug? [Open an issue](https://github.com/HYDRA-TERMUX/tubegrab/issues)

### Donate
If you'd like to support development:
- ☕ [Buy me a coffee](https://buymeacoffee.com/yourusername)
- 🪙 Bitcoin: `your-btc-address`

---

## 📞 Contact

- GitHub: [@HYDRA-TERMUX](https://github.com/yourusername)
- Email: hydra.termux@example.com
- Twitter: [@HYDRA-TERMUX](https://twitter.com/yourusername)

---

<div align="center">

**Made with ❤️ for the Termux community**

[⬆ Back to Top](#-tubegrab---youtube-downloader-for-termux)

</div>
- Android device (5.0+)
- Termux app ([F-Droid](https://f-droid.org/packages/com.termux/) or [GitHub](https://github.com/termux/termux-app))
- Storage permission
- Internet connection

---

## 🚀 Installation

### Method 1: Automatic Installation (Recommended)

```bash
# Install git if not already installed
pkg install git -y

# Clone the repository
git clone https://github.com/HYDRA-TERMUX/tubegrab.git

# Navigate to the directory
cd tubegrab

# Make the script executable
chmod +x youtube-downloader.sh

# Run the script
./youtube-downloader.sh
```

### Method 2: Manual Installation

```bash
# Update packages
pkg update && pkg upgrade -y

# Install required packages
pkg install python ffmpeg -y

# Install yt-dlp
pip install yt-dlp

# Download the script
curl -O https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/youtube-downloader.sh

# Make it executable
chmod +x youtube-downloader.sh

# Run the script
./youtube-downloader.sh
```

### Method 3: Quick Install (One-liner)

```bash
curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/install.sh | bash
```

---

## 💡 Usage

### Starting the Program

```bash
./youtube-downloader.sh
```

### Download Video

1. Select option `[1]` from the main menu
2. Enter the YouTube video URL
3. Choose your preferred quality
4. Wait for the download to complete
5. Find your video in `~/storage/downloads/`

### Download MP3

1. Select option `[2]` from the main menu
2. Enter the YouTube video URL
3. Choose your preferred audio quality
4. Wait for the download to complete
5. Find your MP3 in `~/storage/downloads/`

### Other Options

- **[3]** Check/Install Dependencies
- **[4]** Update yt-dlp to latest version
- **[5]** Exit the program

---

## 📸 Screenshots

### Main Banner
```
╔═══════════════════════════════════════════════════════════════╗
║                                                               ║
║  ████████╗██╗   ██╗██████╗ ███████╗     ██████╗ ██████╗  █████╗ ██████╗   ║
║  ╚══██╔══╝██║   ██║██╔══██╗██╔════╝    ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗  ║
║     ██║   ██║   ██║██████╔╝█████╗      ██║  ███╗██████╔╝███████║██████╔╝  ║
║     ██║   ██║   ██║██╔══██╗██╔══╝      ██║   ██║██╔══██╗██╔══██║██╔══██╗  ║
║     ██║   ╚██████╔╝██████╔╝███████╗    ╚██████╔╝██║  ██║██║  ██║██████╔╝  ║
║     ╚═╝    ╚═════╝ ╚═════╝ ╚══════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝   ║
║                                                               ║
║        YouTube Video & MP3 Downloader for Termux             ║
║              All Qualities • Fast • Easy to Use              ║
╚═══════════════════════════════════════════════════════════════╝
```

---

## 🎯 Examples

### Download a music video in best quality
```bash
# Run the script
./youtube-downloader.sh

# Choose option 1 (Video)
# Paste: https://www.youtube.com/watch?v=dQw4w9WgXcQ
# Select quality: 1 (Best Quality)
```

### Download audio only (MP3)
```bash
# Run the script
./youtube-downloader.sh

# Choose option 2 (MP3)
# Paste: https://www.youtube.com/watch?v=dQw4w9WgXcQ
# Select quality: 1 (320 kbps)
```

### Custom format download
```bash
# Run the script
./youtube-downloader.sh

# Choose option 1 (Video)
# Paste your URL
# Select quality: 6 (Custom)
# View available formats and choose your preferred format codes
```

---

## ❓ FAQ

### Q: Where are my downloaded files saved?
**A:** All downloads are saved in `~/storage/downloads/` which is your phone's Download folder.

### Q: The script says "Permission denied"
**A:** Make sure you've made the script executable:
```bash
chmod +x youtube-downloader.sh
```

### Q: Downloads are failing
**A:** Try updating yt-dlp using option [4] in the main menu, or run:
```bash
pip install --upgrade yt-dlp
```

### Q: Can I download playlists?
**A:** Currently, the script downloads single videos. For playlists, paste each video URL individually.

### Q: Storage permission issues?
**A:** Run `termux-setup-storage` and grant Termux access to your storage when prompted.

### Q: How do I update the script?
**A:** Pull the latest changes from the repository:
```bash
cd tubegrab
git pull
```

### Q: Video and audio are not merging
**A:** Make sure ffmpeg is installed:
```bash
pkg install ffmpeg -y
```

---

## 🛠️ Troubleshooting

### Error: "yt-dlp: command not found"
```bash
pip install yt-dlp
```

### Error: "ffmpeg: command not found"
```bash
pkg install ffmpeg -y
```

### Error: "No module named 'pip'"
```bash
pkg install python -y
```

### Downloads are very slow
- Check your internet connection
- Try a different time of day
- Some videos may have speed limitations

### Script freezes or crashes
```bash
# Force update all dependencies
pkg update && pkg upgrade -y
pip install --upgrade yt-dlp
```

---

## 🔄 Updates

To update TubeGrab to the latest version:

```bash
cd tubegrab
git pull
chmod +x youtube-downloader.sh
```

---

## 📝 Changelog

### v1.0.0 (2024-02-11)
- Initial release
- Video download with multiple quality options
- MP3 download with multiple bitrate options
- Colorful terminal interface
- Auto-dependency installation
- Format selection guide
- Progress indicators

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## ⚠️ Disclaimer

This tool is for personal use only. Please respect copyright laws and YouTube's Terms of Service. Only download videos you have permission to download or that are in the public domain.

---

## 🌟 Support

If you find this tool helpful, please give it a ⭐ on GitHub!

### Report Issues
Found a bug? [Open an issue](https://github.com/HYDRA-TERMUX/tubegrab/issues)

### Donate
If you'd like to support development:
- ☕ [Buy me a coffee](https://www.paypal.com/paypalme/techcochi)

[💵$10](https://www.paypal.com/paypalme/techcochi/10)

[💵$15](https://www.paypal.com/paypalme/techcochi/15)

[💵$
20](https://www.paypal.com/paypalme/techcochi/20)

---
---

<div align="center">

**Made with ❤️ for the Termux community**

[⬆ Back to Top](#-tubegrab---youtube-downloader-for-termux)

</div>
