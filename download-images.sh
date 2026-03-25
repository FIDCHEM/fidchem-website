#!/bin/bash
# FIDCHEM — Download & optimise images from old WordPress site
# Run once from terminal: bash download-images.sh
# Requires: curl, python3 (macOS has both by default)

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ARCHIVE="$SCRIPT_DIR/imgs/ArchivedReplased-Photobank"
IMGS="$SCRIPT_DIR/imgs"
STATIC="$SCRIPT_DIR/static/img"

mkdir -p "$ARCHIVE" "$STATIC"

echo "📥  Downloading originals from fidchem.com..."

declare -A FILES=(
  ["pcdr-icon.png"]="https://fidchem.com/wp-content/uploads/2025/02/pcdr-icon.png"
  ["pcdo-icon.png"]="https://fidchem.com/wp-content/uploads/2025/02/pcdo-icon.png"
  ["pcds-icon.png"]="https://fidchem.com/wp-content/uploads/2025/02/pcds-icon.png"
  ["gloio-icon.png"]="https://fidchem.com/wp-content/uploads/2025/02/glio-icon.png"
  ["gloio-full.png"]="https://fidchem.com/wp-content/uploads/2025/03/Gloio.png"
  ["pcdr-photo.png"]="https://fidchem.com/wp-content/uploads/2025/02/pcdr-1.png"
  ["pcdo-photo.png"]="https://fidchem.com/wp-content/uploads/2025/02/pcdo-1.png"
  ["pcds-photo.png"]="https://fidchem.com/wp-content/uploads/2025/02/pcds-1.png"
  ["gloio-photo.png"]="https://fidchem.com/wp-content/uploads/2025/02/gloio-1.png"
  ["facility-1.png"]="https://fidchem.com/wp-content/uploads/2025/03/fl1.png"
  ["facility-2.png"]="https://fidchem.com/wp-content/uploads/2025/03/fl.png"
  ["team-photo-1.png"]="https://fidchem.com/wp-content/uploads/2025/03/0b3eecd60021955beec2313e14e3e640.png"
  ["team-photo-2.png"]="https://fidchem.com/wp-content/uploads/2025/03/7a37b0359803dd3dc1d980d74c7baab4.png"
)

for NAME in "${!FILES[@]}"; do
  URL="${FILES[$NAME]}"
  echo "  → $NAME"
  curl -s -L "$URL" -o "$ARCHIVE/$NAME" || echo "  ⚠️  Failed: $NAME"
done

# Copy logo if not already in archive
[ -f "$IMGS/logo.png" ] && cp "$IMGS/logo.png" "$ARCHIVE/logo.png" && echo "  → logo.png (from existing)"

echo ""
echo "🔧  Creating optimised web copies in imgs/ ..."

python3 - <<'PYEOF'
import os, subprocess, shutil, sys

ARCHIVE = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'imgs', 'ArchivedReplased-Photobank')
IMGS    = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'imgs')
STATIC  = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'static', 'img')

# Try to use pngquant for compression, fall back to sips (macOS), fall back to copy
def optimise(src, dst, max_px=1200):
    try:
        # sips is built-in on macOS
        result = subprocess.run(
            ['sips', '-Z', str(max_px), '--out', dst, src],
            capture_output=True, text=True
        )
        if result.returncode == 0:
            orig = os.path.getsize(src)
            new  = os.path.getsize(dst)
            print(f'    {os.path.basename(dst)}: {orig//1024}KB → {new//1024}KB')
            return
    except FileNotFoundError:
        pass
    # Fallback: plain copy
    shutil.copy2(src, dst)
    print(f'    {os.path.basename(dst)}: copied (no sips)')

for fname in os.listdir(ARCHIVE):
    if not fname.lower().endswith('.png'):
        continue
    src = os.path.join(ARCHIVE, fname)
    # Web copy in imgs/
    optimise(src, os.path.join(IMGS, fname), max_px=1400)
    # Hugo static copy in static/img/
    optimise(src, os.path.join(STATIC, fname), max_px=1200)

print('Done.')
PYEOF

echo ""
echo "✅  All done!"
echo "   Originals  → imgs/ArchivedReplased-Photobank/"
echo "   Web copies → imgs/ and static/img/"
echo ""
echo "🔒  ArchivedReplased-Photobank is excluded from Git (see .gitignore)"
