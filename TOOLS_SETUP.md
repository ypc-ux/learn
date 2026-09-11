# How to Use the Google Skills + Clipping System

## 1. Google Search Skills — Install & Use

The 1000+ skills from awesome-agent-skills and 204 skills from Claude-Skills are now cloned locally.

### Location
```
/Users/thefuckingman/.cline/data/workspaces/chat/awesome-agent-skills/
/Users/thefuckingman/.cline/data/workspaces/chat/Claude-Skills/
```

### Key Skills for Your Business

| Skill | Location | Use For |
|---|---|---|
| cold-email | Claude-Skills/marketing-skill/cold-email/ | Zeerak's BD outreach |
| content-humanizer | Claude-Skills/marketing-skill/content-humanizer/ | Making AI copy sound human |
| content-creator | Claude-Skills/marketing-skill/content-creator/ | Social media content |
| copywriting | Claude-Skills/marketing-skill/copywriting/ | All marketing copy |
| email-sequence | Claude-Skills/marketing-skill/email-sequence/ | Follow-up sequences |
| landing-page-generator | Claude-Skills/marketing-skill/landing-page-generator/ | Client landing pages |
| paid-ads | Claude-Skills/marketing-skill/paid-ads/ | Meta + Google ads copy |
| marketing-psychology | Claude-Skills/marketing-skill/marketing-psychology/ | Hook architecture, curiosity loops |
| seo-specialist | Claude-Skills/marketing-skill/seo-specialist/ | Client SEO |
| social-media-manager | Claude-Skills/marketing-skill/social-media-manager/ | Ascent Placements content |
| competitor-teardown | Claude-Skills/business-growth/competitive-teardown/ | Research competitors |
| contract-and-proposal-writer | Claude-Skills/business-growth/contract-and-proposal-writer/ | Client proposals |

### How to Use

Copy any skill's SKILL.md into your Cline `.clinerules` or use as reference:

```bash
# Example: Use the content-humanizer skill
cat Claude-Skills/marketing-skill/content-humanizer/SKILL.md
```

Or add to your Cline rules:
```bash
echo "Read /path/to/Claude-Skills/marketing-skill/content-humanizer/SKILL.md for all copywriting" >> .clinerules
```

## 2. Clip Forge — YouTube → TikTok Pipeline

Installed tools:
- yt-dlp (video downloader)
- ffmpeg (video processor)
- whisper (transcriber — install with: pip install openai-whisper)

### Usage
```bash
clip-forge "https://youtube.com/watch?v=VIDEO_ID" 5 60
# This downloads, transcribes, and cuts into 5 clips of 60 seconds each
```

### Location
- Script: ~/bin/clip-forge
- Source: /Users/thefuckingman/.cline/data/workspaces/chat/learn/clip-forge.sh

### What It Does
1. Downloads YouTube video
2. Transcribes with Whisper (if installed)
3. Cuts into equal-length clips (default: 5 clips × 60s)
4. Resizes to 1080×1920 (TikTok vertical)
5. Adds basic color grade (contrast + brightness)
6. Outputs clips ready for TikTok upload

### The Flywheel
```
YouTube → Download → Transcribe → Find hooks → Cut clips → 
Add captions → Post to TikTok → Track engagement → 
Feed data back → Better hooks → More clips
```

### What's Missing (Build Later)
- Auto-posting to TikTok (needs TikTok API key)
- AI hook detection (needs Ollama/Llama running locally)
- Auto-caption generation (needs FFmpeg drawtext + Whisper timestamps)
- Color grading (basic version included; LUT-based is better)
