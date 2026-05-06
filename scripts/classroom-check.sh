#!/usr/bin/env bash
set -u

HTML="index.html"
CSS="css/style.css"

fail() {
  echo "$1" >&2
  exit 1
}

ok() {
  echo CORRECTO
}

run_python() {
  if command -v python3 >/dev/null 2>&1; then
    python3 "$@"
  elif command -v python >/dev/null 2>&1; then
    python "$@"
  else
    fail "Se necesita Python (python3 o python) para esta verificación."
  fi
}

case "${1:-}" in
  base-structure)
    [[ -f "$HTML" ]] || fail "No se encontró index.html en la raíz."
    [[ -d "css" ]] || fail "No se encontró la carpeta css/."
    [[ -d "img" ]] || fail "No se encontró la carpeta img/."
    ok
    ;;

  css-linked)
    [[ -f "$HTML" ]] || fail "No existe index.html."
    [[ -f "$CSS" ]] || fail "No existe css/style.css."
    grep -Eqi '<link[^>]+href=["'"'"'][^"'"'"']*css/style\.css[^"'"'"']*["'"'"']' "$HTML" \
      || fail "Falta enlazar css/style.css desde index.html."
    ok
    ;;

  grid-display)
    [[ -f "$CSS" ]] || fail "No existe css/style.css."
    grep -Eqi 'display[[:space:]]*:[[:space:]]*(inline-)?grid' "$CSS" \
      || fail "No se detectó uso de display:grid en css/style.css."
    ok
    ;;

  grid-template)
    [[ -f "$CSS" ]] || fail "No existe css/style.css."
    grep -Eqi 'grid-template-columns[[:space:]]*:' "$CSS" \
      || fail "No se detectó grid-template-columns en css/style.css."
    ok
    ;;

  mobile-first)
    [[ -f "$CSS" ]] || fail "No existe css/style.css."
    grep -Eqi '@media[^{]*\([[:space:]]*min-width[[:space:]]*:' "$CSS" \
      || fail "No se detectó una media query con min-width (enfoque Mobile First)."
    ok
    ;;

  desktop-grid)
    [[ -f "$CSS" ]] || fail "No existe css/style.css."
    run_python - "$CSS" <<'PY' || fail "No se detectó una regla de Grid para desktop dentro de @media (min-width: ...)."
import re
import sys

css_path = sys.argv[1]
text = open(css_path, encoding="utf-8", errors="replace").read()
text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)

# Busca al menos un bloque @media con min-width que incluya grid-template-columns.
pattern = re.compile(
    r"@media[^{]*\(\s*min-width\s*:[^)]+\)\s*\{[\s\S]*?grid-template-columns\s*:",
    flags=re.I,
)

if not pattern.search(text):
    sys.exit(1)

print("CORRECTO")
PY
    ;;

  all)
    for sub in base-structure css-linked grid-display grid-template mobile-first desktop-grid; do
      bash "$0" "$sub" || exit 1
    done
    ok
    ;;

  *)
    echo "Prueba no reconocida. Revisá scripts/classroom-check.sh." >&2
    exit 2
    ;;
esac
