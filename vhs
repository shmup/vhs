#!/usr/bin/env bash

if ! command -v mpv &>/dev/null; then
  echo "error: mpv is not installed."
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SHADER_PATH="$SCRIPT_DIR/vhs.glsl"

if [ ! -f "$SHADER_PATH" ]; then
  echo "error: VHS shader not found at $SHADER_PATH"
  exit 1
fi

if [ $# -eq 0 ]; then
  echo "Usage: ./vhs.sh /path/to/video"
  echo "Options:"
  echo "  -f, --fullscreen    Start in fullscreen mode"
  exit 1
fi

FULLSCREEN=""
VIDEO_PATH=""

for arg in "$@"; do
  if [ "$arg" == "-f" ] || [ "$arg" == "--fullscreen" ]; then
    FULLSCREEN="--fullscreen"
  elif [ "${arg:0:1}" != "-" ]; then
    VIDEO_PATH="$arg"
  fi
done

if [ -z "$VIDEO_PATH" ]; then
  echo "error: No video file specified"
  exit 1
fi

echo "Playing $VIDEO_PATH with VHS effects..."
mpv $FULLSCREEN \
  --no-keepaspect-window \
  --vf=crop=ih*4/3:ih:iw/2-ih*4/3/2:0 \
  --panscan=1.0 \
  --glsl-shader="$SHADER_PATH" \
  --profile=gpu-hq \
  --window-scale=1.0 \
  --autofit-larger=90%x90% \
  --autofit-smaller=40%x40% \
  "$VIDEO_PATH"
