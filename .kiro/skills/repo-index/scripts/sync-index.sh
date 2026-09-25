#!/usr/bin/env bash
# sync-index.sh — detecta repos reales de ydiaz1699 que faltan (o sobran) en INDEX.md.
# NO modifica nada: solo lista y compara, para que el LLM/usuario decida qué catalogar.
# Requiere: gh (autenticado) y el repo-index como CWD o via --dir.
set -euo pipefail

USER="ydiaz1699"
# Localizar la raíz del repo-index (donde está INDEX.md), subiendo desde este script.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
INDEX="$REPO_ROOT/INDEX.md"

if [[ ! -f "$INDEX" ]]; then
  echo "ERROR: no se encontró INDEX.md en $REPO_ROOT" >&2
  exit 1
fi
if ! command -v gh >/dev/null 2>&1; then
  echo "ERROR: 'gh' no está disponible o no está en PATH." >&2
  exit 1
fi

echo "== sync-index: comparando repos reales de $USER con INDEX.md =="
echo

# Repos reales (nombre), ordenados.
gh api "users/$USER/repos?per_page=100&sort=full_name" --jq '.[].name' 2>/dev/null | sort -u > /tmp/repos_reales.txt

# Repos ya indexados: se extraen de los links markdown a github.com/ydiaz1699/<repo> en INDEX.md.
grep -oiE "github\.com/${USER}/[a-zA-Z0-9._-]+" "$INDEX" \
  | sed -E "s#.*/${USER}/##I" | sed 's/[).]*$//' | sort -u > /tmp/repos_indexados.txt

echo "Repos reales:      $(wc -l < /tmp/repos_reales.txt)"
echo "Repos en INDEX.md: $(wc -l < /tmp/repos_indexados.txt)"
echo

FALTAN="$(comm -23 /tmp/repos_reales.txt /tmp/repos_indexados.txt || true)"
SOBRAN="$(comm -13 /tmp/repos_reales.txt /tmp/repos_indexados.txt || true)"

if [[ -n "$FALTAN" ]]; then
  echo "### ⚠️ Repos REALES que FALTAN en INDEX.md (catalogar):"
  echo "$FALTAN" | sed 's/^/  - /'
else
  echo "### ✅ No faltan repos: el índice cubre todos los repos reales."
fi
echo

if [[ -n "$SOBRAN" ]]; then
  echo "### ℹ️ Nombres en INDEX.md que NO son repos reales (revisar/renombrar/eliminado):"
  echo "$SOBRAN" | sed 's/^/  - /'
fi
echo
echo "Siguiente paso: para cada repo que falte, crear repos/<repo>.md (destilado leído del"
echo "README real, no de memoria) y añadir su fila a INDEX.md. Ver references/mantenimiento.md."
