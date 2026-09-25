# MCP Catalog — MCPs conocidos y buenas prácticas

Catálogo de MCPs que ya evalué/monté + patrones reutilizables para construir los míos.
**Enlazar, no duplicar:** el detalle vive en su fuente (Varios_tools/kiro-cli-nas, construir-mcp,
o el repo propio). Aquí: qué es, para qué sirve, y qué práctica robar.

## MCPs montados en Kiro CLI (NAS) — verificados en runtime

| MCP | Para qué | Tipo | Fuente detallada |
|-----|----------|------|------------------|
| **n8n-mcp** (czlonkowski) | que el LLM CREE/gestione workflows de n8n (~525 nodos + API REST) | indexador + API | `Varios_tools/kiro-cli-nas/n8n-mcp.md` |
| **rclone-mcp** (angenge) | control total de rclone (cloud storage) por LLM, 101 tools | API (RC API) | `Varios_tools/rclone-mcp-control-total/README.md` |
| **nextdns-mcp** (dmeiser) | control NextDNS multi-cuenta por lenguaje natural | API | `Varios_tools/kiro-cli-nas/nextdns-multicuenta.md` |

## MCPs propios (repos ydiaz1699)

| MCP | Para qué | Estado | Destilado |
|-----|----------|--------|-----------|
| **9Drive_mcp** | cloud storage self-hosted (GDrive+S3) por LLM | 🔧 avanzado | `../repos/9drive-mcp.md` |
| **Tasker_mcp** | automatización Android (Tasker) por LLM | 🌱 incipiente | `../repos/tasker-mcp.md` |

## Buenas prácticas destiladas (para construir MIS MCPs)

Verificadas leyendo código real de los MCPs analizados. Detalle completo en
`Varios_tools/construir-mcp/`.

### Arquitectura
- **Patrón de 2 capas** (de nextdns-mcp): lógica pura `_impl` (hace la acción, SIN MCP) +
  envoltorio `mcp_server.tool()`. → portabilidad: la misma lógica sirve como MCP y como import directo.
- **Dos estrategias de datos** (de 9Drive_mcp): DB propia (MCP autónomo) vs schema compartido
  con la app (MCP que acompaña a una app).
- **Tres orígenes de las tools de un MCP:** (1) API oficial del servicio → lo ideal (n8n, rclone);
  (2) archivos/código local indexado → cuando no hay API (indexador tipo n8n-mcp/Mushroom);
  (3) automatización de navegador → ÚLTIMO recurso (frágil, rompe con cada rediseño, riesgo de ToS).

### MCP indexador (que el LLM conozca nodos/cards y no invente)
- Patrón: FUENTE → LOADER → PARSER → **SQLite + FTS5** → tools `search`/`get`. Ver
  `Varios_tools/construir-mcp/PLAN-mcp-indexador-nodos.md`.
- Empezar por algo pequeño (Mushroom, 19 cards) antes de escalar a Node-RED/Flowise/n8n.
- El índice debe capturar **inputs + campos requeridos + relaciones** de cada nodo (no solo el nombre)
  — así el LLM no deja campos vacíos ni elige el nodo equivocado (lección del caso Flowise/Human Message).
- Actualización: repos estáticos → re-index con `git pull` (manual o cron); plataformas con API
  (n8n/HA) → consultar la instancia EN VIVO (no queda obsoleto).

### Gotchas de integración a Kiro CLI (verificados)
- `MCP_MODE=stdio` + `DISABLE_CONSOLE_OUTPUT=true` obligatorios (o los logs rompen el canal JSON-RPC).
- Kiro CLI V3 usa `permissions.yaml` (allow/ask/deny), NO el `autoApprove` del mcp.json.
- Secretos en `.env` (chmod 600) inyectados por el wrapper con `--env-file`; nunca hardcodear en el JSON.
- `mcp_tools/*.json` + `mcp-build` para ensamblar `mcp.json` (Kiro no soporta include).
- Verificar el nombre EXACTO de variables/tools contra el código real (ej. SSRF de n8n-mcp es
  `WEBHOOK_SECURITY_MODE`, NO `ALLOW_PRIVATE_IPS` que no existe).

## Recursos externos catalogados (buenas prácticas de contexto/skills)

| Recurso | Para qué | Fuente |
|---------|----------|--------|
| **Prowler** (agent-router / Agent Skills) | patrón AGENTS.md + skills + auto-invoke para frameworks grandes | `Varios_tools/tool_catalog/entries/gentleman-programming/prowler-agent-skills.md` + destilado `tools_AI/skills/skill-creator/references/prowler-case-study.md` |
| **Context7** | docs de librerías al día para LLMs (patrón indexador remoto) | `Varios_tools/construir-mcp/PLAN-mcp-indexador-nodos.md` (sección ejemplos) |
| **Gentleman.Dots** | entorno dev + capa IA (AGENTS.md + skills + subagentes) | `Varios_tools/tool_catalog/entries/gentleman-programming/gentleman-dots.md` |

> Al mejorar skills/contexto de un framework propio (ej. nas-dotfiles), recomendar el patrón
> **agent-router de Prowler** (ya catalogado) en vez de preguntar a ciegas.
