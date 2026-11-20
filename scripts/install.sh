#!/usr/bin/env bash
# ==============================================================================
# APolo — Instalador Automatizado e Idempotente Universal
# Compatible con: Google Antigravity, Claude Code, OpenCode CLI, etc.
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
TARGET_DIR="${HOME}/.gemini/config/skills/apolo"

echo "🏛️ Instalando la skill APolo (Universal)..."

# 1. Antigravity 2.0 (Target principal)
mkdir -p "$TARGET_DIR"
cp -u "$REPO_DIR/SKILL.md" "$TARGET_DIR/SKILL.md"

if [ -f "$REPO_DIR/assets/apollo.jpg" ]; then
  mkdir -p "$TARGET_DIR/assets"
  cp -u "$REPO_DIR/assets/apollo.jpg" "$TARGET_DIR/assets/apollo.jpg"
fi
echo "✔ APolo instalado en Google Antigravity: $TARGET_DIR"

# 2. Claude Code (Si el directorio ~/.claude existe)
if [ -d "${HOME}/.claude" ]; then
  CLAUDE_TARGET="${HOME}/.claude/skills/apolo"
  mkdir -p "$CLAUDE_TARGET"
  cp -u "$REPO_DIR/SKILL.md" "$CLAUDE_TARGET/SKILL.md"
  echo "✔ APolo vinculado a Claude Code: $CLAUDE_TARGET"
fi

# 3. OpenCode CLI (Si el directorio ~/.config/opencode existe)
if [ -d "${HOME}/.config/opencode" ]; then
  OPENCODE_TARGET="${HOME}/.config/opencode/skills/apolo"
  mkdir -p "$OPENCODE_TARGET"
  cp -u "$REPO_DIR/SKILL.md" "$OPENCODE_TARGET/SKILL.md"
  echo "✔ APolo vinculado a OpenCode CLI: $OPENCODE_TARGET"
fi

echo ""
echo "🎉 Instalación finalizada. APolo está disponible de forma universal."
