#!/usr/bin/env bash
# Refresh docs “web” assets so the browser shows the latest work.
#
# Default (fast — use while `npm run dev:docs` is running):
#   • Regenerates showcase-manifest.json
#   • Rebuilds Flutter web and copies to apps/docs/public/flutter-previews/
#   Then hard-refresh the browser (embeds are cached aggressively).
#
# Full (after MDX/TS changes or before deploy):
#   ./scripts/refresh-docs-web.sh --full
#   → same as `npm run build:docs` (includes `next build`).
#
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if [[ "${1:-}" == "--full" || "${1:-}" == "--all" ]]; then
  echo "Running full docs build (showcase + Flutter web + Next.js)…"
  npm run build:docs
  echo "Done. Start or restart: npm run dev:docs  (or serve the built output)."
  exit 0
fi

echo "Refreshing showcase manifest + Flutter previews (Next dev keeps running)…"
bash scripts/build-flutter-docs-preview.sh

echo ""
echo "✓ Latest assets are in apps/docs/public/flutter-previews/"
echo "  Hard-refresh the docs tab (Cmd+Shift+R / Ctrl+Shift+R) so the iframe picks up the new main.dart.js."
echo "  For MDX/TS-only edits, Next dev usually hot-reloads; embeds always need this script + refresh."
echo ""
echo "  Full static rebuild:  ./scripts/refresh-docs-web.sh --full   (or: npm run build:docs)"
