#!/bin/bash
# Downloads the ORIGINAL published source of www.eve4art.com (built on Wix).
# Wix has no export, so this grabs exactly what Wix serves: raw page HTML,
# then every original full-res image referenced in that HTML.
# Run from anywhere:  bash wix-source/download-source.sh
set -e
cd "$(dirname "$0")/.."
mkdir -p wix-source/pages wix-source/assets-images public/images
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 Chrome/130 Safari/537.36"
dl(){ curl -sL -A "$UA" "$1" -o "$2" && echo "ok $2 $(wc -c < "$2") bytes"; }
# 1. Raw HTML for every published page (file name = Wix slug, blog page slug really is 'blank')
dl "https://www.eve4art.com/" "wix-source/pages/index.html"
dl "https://www.eve4art.com/gallery" "wix-source/pages/gallery.html"
dl "https://www.eve4art.com/gallery-l" "wix-source/pages/gallery-l.html"
dl "https://www.eve4art.com/gallery-ll" "wix-source/pages/gallery-ll.html"
dl "https://www.eve4art.com/gallery-lll" "wix-source/pages/gallery-lll.html"
dl "https://www.eve4art.com/the_story" "wix-source/pages/the_story.html"
dl "https://www.eve4art.com/contact" "wix-source/pages/contact.html"
dl "https://www.eve4art.com/blank" "wix-source/pages/blank.html"
# 2. Original images: site-owner media files all start with 0f0c73_ on static.wixstatic.com
grep -hoE 'https://static\.wixstatic\.com/media/0f0c73_[A-Za-z0-9_.-]+' wix-source/pages/*.html | sort -u > wix-source/image-urls.txt
echo "Found $(wc -l < wix-source/image-urls.txt) original images"
while read -r u; do
  name=$(basename "$u")
  dl "$u" "wix-source/assets-images/$name"
  cp "wix-source/assets-images/$name" "public/images/$name" 2>/dev/null || true
done < wix-source/image-urls.txt
echo "Done. Raw HTML: wix-source/pages/  Images: wix-source/assets-images/ and public/images/"
