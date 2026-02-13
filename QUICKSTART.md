# 🚀 Quick Setup Guide

Get TubeGrab running in 5 minutes!

## Prerequisites

✅ Android device (5.0 or higher)
✅ Termux app installed
✅ Internet connection

---

## Installation Steps

### ⚡ Super Quick Install (ONE COMMAND!)

The fastest way - just copy and paste:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/setup.sh)
```

**That's it!** 🎉 The script will:
- Install all dependencies automatically
- Download TubeGrab
- Setup everything
- Ask if you want to run it immediately

---

### Alternative: Step-by-Step Installation

### Step 1: Install Termux

Download Termux from one of these sources:
- **F-Droid** (Recommended): https://f-droid.org/packages/com.termux/
- **GitHub**: https://github.com/termux/termux-app/releases

⚠️ **Don't use Google Play version** - it's outdated!

### Step 2: Open Termux

Launch Termux app and wait for it to initialize.

### Step 3: Run Installation Command

Copy and paste this command (long press to paste in Termux):

```bash
pkg install git -y && git clone https://github.com/HYDRA-TERMUX/tubegrab.git && cd tubegrab && chmod +x install.sh && ./install.sh
```

Or install step by step:

```bash
# Update Termux
pkg update && pkg upgrade -y

# Install git
pkg install git -y

# Clone repository
git clone https://github.com/HYDRA-TERMUX/tubegrab.git

# Enter directory
cd tubegrab

# Run installer
chmod +x install.sh
./install.sh
```

### Step 4: Grant Storage Permission

When prompted:
1. Type `y` and press Enter
2. Tap "Allow" on the system dialog

### Step 5: Start Using TubeGrab!

```bash
./youtube-downloader.sh
```

---

## First Download

1. Copy a YouTube video URL
2. Select `[1]` for video or `[2]` for MP3
3. Paste the URL (long press to paste)
4. Choose quality
5. Wait for download to complete!

Downloads are saved in: `~/storage/downloads/` (your phone's Download folder)

---

## One-Line Install (Advanced)

```bash
curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/install.sh | bash
```

---

## Updating TubeGrab

```bash
cd tubegrab
git pull
```

---

## Uninstalling

```bash
# Remove TubeGrab
rm -rf ~/tubegrab

# Remove dependencies (optional)
pip uninstall yt-dlp -y
pkg uninstall ffmpeg -y
```

---

## Common Issues

**"Permission denied"**
```bash
chmod +x youtube-downloader.sh
```

**"Command not found"**
```bash
cd tubegrab
./youtube-downloader.sh
```

**"No space left"**
- Free up phone storage
- Delete old downloads

---

## Need Help?

- Read the full [README.md](README.md)
- Check [USAGE.md](USAGE.md) for detailed guide
- Open an issue on GitHub

---

**That's it! Enjoy TubeGrab! 🎉**