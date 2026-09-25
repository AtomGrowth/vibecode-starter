#!/usr/bin/env bash
# Copia las skills de .claude/skills (la fuente) a .cursor/skills, y CLAUDE.md a .cursorrules.
# Despues comprueba que toda skill, plantilla o guia citada exista, para que un nombre mal escrito no
# llegue a la IA como una instruccion rota.
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

fallos=0
falla() { echo "FALLA: $*"; fallos=$((fallos + 1)); }

citas() {
  find "$ORIGEN" "$RAIZ/CLAUDE.md" "$RAIZ/README.md" "$RAIZ/plantillas" "$RAIZ/guia" -name '*.md' -print0 \
    | xargs -0 grep -ohE "$1" | sort -u
}

for ruta in $(citas '(plantillas|guia)/[a-z0-9-]+\.md'); do
  [ -f "$RAIZ/$ruta" ] || falla "se cita $ruta y no existe"
done

# "nombre" es el marcador de ejemplo de /crear-skill, no una skill real.
for s in $(citas '`/[a-z][a-z-]+`' | tr -d '`/' | grep -vx 'nombre'); do
  [ -f "$ORIGEN/$s/SKILL.md" ] || falla "se cita /$s y no existe la skill"
done

for f in "$ORIGEN"/*/SKILL.md; do
  nombre=$(basename "$(dirname "$f")")
  grep -q "^name: $nombre$" "$f" || falla "$nombre: el name del encabezado no coincide con la carpeta"
  grep -q '^description: ' "$f" || falla "$nombre: falta description en el encabezado"
done

[ "$fallos" -eq 0 ] || { echo "$fallos problema(s): corrige la fuente en .claude/ y vuelve a correr"; exit 1; }
echo "comprobado: skills, plantillas y guias citadas existen"
