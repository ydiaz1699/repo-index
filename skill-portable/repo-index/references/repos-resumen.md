# Repos de ydiaz1699 — resumen destilado (autocontenido)

Detalle de cada repo para responder "de qué trata" sin clonar. Inventario 2026-09-25 (27 repos).
Estados: 🟢 activo · 🔧 desarrollo · 🌱 incipiente/local · 📦 archivo/referencia.

## Framework / NAS
- **nas-dotfiles** 🟢 — Framework del NAS (Dell T20, Debian+Docker). 3 capas: shell (aliases dk/adm),
  CLI `svc`, agente IA Python. Catálogo de servicios, skills, arranque escalonado. Repo ancla del homelab.
- **Varios_tools** 🟢 — Cajón de proyectos (cada uno en su subcarpeta) + `tool_catalog/` (recursos
  externos) + `construir-mcp/` (guías MCP) + `kiro-cli-nas/` (Kiro CLI + MCPs) + `tools_AI/`.
- **repo-index** 🟢 — Este índice maestro del ecosistema.
- **DebMenux-** 🔧 — Menú/instalador Debian, complementa nas-dotfiles.

## MCPs propios
- **9Drive_mcp** 🔧 — Cloud storage self-hosted (Google Drive + S3) con control LLM vía MCP. 4 partes:
  9drive-main (app web), 9drive_MCP (18 tools, DB propia), 9drive-selfhosted (42 tools, schema
  compartido), 9drive-telegram (bot Strands+Gemini). Referencia interna más completa de MCP propio.
- **Tasker_mcp** 🌱 — MCP para Tasker (automatización Android). README solo con título → probablemente
  hay trabajo local sin subir. ⚠️ YA EXISTE: no crear duplicado.

## Android / control de dispositivos
- **android_agent_bridge** 🔧 — Controlar Android por ADB con protocolo agent-first (frames read/do +
  knowledge packs por app). El LLM recibe frames JSON, no XML crudo. Complementa Tasker_mcp.
- **Flujo_android** 🌱 · **pyt-androidtv** 🌱 (Android TV) · **tvbox-controller** 🌱 (TV Box).

## IoT / domótica
- **alexa_y_n8n** 🔧 — Alexa ↔ n8n ↔ Node-RED ↔ Home Assistant bidireccional (Custom Skill + AWS
  Lambda; alertas proactivas vía VoiceMonkey). Relevante al usar n8n.
- **wifi_PIR** 🟢 — Alarma/sensores IoT ESP8266 por WiFi/UDP (puerto 4210) + MQTT a HA. V3.5.1
  producción (texto), V4.3 desarrollo (binario, CRC16/HMAC). ⚠️ Si piden "alarma con PIR", partir de aquí.
- **ESPHome_ESP-NOW** 📦 — Plantillas base ESPHome + ESP-NOW (biblioteca reutilizable, no proyectos).
- **control_DIY** 🌱 · **code_RF_procc** 🌱 (procesamiento RF).

## Keyless PKE (llave sin contacto)
- **pke-keyless-esp32** 🔧 (firmware ESP32) · **pke-keyless-android** 🔧 (app Dart/Flutter) ·
  **pke-keyless-pcb** 🔧 (hardware/PCB). Trío del mismo sistema.

## Contexto para IA / dev
- **Context_Engineering_V2** 🔧 — Framework "AI-OS": genera proyectos "legibles por IA" (carpeta .ai/),
  templates por tipo, Synapse Prompt. Hermano filosófico de repo-index.
- **vsCode-AI** 🌱 (tooling IA para VS Code) · **analisis_de_codigo** 🌱.

## USB / almacenamiento / media
- **USB-AutoMount-Linux** 🟢 — Montaje/desmontaje automático USB en Linux vía udev.
- **Automontaje-de-Dispositivos-USB-en-Linux** 🌱 (variante).
- **jellyBox_ydiaz1699** 🌱 (media/Jellyfin) · **iptv-channels** 📦 (canales IPTV, fork 2021).

## Otros
- **proyec_jdw2** 🌱 (Python) · **proyecto_cole** 🌱 (escolar, C++).

## MCPs montados en Kiro CLI (no son repos propios)
- **n8n-mcp** (czlonkowski): crea/gestiona workflows de n8n. **rclone-mcp** (angenge): 101 tools,
  cloud storage. **nextdns-mcp** (dmeiser): NextDNS multi-cuenta. Docs en Varios_tools/kiro-cli-nas/.
