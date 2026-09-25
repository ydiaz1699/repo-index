# 9Drive_mcp

- **Repo:** https://github.com/ydiaz1699/9Drive_mcp
- **Tema:** Ecosistema de cloud storage self-hosted (Google Drive + S3) con control por LLM vía MCP.
- **Estado:** 🔧 en desarrollo.

## De qué trata

Unifica Google Drive y S3 bajo una interfaz, con control total por LLM mediante servidores MCP.
Cuatro componentes:

- `9drive-main/` — app web (backend Express + Prisma + GDrive/S3; frontend React+Vite; docker-compose).
- `9drive_MCP/` — MCP server independiente con DB propia (18 tools).
- `9drive-selfhosted/` — MCP complementario a 9drive-main, schema Prisma COMPARTIDO (42 tools, cobertura total).
- `9drive-telegram/` — bot Telegram autónomo (Strands + Gemini Flash + cliente MCP).

## Nota importante para el LLM

⚠️ **Es un MCP PROPIO ya avanzado.** Si el usuario habla de MCP de cloud storage, o de construir
un MCP, este es su referencia interna más completa (dos MCPs, uno con DB propia y otro con schema
compartido). Relacionado con el rclone-mcp montado en Kiro CLI, pero este es app+MCP propios.

## Ideas reutilizables (para construir MCPs)

- **Dos estrategias de datos en un MCP:** DB propia (independiente) vs schema Prisma compartido
  con la app principal. Decisión de diseño clave según si el MCP acompaña a una app o es autónomo.
- **MCP + bot conversacional:** el mismo MCP consumido por un bot Telegram (Strands+Gemini) —
  patrón "MCP para el LLM + cliente propio para automatizar".
- Cobertura escalonada de tools (18 vs 42) según alcance.

## Rutas clave

- `9drive-selfhosted/src/tools/` — las 42 tools MCP.
- `9drive-telegram/src/agent.ts` — Strands Agent + Gemini + cliente MCP.
