# AGENTS.md — repo-index

Reglas para cualquier agente/LLM que trabaje con el ecosistema de **ydiaz1699**.
Este repo es el **índice maestro**: consúltalo ANTES de actuar.

## Reglas obligatorias

1. **ANTES de crear un repo nuevo**, consulta `INDEX.md`. Si ya existe uno con ese
   nombre o propósito, **avísalo y ofrece continuarlo** en vez de crear un duplicado.
   > Ej.: "¿Creamos un repo Tasker?" → "Ya tienes `ydiaz1699/Tasker_mcp`; ¿lo continuamos?"

2. **ANTES de recomendar una herramienta/MCP/patrón**, revisa `INDEX.md` y
   `mcp-catalog/INDICE.md`. Si ya hay algo del ecosistema que aplica, recomiéndalo.
   > Ej.: instalar n8n → "tienes `alexa_y_n8n` (Alexa↔n8n↔Node-RED↔HA) y el MCP n8n-mcp montado".

3. **ANTES de leer un repo entero** para saber de qué trata, lee su destilado en
   `repos/<repo>.md`. Clona/lee la fuente completa **solo** si necesitas un matiz no cubierto.

4. **Enlazar, no duplicar:** el detalle vive en su repo fuente (Varios_tools, nas-dotfiles,
   etc.). Aquí solo el destilado + puntero. No copies documentación completa aquí.

5. **Verifica contra la fuente real** (repo, `gh api`, doc oficial), nunca de memoria.
   Al añadir/actualizar un destilado, léelo del repo, no lo inventes.

6. **Al terminar un trabajo relevante en el ecosistema** (nuevo repo, nuevo MCP, nuevo
   patrón aprendido), actualiza `INDEX.md` y el destilado correspondiente, y avisa al usuario
   para commitear.

## Cómo enrutar una petición

| El usuario pide... | Primero consulta... | Luego |
|---|---|---|
| Crear un repo/proyecto | `INDEX.md` (¿ya existe?) | Si existe → continuar; si no → crear + añadir al índice |
| "¿de qué trata el repo X?" | `repos/X.md` | Responder desde el destilado; leer la fuente solo si falta un matiz |
| Instalar/usar una herramienta | `INDEX.md` + `mcp-catalog/INDICE.md` | Recomendar lo del ecosistema que aplique |
| Construir un MCP | `mcp-catalog/INDICE.md` | Aplicar los patrones/buenas prácticas ya destilados |
| Mejorar skills/contexto de agentes | `mcp-catalog/INDICE.md` (Prowler, Context_Engineering) | Recomendar el patrón catalogado |
| Crear/ordenar un repo, hacer un mirror/fork, abrir a colaboradores | `Varios_tools/artefactos_proyecto/` (catálogo de archivos-artefacto: UPSTREAM.md, CONTRIBUTING.md, .env.example, CHANGELOG.md, ADR, SECURITY.md) | Añadir los artefactos que apliquen usando sus plantillas |

## Repos ancla del ecosistema (fuentes de verdad, NO duplicar aquí)

- **nas-dotfiles** — framework del NAS (Docker, CLI svc, agente, skills). Tiene su propio AGENTS.md.
- **Varios_tools** — cajón de proyectos + `tool_catalog/` (recursos externos) + `construir-mcp/` (guías MCP).
- **repo-index** (este) — índice maestro que apunta a todo lo anterior.
