# TubeGrab Usage Guide

Complete guide for using TubeGrab YouTube downloader.

## Table of Contents
- [Getting Started](#getting-started)
- [Video Downloads](#video-downloads)
- [Audio Downloads](#audio-downloads)
- [Advanced Features](#advanced-features)
- [Tips & Tricks](#tips--tricks)
- [Troubleshooting](#troubleshooting)

---

## Getting Started

### First Launch

1. Open Termux
2. Navigate to TubeGrab directory:
   ```bash
   cd tubegrab
   ```
3. Run the script:
   ```bash
   ./youtube-downloader.sh
   ```

### Granting Permissions

On first run, you may need to grant storage permissions:
1. When prompted, type `y` and press Enter
2. A system dialog will appear
3. Tap "Allow" to grant storage access

---

## Video Downloads

### Standard Quality Download

1. Select `[1]` from main menu
2. Paste YouTube URL (e.g., `https://www.youtube.com/watch?v=dQw4w9WgXcQ`)
3. Choose quality:
   - `[1]` Best Quality - Highest available (may be 4K, 1440p, or 1080p)
   - `[2]` 1080p - Full HD
   - `[3]` 720p - HD Ready
   - `[4]` 480p - Standard Definition
   - `[5]` 360p - Low Quality (saves data)

### Custom Format Download

For advanced users who want specific codecs or formats:

1. Select `[1]` from main menu
2. Paste YouTube URL
3. Choose `[6]` Custom Format
4. Review the format list:
   ```
   ID  EXT   RESOLUTION  FPS  CODEC
   137 mp4   1920x1080   30   avc1.640028
   136 mp4   1280x720    30   avc1.4d401f
   ...
   140 m4a   audio only      mp4a.40.2
   ```
5. Enter format code:
   - Video only: `137` (you'll need to merge with audio)
   - Video+Audio: `137+140` (recommended)
   - Audio only: `140`

### Understanding Video Formats

**Container Formats:**
- `.mp4` - Most compatible, works on all devices
- `.webm` - Smaller file size, may not work on older devices
- `.mkv` - High quality, best for PC viewing

**Codecs:**
- `avc1` (H.264) - Universal compatibility
- `vp9` - Better compression, newer devices
- `av01` - Best quality, requires powerful device

---

## Audio Downloads

### MP3 Quality Guide

1. Select `[2]` from main menu
2. Paste YouTube URL
3. Choose quality:

| Option | Bitrate | Quality | File Size | Use Case |
|--------|---------|---------|-----------|----------|
| [1] | 320 kbps | Best | ~7-10 MB | Audiophile, archiving |
| [2] | 256 kbps | High | ~5-8 MB | High-quality listening |
| [3] | 192 kbps | Medium | ~4-6 MB | Good balance |
| [4] | 128 kbps | Standard | ~3-4 MB | Normal listening |
| [5] | 96 kbps | Low | ~2-3 MB | Save storage |

### Recommended Settings

- **Music albums:** 256-320 kbps
- **Podcasts:** 128 kbps
- **Audiobooks:** 96-128 kbps
- **Quick listen:** 128-192 kbps

---

## Advanced Features

### Batch Downloading

To download multiple videos, create a list:

1. Create a text file with URLs:
   ```bash
   echo "https://www.youtube.com/watch?v=video1" > urls.txt
   echo "https://www.youtube.com/watch?v=video2" >> urls.txt
   ```

2. Download all:
   ```bash
   while read url; do
       yt-dlp -f best "$url" -o "~/storage/downloads/%(title)s.%(ext)s"
   done < urls.txt
   ```

### Download Playlist

```bash
yt-dlp -f best "PLAYLIST_URL" -o "~/storage/downloads/%(playlist)s/%(title)s.%(ext)s"
```

### Subtitle Download

```bash
yt-dlp --write-sub --sub-lang en "VIDEO_URL"
```

### Thumbnail Download

```bash
yt-dlp --write-thumbnail --skip-download "VIDEO_URL"
```

---

## Tips & Tricks

### Speed Up Downloads

1. **Use lower quality** for faster downloads
2. **Download during off-peak hours** (late night/early morning)
3. **Close other apps** using internet
4. **Connect to WiFi** instead of mobile data

### Save Storage Space

- Use 720p instead of 1080p (half the size, similar quality)
- Use 128 kbps for audio (indistinguishable for most content)
- Regularly clean old downloads

### Best Quality Recommendations

**For watching on:**
- **Phone:** 720p (perfect balance)
- **Tablet:** 1080p
- **TV/Monitor:** Best Quality or 1080p
- **Projector:** Best Quality

**For listening:**
- **Headphones:** 256-320 kbps
- **Speakers:** 192-256 kbps
- **Car audio:** 192 kbps
- **Phone speaker:** 128 kbps

### Create Shortcuts

Add to `.bashrc` for quick access:
```bash
echo "alias tube='cd ~/tubegrab && ./youtube-downloader.sh'" >> ~/.bashrc
source ~/.bashrc
```

Now just type `tube` to launch!

---

## Troubleshooting

### "Video unavailable"
- Check if video is region-locked
- Try using VPN
- Verify URL is correct

### "Format not available"
- Try different quality option
- Use custom format selection
- Update yt-dlp: `pip install --upgrade yt-dlp`

### Slow downloads
- Check internet speed
- Try different time
- Lower quality setting
- Restart Termux

### Audio and video not merging
- Install ffmpeg: `pkg install ffmpeg -y`
- Restart script

### Script won't run
```bash
chmod +x youtube-downloader.sh
```

### Out of storage
```bash
# Check available space
df -h ~/storage/downloads

# Clean old downloads
rm ~/storage/downloads/old_video.mp4
```

---

## Keyboard Shortcuts

- `Ctrl + C` - Cancel current download
- `Ctrl + Z` - Pause (background)
- `fg` - Resume paused task
- `Ctrl + D` - Exit Termux

---

## File Organization

TubeGrab saves files to:
```
~/storage/downloads/
  └── Your videos and MP3s
```

This is your phone's Download folder, accessible via:
- File manager
- Gallery app (videos)
- Music player (MP3s)

---

## Getting Help

- Check FAQ in README.md
- Open GitHub issue
- Update yt-dlp: `pip install --upgrade yt-dlp`
- Reinstall: `./install.sh`

---

## Legal Notice

Only download content you have permission to download. Respect copyright laws and content creators.

---

**Happy downloading! 🎬🎵**
