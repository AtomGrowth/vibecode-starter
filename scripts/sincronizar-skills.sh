#!/usr/bin/env bash
# Copia las skills de .claude/skills (la fuente) a .cursor/skills, y CLAUDE.md a .cursorrules.
# HACK: las skills viven duplicadas a proposito. Cursor lee .cursor/skills y Claude Code lee
# .claude/skills; con copias no hay nada que instalar ni symlinks que se rompan en Windows o en un
# zip. Si algun dia las dos herramientas leen la misma carpeta, se borra este script.
# Corre desde cualquier sitio: ./scripts/sincronizar-skills.sh
set -euo pipefail

RAIZ="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ORIGEN="$RAIZ/.claude/skills"
DESTINO="$RAIZ/.cursor/skills"

[ -d "$ORIGEN" ] || { echo "no existe $ORIGEN"; exit 1; }

mkdir -p "$DESTINO"
rsync -a --delete "$ORIGEN/" "$DESTINO/"
cp "$RAIZ/CLAUDE.md" "$RAIZ/.cursorrules"

echo "skills: $(ls "$ORIGEN" | tr '\n' ' ')"
echo "copiadas a .cursor/skills y CLAUDE.md a .cursorrules"
