#!/bin/bash
# upscale + rename + readme

for f in *; do
  case "$f" in
    *.jpg|*.jpeg)
      out="${f%.*}.png"
      ffmpeg -i "$f" -vf scale=2*iw:2*ih:flags=lanczos "$out" -y >/dev/null 2>&1
      ;;
  esac
done

for f in *.png; do
  new=$(echo "$f" | tr -d ' ')
  [ "$f" != "$new" ] && mv "$f" "$new"
done

echo "# Wallpapers Preview" > README.md
echo "" >> README.md

for f in *.png; do
  [ -f "$f" ] || continue
  echo "### ${f%.*}" >> README.md
  echo "![]($(printf '%s' "$f"))" >> README.md
  echo "" >> README.md
done
