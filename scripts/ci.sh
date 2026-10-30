#!/usr/bin/env bash
# ==============================================================================
# APolo — Suite de Verificación Determinista e Integración Continua Local
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

echo "🧪 [1/3] Validando sintaxis de scripts Bash..."
bash -n "$REPO_DIR/scripts/install.sh"
echo "  ✔ [PASS] scripts/install.sh sintaxis correcta."

echo "🧪 [2/3] Probando instalación en limpio hermética (Clean-Room)..."
TMP_HOME=$(mktemp -d)
HOME="$TMP_HOME" bash "$REPO_DIR/scripts/install.sh" >/dev/null
if [ -f "$TMP_HOME/.gemini/config/skills/apolo/SKILL.md" ] && [ -f "$TMP_HOME/.gemini/config/skills/apolo/assets/apollo.jpg" ]; then
  echo "  ✔ [PASS] Instalación aislada verificada con éxito."
else
  echo "  ❌ [FAIL] Error en la instalación aislada."
  rm -rf "$TMP_HOME"
  exit 1
fi
rm -rf "$TMP_HOME"

echo "🧪 [3/3] Validando metadatos y frontmatter de SKILL.md..."
grep -q "^name: apolo" "$REPO_DIR/SKILL.md"
grep -q "^description:" "$REPO_DIR/SKILL.md"
echo "  ✔ [PASS] Frontmatter de la skill verificado."

echo ""
echo "✅ Todas las pruebas de CI pasaron al 100% (Código de salida 0)."
