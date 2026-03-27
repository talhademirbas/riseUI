#!/usr/bin/env bash
# Build the example app for web and copy into Next docs `public/` for iframe embeds.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT/example"
flutter pub get
dart run tool/generate_showcase_manifest.dart
flutter build web --release --base-href /flutter-previews/
rm -rf "$ROOT/apps/docs/public/flutter-previews"
mkdir -p "$ROOT/apps/docs/public"
cp -R "$ROOT/example/build/web" "$ROOT/apps/docs/public/flutter-previews"
echo "Flutter web preview copied to apps/docs/public/flutter-previews/"
