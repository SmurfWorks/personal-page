#!/bin/sh
# Render the social share image and the touch icon from their HTML designs in scripts/images/.
# Needs Google Chrome. Run after changing the designs or the portrait: npm run images
set -e

cd "$(dirname "$0")/.."

chrome="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

render() {
  "$chrome" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1 \
    --virtual-time-budget=8000 --window-size="$2" \
    --screenshot="$tmp/$3" "file://$(pwd)/scripts/images/$1" >/dev/null 2>&1
}

render og-card.html 1200,630 og.png
sips -s format jpeg -s formatOptions 85 "$tmp/og.png" --out src/assets/og-image.jpg >/dev/null

render touch-icon.html 180,180 icon.png
cp "$tmp/icon.png" src/assets/apple-touch-icon.png

echo "images: src/assets/og-image.jpg and src/assets/apple-touch-icon.png"
