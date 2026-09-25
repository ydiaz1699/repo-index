# Mantenimiento del índice

Procedimiento para mantener `repo-index` al día. Pensado para que un LLM (o el usuario)
lo ejecute cuando la skill está activa. El índice NO se auto-actualiza; esto lo asiste.

## Cuándo actualizar

- Al **crear un repo nuevo** en `ydiaz1699/`.
- Al **analizar/trabajar** un repo que aún no tiene destilado.
- Al **montar un MCP nuevo** o aprender un patrón reutilizable.
- Cuando el hook o el script reporten huecos.

## Paso 1 — Detectar huecos (herramienta)

```bash
bash .kiro/skills/repo-index/scripts/sync-index.sh
```

Reporta: repos reales que FALTAN en `INDEX.md`, y nombres en el índice que ya no son repos reales.
No modifica nada. Requiere `gh` autenticado.

## Paso 2 — Para cada repo que falte

1. **Leer la fuente real** (no de memoria):
   ```bash
   gh api repos/ydiaz1699/<repo>/readme --jq '.content' | base64 -d | head -60
   ```
   (o clonar si hace falta más detalle).
2. **Crear el destilado** `repos/<repo>.md` con:
   - Repo (link), Tema (1 frase), Estado (🟢/🔧/🌱/📦).
   - "De qué trata" (2-4 frases).
   - "Ideas reutilizables" (qué robar de él).
   - "Nota importante para el LLM" si aplica (ej. "ya existe, no duplicar").
   - "Rutas clave" (para un matiz sin re-leer todo).
3. **Añadir la fila** a la categoría correcta en `INDEX.md`, con link al destilado.
4. Si es un MCP o aporta buenas prácticas → añadir/actualizar `mcp-catalog/INDICE.md`.

## Paso 3 — Commitear

Avisar al usuario y commitear (mensaje `docs(index): catalogar <repo>` o `chore(index): sync`).
Recordar: **enlazar, no duplicar** — el destilado resume y apunta a la fuente, no la copia.

## Reglas

- Verificar SIEMPRE contra la fuente real (gh api / repo), nunca inventar de qué trata un repo.
- Estados: 🟢 activo/producción · 🔧 en desarrollo · 🌱 incipiente/local · 📦 archivo/referencia.
- Un repo incipiente (README casi vacío) probablemente tiene trabajo local sin subir → anotarlo.
- No mover aquí documentación que ya vive en otro repo; solo destilar + apuntar.
