# MCPs y buenas prácticas (puntero)

Esta referencia NO duplica el catálogo: **apunta** a la fuente de verdad.

## Fuente de verdad

```text
mcp-catalog/INDICE.md    ← en la raíz de este repo (repo-index)
```

Contiene: MCPs montados en Kiro CLI (n8n-mcp, rclone-mcp, nextdns-mcp), MCPs propios
(9Drive_mcp, Tasker_mcp), y las buenas prácticas destiladas para construir MCPs.

## Detalle completo (en otros repos — leer solo para un matiz)

- Montaje de MCPs en Kiro CLI: `Varios_tools/kiro-cli-nas/` (n8n-mcp.md, nextdns-multicuenta.md).
- MCP rclone control total: `Varios_tools/rclone-mcp-control-total/README.md`.
- Guías para construir MCPs propios: `Varios_tools/construir-mcp/`
  (`PROYECTO-guia-construir-mcp.md` = anatomía/2 capas; `PLAN-mcp-indexador-nodos.md` = indexador).
- Recursos externos (Prowler, Context7, Gentleman.Dots): `Varios_tools/tool_catalog/`.

## Regla de oro

Al recomendar/construir un MCP, primero mirar `mcp-catalog/INDICE.md` (qué ya existe y qué
práctica robar), y solo abrir las fuentes de arriba si se necesita el detalle de implementación.
