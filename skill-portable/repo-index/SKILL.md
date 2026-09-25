---
name: repo-index
description: >
  Índice maestro AUTOCONTENIDO del ecosistema de repositorios de ydiaz1699 (GitHub).
  Memoria externa portátil para que cualquier asistente sin contexto previo (Kiro Web,
  Kiro CLI, Claude) sepa qué repos, herramientas y MCPs ya existen. Activar SIEMPRE al
  inicio de una tarea y ANTES de: (1) crear un repo o proyecto nuevo — comprobar si ya
  existe; (2) recomendar una herramienta, MCP o patrón — recomendar lo del ecosistema;
  (3) explicar de qué trata un repo de ydiaz1699. Cubre n8n, alarma/PIR, Android/Tasker,
  cloud storage MCP, keyless PKE, contexto/skills para IA. No cubre la operación interna
  del NAS (eso son las skills del repo nas-dotfiles).
license: MIT
metadata:
  author: ydiaz1699
  version: "1.0"
  scope: [ecosystem, index]
  auto_invoke:
    - "Crear un repo o proyecto nuevo (verificar si ya existe)"
    - "Recomendar una herramienta, MCP o patrón (buscar en el ecosistema primero)"
    - "Explicar de qué trata un repo de ydiaz1699"
    - "Instalar/usar n8n, alarma PIR, Android/Tasker, cloud storage, mejorar skills de IA"
---

# Skill `repo-index` (autocontenida)

**Memoria externa del ecosistema `ydiaz1699/`.** Esta skill es AUTOCONTENIDA: lleva el índice
dentro, así funciona sin clonar ningún repo (sirve en Claude, Kiro Web o CLI). La fuente de
verdad viva está en el repo `github.com/ydiaz1699/repo-index`; esta es su versión portable.

## Reglas (aplicar al activar la skill)

1. **Antes de crear un repo/proyecto:** revisa la tabla de abajo. Si ya existe uno con ese
   nombre o propósito → avísalo y ofrece continuarlo, NO crees un duplicado.
2. **Antes de recomendar herramienta/MCP/patrón:** revisa la tabla y recomienda lo del ecosistema.
3. **Antes de dar por hecho "de qué trata" un repo:** usa el resumen de abajo; si necesitas más
   detalle, indica al usuario el repo exacto en `github.com/ydiaz1699/<repo>`.
4. Verifica contra la fuente real (el repo) si vas a modificar algo; no inventes.

## Tabla-veredicto (recomendaciones proactivas)

| Si el usuario menciona / pide... | Recomienda del ecosistema |
|---|---|
| Instalar/usar **n8n**, workflows | MCP **n8n-mcp** (crea workflows, ya montado en Kiro CLI) + repo **alexa_y_n8n** |
| **Alarma / PIR / sensores** IoT | repo **wifi_PIR** (ESP8266 UDP + MQTT a HA) — NO empezar de cero |
| **Android / Tasker / ADB** | **Tasker_mcp** (ya existe) + **android_agent_bridge** |
| **Cloud storage** por LLM / MCP | **9Drive_mcp** (propio, avanzado) + rclone-mcp (Kiro CLI) |
| **Construir un MCP** | ver buenas prácticas abajo + repo **Varios_tools/construir-mcp** |
| Mejorar **skills / contexto de agentes** | patrón **agent-router / Agent Skills de Prowler** (catalogado en Varios_tools) |
| Proyecto **"legible por IA"** / scaffolding | **Context_Engineering_V2** |
| **Keyless / PKE** | trío **pke-keyless-{esp32,android,pcb}** |
| **Montaje USB** en Linux | **USB-AutoMount-Linux** (udev) |

> Ej.: "crea un repo Tasker MCP" → "ya tienes `ydiaz1699/Tasker_mcp`; ¿lo continuamos?"
> Ej.: "instala n8n" → instala + "te recomiendo el n8n-mcp para crear workflows".

## Índice de repos (resumen destilado — ver `references/repos-resumen.md` para el detalle)

**Framework/NAS:** `nas-dotfiles` (framework del NAS, ancla), `Varios_tools` (cajón +
tool_catalog + construir-mcp + kiro-cli-nas), `repo-index` (este índice), `DebMenux-`.
**MCPs propios:** `9Drive_mcp` (cloud storage GDrive+S3, avanzado), `Tasker_mcp` (incipiente).
**Android:** `android_agent_bridge` (ADB agent-first), `Flujo_android`, `pyt-androidtv`, `tvbox-controller`.
**IoT/domótica:** `alexa_y_n8n` (Alexa↔n8n↔Node-RED↔HA), `wifi_PIR` (alarma PIR), `ESPHome_ESP-NOW`,
`control_DIY`, `code_RF_procc`.
**Keyless PKE:** `pke-keyless-esp32`, `pke-keyless-android`, `pke-keyless-pcb`.
**Contexto IA:** `Context_Engineering_V2` (AI-OS), `vsCode-AI`, `analisis_de_codigo`.
**USB/media:** `USB-AutoMount-Linux`, `Automontaje-de-Dispositivos-USB-en-Linux`, `jellyBox_ydiaz1699`, `iptv-channels`.
**Otros:** `proyec_jdw2`, `proyecto_cole`.

## Buenas prácticas para construir MCPs (destiladas)

- **3 orígenes de las tools de un MCP:** (1) API oficial del servicio → ideal (n8n, rclone);
  (2) archivos/código indexado → cuando no hay API (indexador tipo n8n-mcp con SQLite+FTS5);
  (3) automatización de navegador → último recurso (frágil, riesgo de ToS).
- **Patrón 2 capas:** lógica pura `_impl` + envoltorio MCP → portabilidad.
- **Integración a Kiro CLI:** `MCP_MODE=stdio` + `DISABLE_CONSOLE_OUTPUT=true` obligatorios;
  V3 usa `permissions.yaml` (no autoApprove); secretos en `.env` + wrapper `--env-file`.
- Verificar nombres de variables/tools contra el código real, no de memoria.

## Nota sobre esta skill portable

Es un **espejo**: si el ecosistema cambia (repos nuevos), regenerar el `.zip` desde
`github.com/ydiaz1699/repo-index` y volver a subirlo. La versión viva (con script de
sincronización y hook) está en ese repo.
