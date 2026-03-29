#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for react-navigation/react-navigation.github.io
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.

echo "Node version: $(node --version)"

# --- Package manager: bundled Yarn 4.0.2 ---
YARN_BIN=".yarn/releases/yarn-4.0.2.cjs"

if [ ! -f "$YARN_BIN" ]; then
    echo "ERROR: Yarn binary not found at $YARN_BIN"
    exit 1
fi

echo "Installing dependencies with bundled Yarn 4.0.2..."
node "$YARN_BIN" install

# --- Build ---
echo "Building Docusaurus site..."
node "$YARN_BIN" build

echo "[DONE] Build complete."
