#!/usr/bin/env bash
# Vercel: Flutter SDK is not preinstalled — clone stable SDK once, then full docs build (Flutter web + Next).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

ensure_flutter_in_path() {
  if command -v flutter >/dev/null 2>&1; then
    return 0
  fi
  local FLUTTER_ROOT="${FLUTTER_ROOT:-$HOME/flutter_riseui_docs}"
  if [[ ! -x "$FLUTTER_ROOT/bin/flutter" ]]; then
    echo "[vercel-build-docs] Installing Flutter stable to $FLUTTER_ROOT ..."
    rm -rf "$FLUTTER_ROOT"
    git clone https://github.com/flutter/flutter.git -b stable --depth 1 "$FLUTTER_ROOT"
  fi
  export PATH="$PATH:$FLUTTER_ROOT/bin"
  flutter config --no-analytics
}

ensure_flutter_in_path
npm run build:docs
