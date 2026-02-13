# 🚀 TubeGrab Installation Guide

## ⚡ Quick Install (ONE COMMAND) - EASIEST!

Copy and paste this in Termux:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/setup.sh)
```

**Done!** The script handles everything automatically. 🎉

---

## Alternative Installation Methods

## Quick Install (One Command)

Copy and paste this in Termux:

```bash
pkg install git -y && git clone https://github.com/HYDRA-TERMUX/tubegrab.git && cd tubegrab && chmod +x install.sh && ./install.sh
```

---

## Step-by-Step Installation

### 1️⃣ Install Git
```bash
pkg install git -y
```

### 2️⃣ Clone Repository
```bash
git clone https://github.com/HYDRA-TERMUX/tubegrab.git
```

### 3️⃣ Enter Directory
```bash
cd tubegrab
```

### 4️⃣ Run Installer
```bash
chmod +x install.sh
./install.sh
```

### 5️⃣ Start Using
```bash
./youtube-downloader.sh
```

---

## Alternative: Direct Script Download

If you only want the main script:

```bash
curl -O https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/youtube-downloader.sh
chmod +x youtube-downloader.sh
pkg install python ffmpeg -y
pip install yt-dlp
./youtube-downloader.sh
```

---

## Update TubeGrab

To get the latest version:

```bash
cd tubegrab
git pull
chmod +x *.sh
```

---

## Uninstall

```bash
# Remove TubeGrab
rm -rf ~/tubegrab

# Optional: Remove dependencies
pip uninstall yt-dlp -y
pkg uninstall ffmpeg -y
```

---

## Repository

🔗 **GitHub**: https://github.com/HYDRA-TERMUX/tubegrab
⭐ **Give it a star if you like it!**

---

## Support

- 📝 **Issues**: https://github.com/HYDRA-TERMUX/tubegrab/issues
- 💬 **Discussions**: https://github.com/HYDRA-TERMUX/tubegrab/discussions
- 🐛 **Bug Reports**: Open an issue with detailed info

---

## Features

✅ Download videos in all qualities (360p - Best)
✅ Extract MP3 audio (96-320 kbps)
✅ Colorful terminal interface
✅ Auto-installer for dependencies
✅ Custom format selection
✅ Fast and reliable
✅ Regular updates

---

**Made with ❤️ by HYDRA-TERMUX**
