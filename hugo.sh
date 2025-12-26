#!/usr/bin/env bash
set -euo pipefail

SCRIPT_NAME="$(basename "$0")"
DEFAULT_PUBLIC_DIR="public"

usage() {
  cat <<'EOF'

Hugo framework helper script

USAGE:
  hugo.sh dev    [--] [extra hugo server args...]
  hugo.sh prod   [--] [extra hugo build args...]
  hugo.sh clean  [public_dir]
  hugo.sh help

MODES:
  dev     Run Hugo development server with file watching & live reload.
  prod    Build production site output (ready to deploy).
  clean   Remove generated output and Hugo cache.
  help    Show this help text.

EXAMPLES:
  ./hugo.sh dev
  ./hugo.sh dev -- -D --port 1314
  ./hugo.sh prod
  ./hugo.sh prod -- --minify --gc
  ./hugo.sh clean
  ./hugo.sh clean public
  ./hugo.sh help

NOTES:
  - Use "--" to pass additional arguments directly to Hugo.
  - Run this script from the Hugo project root.
EOF
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Error: required command not found: $1" >&2
    exit 127
  }
}

MODE="${1:-help}"
shift || true

# Allow optional "--" separator
if [[ "${1:-}" == "--" ]]; then
  shift
fi

need_cmd hugo

case "$MODE" in
  dev)
    exec hugo server \
      --cleanDestinationDir \
      --watch \
      --forceSyncStatic \
      --buildExpired \
      --buildDrafts \
      --buildFuture \
      --disableFastRender \
      --navigateToChanged \
      --poll 700ms \
      -D
      "$@"
    ;;
  prod|build|production)
    exec hugo \
      --templateMetrics \
      --templateMetricsHints \
      --cleanDestinationDir \
      --minify \
      "$@"
    ;;
  clean)
    PUBLIC_DIR="${1:-$DEFAULT_PUBLIC_DIR}"

    if [[ "$PUBLIC_DIR" == "/" || -z "$PUBLIC_DIR" ]]; then
      echo "Refusing to clean unsafe directory: '$PUBLIC_DIR'" >&2
      exit 1
    fi

    echo "Cleaning Hugo output and cache..."
    rm -rf "$PUBLIC_DIR"
    rm -rf resources/_gen
    hugo --gc --cleanDestinationDir >/dev/null 2>&1 || true
    echo "Clean completed."
    ;;
  help|-h|--help)
    usage
    ;;
  *)
    echo "Error: unknown mode: $MODE" >&2
    echo >&2
    usage >&2
    exit 2
    ;;
esac

