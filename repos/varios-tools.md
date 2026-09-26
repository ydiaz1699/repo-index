# Varios_tools

- **Repo:** https://github.com/ydiaz1699/Varios_tools
- **Tema:** Cajón de proyectos/herramientas + catálogos + guías (cada proyecto en su subcarpeta).
- **Estado:** 🟢 activo.

## De qué trata

Repo paraguas donde cada herramienta/proyecto vive en su propia subcarpeta (regla: nada suelto
en la raíz salvo `.kiro/steering/` y README). Contiene los catálogos y guías del ecosistema.

## Subcarpetas clave

- `tool_catalog/` — catálogo de RECURSOS EXTERNOS (repos, videos, dotfiles) con fichas ligeras
  (frontmatter + "cuándo SÍ/NO aplica") para decidir si vale la pena leer la fuente. `index.md`
  + `catalog.json` + `entries/<slug>.md`.
- `artefactos_proyecto/` — catálogo de ARCHIVOS-ARTEFACTO estándar de un proyecto
  (UPSTREAM.md, CONTRIBUTING.md, .env.example, CHANGELOG.md, ADR/ideas-decisions.md,
  SECURITY.md): ficha "cuándo SÍ/NO aplica" + plantilla lista en `templates/`. Para no
  OLVIDAR qué archivo añadir al crear/ordenar/mirror un proyecto. Trae skill de auto-invoke.
- `construir-mcp/` — guías para construir MCPs propios: `PROYECTO-guia-construir-mcp.md`
  (anatomía general, patrón 2 capas) + `PLAN-mcp-indexador-nodos.md` (MCP indexador tipo n8n-mcp).
- `kiro-cli-nas/` — cómo montar Kiro CLI en el NAS + MCPs (rclone, nextdns, n8n) verificados.
- `rclone-mcp-control-total/` — MCP rclone con permisos V3.
- `tools_AI/` — artefactos propios (skills reutilizables: skill-creator, unificador-skill).

## Ideas reutilizables

- **Filosofía referencia vs destilado:** una ficha con solo el link no basta; extraer el
  conocimiento a un archivo local para no re-leer la fuente.
- **Patrón de integración de MCP a Kiro:** `mcp_tools/*.json` + `mcp-build` + `permissions.yaml` V3 + wrapper.

## Fuente de verdad

Los catálogos detallados viven aquí; `repo-index` solo apunta, no los copia.
