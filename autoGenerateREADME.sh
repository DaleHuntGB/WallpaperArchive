#!/bin/bash
echo "# Wallpapers Preview" > README.md
echo "" >> README.md

for f in *.png *.jpg *.jpeg; do
  [ -f "$f" ] || continue
  echo "### ${f%.*}" >> README.md
  echo "![]($(printf '%s' "$f"))" >> README.md
  echo "" >> README.md
done
