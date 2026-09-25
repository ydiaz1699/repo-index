---
name: repo-index
description: >
  Índice maestro del ecosistema de repos de ydiaz1699 (memoria externa portátil).
  Activar SIEMPRE al INICIO de una tarea y ANTES de: (1) crear un repo o proyecto
  nuevo — comprobar si ya existe uno con ese nombre/propósito; (2) recomendar una
  herramienta, MCP o patrón — recomendar lo del ecosistema que aplique; (3) explicar
  "de qué trata" un repo del usuario — leer su destilado en vez de clonar. Cubre n8n,
  alarma/PIR, Android/Tasker, cloud storage MCP, skills/contexto de agentes, keyless PKE.
  Qué NO cubre: la operación interna del NAS (usar las skills de nas-dotfiles).
license: MIT
metadata:
  author: ydiaz1699
  version: "1.0"
  scope: [ecosystem, index]
  auto_invoke:
    - "Crear un repo o proyecto nuevo (verificar si ya existe en INDEX.md)"
    - "Recomendar una herramienta, MCP o patrón (buscar en el ecosistema primero)"
    - "Explicar de qué trata un repo del usuario (leer destilado, no clonar)"
    - "Instalar/usar n8n, alarma PIR, Android/Tasker, cloud storage, mejorar skills"
---

# Skill `repo-index`

**Memoria externa del ecosistema `ydiaz1699/`.** Un chat nuevo arranca de cero y no sabe qué
repos existen. Esta skill hace que Kiro (u otro LLM) lo sepa **sin re-leer repos enteros**.

## Fuente de verdad (leer en este orden)

```text
INDEX.md                 ← tabla maestra de TODOS los repos (nombre, tema, estado, destilado)
repos/<repo>.md          ← destilado de un repo concreto (de qué trata + ideas + rutas)
mcp-catalog/INDICE.md    ← MCPs conocidos + buenas prácticas para construir MCPs propios
AGENTS.md                ← reglas de enrutado del ecosistema
```

> Enlazar, no duplicar: esta skill NO copia el índice; apunta a los archivos de arriba
> (en la raíz de este repo `repo-index`). El detalle de cada recurso vive en su repo fuente
> (Varios_tools/tool_catalog, Varios_tools/construir-mcp, nas-dotfiles).

## Reglas de activación (qué hacer al cargar la skill)

1. **Antes de crear un repo/proyecto:** consultar `INDEX.md`. Si ya existe uno con ese
   nombre o propósito → avisar y ofrecer continuarlo, NO crear duplicado.
2. **Antes de recomendar herramienta/MCP/patrón:** consultar `INDEX.md` + `mcp-catalog/INDICE.md`
   y recomendar lo del ecosistema que aplique.
3. **Antes de leer un repo entero:** leer su `repos/<repo>.md`. Clonar la fuente solo para un matiz.
4. **Al terminar trabajo relevante** (repo nuevo, MCP nuevo, patrón aprendido): actualizar
   `INDEX.md` + el destilado, y avisar al usuario para commitear. Ver `references/mantenimiento.md`.

## Tabla-veredicto (recomendaciones proactivas)

| Si el usuario menciona / pide... | Recomienda del ecosistema | Ref |
|---|---|---|
| Instalar/usar **n8n**, workflows | MCP **n8n-mcp** (crea workflows) + repo **alexa_y_n8n** | mcp-catalog + repos/alexa-y-n8n.md |
| **Alarma / PIR / sensores** IoT | repo **wifi_PIR** (ESP8266 UDP + MQTT a HA) — NO empezar de cero | repos/wifi-pir.md |
| **Android / Tasker / ADB** | **Tasker_mcp** (ya existe) + **android_agent_bridge** | repos/tasker-mcp.md, repos/android-agent-bridge.md |
| **Cloud storage** por LLM / MCP | **9Drive_mcp** (propio) + rclone-mcp (Kiro CLI) | repos/9drive-mcp.md, mcp-catalog |
| **Construir un MCP** | patrones destilados + PLAN indexador | mcp-catalog/INDICE.md |
| Mejorar **skills / contexto de agentes** | patrón **agent-router de Prowler** (catalogado) | mcp-catalog/INDICE.md |
| Proyecto **"legible por IA"** / scaffolding | **Context_Engineering_V2** | repos/context-engineering-v2.md |
| **Keyless / PKE** | trío **pke-keyless-{esp32,android,pcb}** | INDEX.md |
| **Montaje USB** en Linux | **USB-AutoMount-Linux** (udev) | INDEX.md |

> Ej.: "crea un repo Tasker MCP" → "ya tienes `ydiaz1699/Tasker_mcp`; ¿lo continuamos?"
> Ej.: "ayúdame a instalar n8n" → instala + "te recomiendo montar el n8n-mcp para crear workflows".

## Auto-mantenimiento

El índice NO se actualiza solo. Para detectar repos nuevos sin catalogar, ejecutar:

```bash
bash .kiro/skills/repo-index/scripts/sync-index.sh
```

Procedimiento completo (qué hacer con los huecos que reporte) en
[`references/mantenimiento.md`](references/mantenimiento.md).
El hook `.kiro/hooks/repo-index-sync-on-start.json` recuerda esto al iniciar sesión.
