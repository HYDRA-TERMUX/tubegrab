# 📥 Single Script Installation Guide

Complete guide for the TubeGrab single-script installer.

---

## 🚀 One-Line Installation

The easiest way to install TubeGrab:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/setup.sh)
```

### What This Command Does:

1. **Downloads** the setup script from GitHub
2. **Runs** it automatically in bash
3. **Installs** everything you need
4. **Configures** TubeGrab
5. **Ready** to use immediately!

---

## 📋 What Gets Installed

The setup script automatically installs:

### Core Dependencies:
- ✅ **Python 3** - For running yt-dlp
- ✅ **yt-dlp** - YouTube download engine
- ✅ **FFmpeg** - Video/audio processing
- ✅ **Git** - For downloading TubeGrab

### TubeGrab Files:
- ✅ Main downloader script
- ✅ Installation scripts
- ✅ Documentation files
- ✅ License and README

### Directories Created:
- ✅ `/sdcard/TubeGrab/Video/` - For video downloads
- ✅ `/sdcard/TubeGrab/MP3/` - For audio downloads
- ✅ `~/tubegrab/` - Program files

---

## 🎬 Installation Process

### Step-by-Step Breakdown:

```
[*] Step 1/8: Updating Termux packages...
[✓] Packages updated successfully

[*] Step 2/8: Upgrading installed packages...
[✓] Packages upgraded successfully

[*] Step 3/8: Installing Git...
[✓] Git installed successfully

[*] Step 4/8: Installing Python...
[✓] Python installed successfully

[*] Step 5/8: Installing FFmpeg...
[✓] FFmpeg installed successfully

[*] Step 6/8: Installing yt-dlp...
[✓] yt-dlp installed successfully

[*] Step 7/8: Setting up storage access...
[!] Storage permission required - Please allow when prompted!
[✓] Storage access granted

[*] Step 8/8: Downloading TubeGrab...
[✓] TubeGrab downloaded successfully

╔═══════════════════════════════════════════════════════════════╗
║          🎉 Installation Completed Successfully! 🎉           ║
╚═══════════════════════════════════════════════════════════════╝
```

---

## ⏱️ Installation Time

Typical installation times:

| Internet Speed | Time Required |
|---------------|---------------|
| 🚀 Fast (50+ Mbps) | 2-3 minutes |
| ⚡ Medium (10-50 Mbps) | 3-5 minutes |
| 🐌 Slow (under 10 Mbps) | 5-10 minutes |

---

## 📱 Storage Permission

During installation, you'll see:

```
[*] Step 7/8: Setting up storage access...
[!] Storage permission required - Please allow when prompted!
```

**What to do:**
1. A system dialog will appear
2. Tap **"Allow"** or **"Grant"**
3. Wait for confirmation

**Why needed:**
- To create download folders on SD card
- To save videos and MP3s
- To access your files

---

## ✅ Verification

After installation, you'll see:

```
📦 Installed Components:
  ✓ Python:  3.11.x
  ✓ yt-dlp:  2024.xx.xx
  ✓ FFmpeg:  6.x
  ✓ Git:     2.x.x

📁 Download Locations:
  Videos: /sdcard/TubeGrab/Video/
  MP3s:   /sdcard/TubeGrab/MP3/
```

---

## 🚀 Quick Start After Installation

The script will ask:

```
Would you like to start TubeGrab now? (y/n):
```

### Option 1: Start Now (y)
- Press `y` and Enter
- TubeGrab launches immediately
- Start downloading!

### Option 2: Start Later (n)
- Press `n` and Enter
- Run anytime with:
  ```bash
  cd ~/tubegrab
  ./youtube-downloader.sh
  ```

---

## 🔧 Customization Options

### Create a Shortcut

Add this to automatically run TubeGrab:

```bash
echo 'alias tube="cd ~/tubegrab && ./youtube-downloader.sh"' >> ~/.bashrc
source ~/.bashrc
```

Then just type:
```bash
tube
```

### Create Desktop Icon (Advanced)

```bash
mkdir -p ~/.shortcuts
echo "cd ~/tubegrab && ./youtube-downloader.sh" > ~/.shortcuts/TubeGrab
chmod +x ~/.shortcuts/TubeGrab
```

---

## 🔄 Updating TubeGrab

The installer supports updates!

If TubeGrab is already installed, running the installer again will:
- ✅ Update to latest version
- ✅ Keep your settings
- ✅ Preserve download history
- ✅ Update dependencies

**Update command:**
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/setup.sh)
```

---

## 🛠️ Troubleshooting

### Issue: "Permission denied"
**Solution:**
```bash
termux-setup-storage
# Grant permission when prompted
# Run installer again
```

### Issue: "curl: command not found"
**Solution:**
```bash
pkg install curl -y
# Run installer again
```

### Issue: "Failed to download"
**Solution:**
1. Check internet connection
2. Try again in a few minutes
3. Use alternative method:
   ```bash
   pkg install git -y
   git clone https://github.com/HYDRA-TERMUX/tubegrab.git
   cd tubegrab
   ./install.sh
   ```

### Issue: Installation stuck
**Solution:**
1. Press `Ctrl + C` to cancel
2. Clear cache:
   ```bash
   pkg clean
   ```
3. Run installer again

### Issue: "No space left"
**Solution:**
```bash
# Check available space
df -h
# Free up space and try again
```

---

## 🔐 Security

### Is the installer safe?

**YES!** Here's why:

1. ✅ **Open Source** - View the code anytime:
   ```
   https://github.com/HYDRA-TERMUX/tubegrab/blob/main/setup.sh
   ```

2. ✅ **Official Repository** - From HYDRA-TERMUX GitHub

3. ✅ **No Root Required** - Runs in Termux sandbox

4. ✅ **Auditable** - Every line visible and reviewable

### What the installer does:
- ✅ Installs from official package sources (pkg)
- ✅ Uses official Python pip repository
- ✅ Clones from official GitHub repository
- ❌ Never asks for passwords
- ❌ Doesn't modify system files
- ❌ Doesn't request root access

---

## 📊 Download Size

Total download size:

| Component | Size |
|-----------|------|
| Python | ~50 MB |
| FFmpeg | ~40 MB |
| yt-dlp | ~3 MB |
| Git | ~15 MB |
| TubeGrab | <1 MB |
| **Total** | **~110 MB** |

**Storage needed:** ~200 MB (including installation space)

---

## 🌐 Offline Installation

Can't download during installation? Use offline method:

### Step 1: Download on Computer
1. Go to: https://github.com/HYDRA-TERMUX/tubegrab
2. Click "Code" → "Download ZIP"
3. Transfer to phone

### Step 2: Install on Phone
```bash
pkg install git python ffmpeg -y
pip install yt-dlp
cd ~/Downloads
unzip tubegrab-main.zip
mv tubegrab-main ~/tubegrab
cd ~/tubegrab
chmod +x *.sh
./youtube-downloader.sh
```

---

## 🔄 Reinstallation

To completely reinstall:

```bash
# Remove old installation
rm -rf ~/tubegrab

# Run installer
bash <(curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/setup.sh)
```

---

## 💡 Pro Tips

### 1. Save the Command
Bookmark or save the installation command for future updates:
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/setup.sh)
```

### 2. Check Before Installing
View the script before running:
```bash
curl https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/setup.sh
```

### 3. Install Silently (No Prompts)
For advanced users:
```bash
yes n | bash <(curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/setup.sh)
```

### 4. Install to Custom Location
```bash
cd /path/to/custom/location
git clone https://github.com/HYDRA-TERMUX/tubegrab.git
cd tubegrab
./install.sh
```

---

## 📞 Getting Help

If installation fails:

1. **Check Error Message** - Read what went wrong
2. **Try Again** - Many issues are temporary
3. **Update Termux** - Run `pkg upgrade`
4. **Report Issue** - Open issue on GitHub:
   ```
   https://github.com/HYDRA-TERMUX/tubegrab/issues
   ```

Include in your report:
- Error message
- Termux version
- Android version
- Installation method used

---

## ✨ After Installation

Once installed, you can:

- 📥 Download videos in any quality (360p to 8K)
- 🎵 Extract MP3 audio (96-320 kbps)
- 📁 Find files in organized folders
- 🔄 Update anytime by re-running installer
- ⭐ Star the project on GitHub!

---

## 🎉 Success!

**You're ready to use TubeGrab!**

Quick commands:
```bash
# Start TubeGrab
cd ~/tubegrab && ./youtube-downloader.sh

# Or with shortcut (after setup)
tube

# Update TubeGrab
bash <(curl -fsSL https://raw.githubusercontent.com/HYDRA-TERMUX/tubegrab/main/setup.sh)
```

---

**Need help?** Check:
- 📖 [USAGE.md](USAGE.md) - How to use
- 📚 [README.md](README.md) - Full documentation
- 🐛 [GitHub Issues](https://github.com/HYDRA-TERMUX/tubegrab/issues) - Get support

**Enjoy TubeGrab!** 🚀
