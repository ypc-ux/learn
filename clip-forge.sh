#!/usr/bin/env bash
# Clip Forge — YouTube → TikTok clipping pipeline
# Usage: ./clip-forge.sh <youtube_url> [num_clips] [clip_length]

set -e

URL="${1:?Usage: ./clip-forge.sh <youtube_url> [num_clips] [clip_length]}"
NUM_CLIPS="${2:-5}"
CLIP_LEN="${3:-60}"

echo "🎬 Clip Forge — cutting ${NUM_CLIPS} clips of ${CLIP_LEN}s each"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Create working directory
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
WORK_DIR="$HOME/Desktop/clips_${TIMESTAMP}"
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

# Step 1: Download video
echo "📥 Step 1: Downloading video..."
yt-dlp "$URL" \
  -o "video.%(ext)s" \
  --merge-output-format mp4 \
  --no-playlist

VIDEO_FILE=$(ls video.* | head -1)
if [ -z "$VIDEO_FILE" ]; then
  echo "❌ Download failed"
  exit 1
fi

# Get video duration
DURATION=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$VIDEO_FILE")
echo "   Video duration: ${DURATION}s"

# Step 2: Transcribe (if whisper is installed)
if command -v whisper &> /dev/null; then
  echo "📝 Step 2: Transcribing with Whisper..."
  whisper "$VIDEO_FILE" \
    --model medium \
    --output_format txt \
    --output_dir transcripts/
  echo "   Transcript saved to transcripts/"
else
  echo "⚠️  Whisper not installed — skipping transcription"
  echo "   Install: pip install openai-whisper"
fi

# Step 3: Cut clips at regular intervals
echo "✂️  Step 3: Cutting ${NUM_CLIPS} clips..."

# Calculate clip start times
VIDEO_INT=${DURATION%.*}
STEP=$(( VIDEO_INT / NUM_CLIPS ))
STEP=$(( STEP < CLIP_LEN + 10 ? VIDEO_INT - CLIP_LEN : STEP ))

for i in $(seq 1 "$NUM_CLIPS"); do
  START=$(( (i - 1) * STEP ))
  END=$(( START + CLIP_LEN ))
  if [ "$END" -gt "$VIDEO_INT" ]; then
    START=$(( VIDEO_INT - CLIP_LEN ))
  fi
  START_TIME=$(printf '%02d:%02d:%02d' $((START/3600)) $((START%3600/60)) $((START%60)))
  
  echo "   Clip ${i}: ${START_TIME} → ${CLIP_LEN}s"
  
  ffmpeg -y -i "$VIDEO_FILE" \
    -ss "$START_TIME" \
    -t "$CLIP_LEN" \
    -vf "eq=contrast=1.1:brightness=0.02,scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:(ow-iw)/2:(oh-ih)/2" \
    -c:v libx264 -preset fast -crf 23 \
    -c:a aac -b:a 128k \
    -ar 44100 \
    "clip_${i}.mp4" 2> /dev/null
done

# Step 4: Report
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Done! ${NUM_CLIPS} clips ready in:"
echo "   ${WORK_DIR}"
echo ""
echo "📁 Files:"
ls -la *.mp4
echo ""
echo "📱 Next steps:"
echo "   1. Review clips in the folder"
echo "   2. Upload to TikTok manually (or use TikTok API)"
echo "   3. Add captions in CapCut or TikTok editor"
echo ""
echo "💡 Pro tip: Watch the clips and pick the best ones."
echo "   Not every clip is a banger. Curate."
