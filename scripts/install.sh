#!/usr/bin/env bash
# ==============================================================================
# APolo — Instalador Automatizado e Idempotente para Google Antigravity 2.0
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
TARGET_DIR="${HOME}/.gemini/config/skills/apolo"

echo "🏛️ Instalando la skill APolo en Google Antigravity 2.0..."

mkdir -p "$TARGET_DIR"
cp -u "$REPO_DIR/SKILL.md" "$TARGET_DIR/SKILL.md"

if [ -f "$REPO_DIR/assets/apollo.jpg" ]; then
  mkdir -p "$TARGET_DIR/assets"
  cp -u "$REPO_DIR/assets/apollo.jpg" "$TARGET_DIR/assets/apollo.jpg"
fi

echo "✔ APolo instalado correctamente en: $TARGET_DIR"
echo "  Disponible en Antigravity mediante la invocación: 'apolo', 'modo apolo' o 'invoca a apolo'."
