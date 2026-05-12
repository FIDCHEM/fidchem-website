#!/bin/bash
# FIDCHEM — Download ALL images from old WordPress site (all pages)
# Run once: bash download-images.sh
# Works on macOS bash 3.2+

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ARCHIVE="$SCRIPT_DIR/imgs/ArchivedReplased-Photobank"
STATIC="$SCRIPT_DIR/static/img"

mkdir -p "$ARCHIVE" "$STATIC"

dl() {
  local name="$1" url="$2"
  if [ -f "$ARCHIVE/$name" ]; then
    echo "  ↩  $name (already exists, skipping)"
    return
  fi
  echo "  ↓  $name"
  curl -s -L --max-time 60 "$url" -o "$ARCHIVE/$name" \
    && echo "     ✓ $(du -sh "$ARCHIVE/$name" | cut -f1)" \
    || echo "     ✗ failed: $url"
}

echo "━━━ HOMEPAGE images ━━━"
dl "logo.png"          "https://fidchem.com/wp-content/uploads/2025/02/logo.png"
dl "krug.png"          "https://fidchem.com/wp-content/uploads/2025/03/%D0%9A%D1%80%D1%83%D0%B3.png"
dl "img-hash-1.png"    "https://fidchem.com/wp-content/uploads/2025/03/056bfc2c13272f8dfb8c81fea3ae31da.png"
dl "img-hash-2.png"    "https://fidchem.com/wp-content/uploads/2025/03/27589aaf208abec8fc19e809f66e02e1.png"
dl "img-hash-3.png"    "https://fidchem.com/wp-content/uploads/2025/03/437257c1ec3df121dc60d724c095a7d4.png"
dl "img-hash-4.png"    "https://fidchem.com/wp-content/uploads/2025/03/5703074f8096b8d1c1f4581e66c83237.png"
dl "img-hash-5.png"    "https://fidchem.com/wp-content/uploads/2025/03/5f11b1f3d7ed9b286b094935e6f6d8f4.png"
dl "img-hash-6.png"    "https://fidchem.com/wp-content/uploads/2025/03/d141fc84a9c5b8f7029ac5e9903172be.png"
dl "team-photo-1.png"  "https://fidchem.com/wp-content/uploads/2025/03/0b3eecd60021955beec2313e14e3e640.png"
dl "team-photo-2.png"  "https://fidchem.com/wp-content/uploads/2025/03/7a37b0359803dd3dc1d980d74c7baab4.png"
dl "facility-1.png"    "https://fidchem.com/wp-content/uploads/2025/03/fl1.png"
dl "facility-2.png"    "https://fidchem.com/wp-content/uploads/2025/03/fl.png"
dl "Gloio.png"         "https://fidchem.com/wp-content/uploads/2025/03/Gloio.png"
dl "pcdr-icon.png"     "https://fidchem.com/wp-content/uploads/2025/02/pcdr-icon.png"
dl "pcdo-icon.png"     "https://fidchem.com/wp-content/uploads/2025/02/pcdo-icon.png"
dl "pcds-icon.png"     "https://fidchem.com/wp-content/uploads/2025/02/pcds-icon.png"
dl "gloio-icon.png"    "https://fidchem.com/wp-content/uploads/2025/02/glio-icon.png"
dl "pcdr-photo.png"    "https://fidchem.com/wp-content/uploads/2025/02/pcdr-1.png"
dl "pcdo-photo.png"    "https://fidchem.com/wp-content/uploads/2025/02/pcdo-1.png"
dl "pcds-photo.png"    "https://fidchem.com/wp-content/uploads/2025/02/pcds-1.png"
dl "gloio-photo.png"   "https://fidchem.com/wp-content/uploads/2025/02/gloio-1.png"
dl "truba-sait.png"    "https://fidchem.com/wp-content/uploads/2025/02/%D0%A2%D1%80%D1%83%D0%B1%D0%B0_%D1%81%D0%B0%D0%B9%D1%82.png"

echo ""
echo "━━━ PCDR page images ━━━"
dl "pcdr-graph-1.png"  "https://fidchem.com/wp-content/uploads/2025/03/g1.png"
dl "pcdr-graph-2.png"  "https://fidchem.com/wp-content/uploads/2025/03/g2.png"
dl "pcdr-graph-gr.png" "https://fidchem.com/wp-content/uploads/2025/03/gr.png"
dl "pcdr-plasma.png"   "https://fidchem.com/wp-content/uploads/2025/03/pl.png"
dl "pcdr-graph-gra.png""https://fidchem.com/wp-content/uploads/2025/03/gra.png"
dl "pcdr-formula-1.png""https://fidchem.com/wp-content/uploads/2025/03/formul.png"
dl "pcdr-formula-2.png""https://fidchem.com/wp-content/uploads/2025/03/formul2.png"

echo ""
echo "━━━ PCDO page images ━━━"
dl "pcdo-graph-1.svg"  "https://fidchem.com/wp-content/uploads/2025/03/%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9-%D0%B3%D1%80%D0%B0%D1%84%D0%B8%D0%BA_%D0%B8%D0%BC%D0%BF%D0%BE%D1%80%D1%82.svg"
dl "pcdo-graph-2.svg"  "https://fidchem.com/wp-content/uploads/2025/03/2-%D0%B9-%D0%B3%D1%80%D0%B0%D1%84%D0%B8%D0%BA-1.svg"
dl "pcdo-arrow-1.png"  "https://fidchem.com/wp-content/uploads/2025/03/%D0%A1%D1%82%D1%80%D0%B5%D0%BB%D0%BE%D1%87%D0%BA%D0%B0-1.png"
dl "pcdo-arrow-2.png"  "https://fidchem.com/wp-content/uploads/2025/03/%D0%A1%D1%82%D1%80%D0%B5%D0%BB%D0%BE%D1%87%D0%BA%D0%B0-2.png"
dl "pcdo-brief.png"    "https://fidchem.com/wp-content/uploads/2025/03/brief-pcdo.png"
dl "pcdo-rect.png"     "https://fidchem.com/wp-content/uploads/2025/03/Rectangle-1-1.png"

echo ""
echo "━━━ PCDS page images ━━━"
dl "pcds-micro.png"    "https://fidchem.com/wp-content/uploads/2025/03/micr.png"

echo ""
echo "━━━ GLOIO page images ━━━"
dl "gloio-graph.png"   "https://fidchem.com/wp-content/uploads/2025/03/Bed-volumes-passed.png"

echo ""
echo "━━━ Contacts page images ━━━"
dl "contacts-wab.png"  "https://fidchem.com/wp-content/uploads/2025/03/wab.png"

# Copy logo from imgs/ if exists
[ -f "$SCRIPT_DIR/imgs/logo.png" ] && \
  cp "$SCRIPT_DIR/imgs/logo.png" "$ARCHIVE/logo.png" 2>/dev/null && \
  echo "  ↩  logo.png (copied from imgs/)"

echo ""
echo "━━━ Optimising with sips ━━━"

for SRC in "$ARCHIVE"/*.png "$ARCHIVE"/*.jpg; do
  [ -f "$SRC" ] || continue
  NAME="$(basename "$SRC")"
  ORIG=$(du -sk "$SRC" | cut -f1)

  # Icons & small UI elements: 512px max
  if echo "$NAME" | grep -qiE 'icon|logo|arrow|formula|formul|krug|brief|rect|wab|micro|micr'; then
    sips -Z 512 --out "$STATIC/$NAME" "$SRC" > /dev/null 2>&1
  else
    # Photos, graphs, diagrams: 1400px max
    sips -Z 1400 --out "$STATIC/$NAME" "$SRC" > /dev/null 2>&1
  fi

  NEW=$(du -sk "$STATIC/$NAME" 2>/dev/null | cut -f1)
  echo "  $NAME: ${ORIG}K → ${NEW}K"
done

# Copy SVGs directly (no resize needed)
for SRC in "$ARCHIVE"/*.svg; do
  [ -f "$SRC" ] || continue
  NAME="$(basename "$SRC")"
  cp "$SRC" "$STATIC/$NAME"
  echo "  $NAME: SVG (copied as-is)"
done

echo ""
echo "✅  Done!"
TOTAL=$(du -sh "$STATIC" | cut -f1)
COUNT=$(ls "$STATIC" | wc -l | tr -d ' ')
echo "   $COUNT files in static/img/ — $TOTAL total"
echo ""
echo "Next: git add static/img/ && git commit -m 'Add all site images'"
