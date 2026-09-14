#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills"
TARGET_DIR="${CODEX_HOME:-$HOME/.codex}/skills"
SKILLS=(
  "assessing-ai-scenarios"
  "writing-ai-prds"
  "planning-ai-mvps"
  "designing-ai-metrics"
  "checking-ai-acceptance"
)

if [ ! -d "$SOURCE_DIR" ]; then
  echo "skills directory not found: $SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"
for skill in "${SKILLS[@]}"; do
  cp -R "$SOURCE_DIR/$skill" "$TARGET_DIR/"
done

echo "Installed AI product skills to $TARGET_DIR"
echo "Restart Codex or start a new session to use them."
