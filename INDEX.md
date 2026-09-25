# INDEX — Ecosistema ydiaz1699

Tabla maestra de todos los repos. **Consultar ANTES de crear un repo nuevo o recomendar una
herramienta.** Inventario real vía `gh api` (2026-09-25, 26 repos). La columna **Destilado**
enlaza a `repos/<repo>.md` cuando existe (leer eso antes que clonar el repo).

> Leyenda estado: 🟢 activo/producción · 🔧 en desarrollo · 🌱 incipiente/local · 📦 archivo/referencia

## 🏗️ Framework e infraestructura del NAS

| Repo | Tema | Estado | Destilado |
|------|------|--------|-----------|
| [nas-dotfiles](https://github.com/ydiaz1699/nas-dotfiles) | Framework NAS: Docker + CLI `svc` + agente IA + skills | 🟢 | [repos/nas-dotfiles.md](repos/nas-dotfiles.md) |
| [Varios_tools](https://github.com/ydiaz1699/Varios_tools) | Cajón de proyectos + tool_catalog + construir-mcp + kiro-cli-nas | 🟢 | [repos/varios-tools.md](repos/varios-tools.md) |
| [repo-index](https://github.com/ydiaz1699/repo-index) | Índice maestro del ecosistema (este repo) | 🟢 | — |
| [DebMenux-](https://github.com/ydiaz1699/DebMenux-) | Menú/instalador Debian (complementa nas-dotfiles) | 🔧 | — |

## 🔌 MCPs (Model Context Protocol)

| Repo | Tema | Estado | Destilado |
|------|------|--------|-----------|
| [9Drive_mcp](https://github.com/ydiaz1699/9Drive_mcp) | Cloud storage self-hosted (GDrive+S3) con control LLM vía MCP (18/42 tools) + bot Telegram | 🔧 | [repos/9drive-mcp.md](repos/9drive-mcp.md) |
| [Tasker_mcp](https://github.com/ydiaz1699/Tasker_mcp) | MCP para Tasker (automatización Android) | 🌱 | [repos/tasker-mcp.md](repos/tasker-mcp.md) |

> Nota: los MCPs montados en Kiro CLI (rclone, nextdns, n8n) NO son repos propios; se
> documentan en `Varios_tools/kiro-cli-nas/` y en `mcp-catalog/INDICE.md`.

## 📱 Android / control de dispositivos

| Repo | Tema | Estado | Destilado |
|------|------|--------|-----------|
| [android_agent_bridge](https://github.com/ydiaz1699/android_agent_bridge) | Puente agent-first para controlar Android por ADB (frames read/do + knowledge packs) | 🔧 | [repos/android-agent-bridge.md](repos/android-agent-bridge.md) |
| [Flujo_android](https://github.com/ydiaz1699/Flujo_android) | Flujo Android (Python) | 🌱 | — |
| [pyt-androidtv](https://github.com/ydiaz1699/pyt-androidtv) | Control Android TV (Python) | 🌱 | — |
| [tvbox-controller](https://github.com/ydiaz1699/tvbox-controller) | Control de TV Box (Python) | 🌱 | — |

## 🏠 Automatización / IoT / domótica

| Repo | Tema | Estado | Destilado |
|------|------|--------|-----------|
| [alexa_y_n8n](https://github.com/ydiaz1699/alexa_y_n8n) | Alexa ↔ n8n ↔ Node-RED ↔ Home Assistant bidireccional (Custom Skill + AWS Lambda) | 🔧 | [repos/alexa-y-n8n.md](repos/alexa-y-n8n.md) |
| [wifi_PIR](https://github.com/ydiaz1699/wifi_PIR) | Alarma/sensores IoT ESP8266 por WiFi/UDP (PIR), receptor central + MQTT a HA | 🟢 | [repos/wifi-pir.md](repos/wifi-pir.md) |
| [ESPHome_ESP-NOW](https://github.com/ydiaz1699/ESPHome_ESP-NOW) | Plantillas base ESPHome + ESP-NOW (biblioteca reutilizable) | 📦 | — |
| [control_DIY](https://github.com/ydiaz1699/control_DIY) | Control DIY (C++/embebido) | 🌱 | — |
| [code_RF_procc](https://github.com/ydiaz1699/code_RF_procc) | Procesamiento RF (C++) | 🌱 | — |

## 🚗 PKE / keyless (llave sin contacto, multi-plataforma)

| Repo | Tema | Estado | Destilado |
|------|------|--------|-----------|
| [pke-keyless-esp32](https://github.com/ydiaz1699/pke-keyless-esp32) | Firmware ESP32 del sistema keyless | 🔧 | — |
| [pke-keyless-android](https://github.com/ydiaz1699/pke-keyless-android) | App Android (Dart/Flutter) del keyless | 🔧 | — |
| [pke-keyless-pcb](https://github.com/ydiaz1699/pke-keyless-pcb) | PCB/hardware del keyless (Python tooling) | 🔧 | — |

## 🤖 Contexto para IA / herramientas de desarrollo

| Repo | Tema | Estado | Destilado |
|------|------|--------|-----------|
| [Context_Engineering_V2](https://github.com/ydiaz1699/Context_Engineering_V2) | Framework "AI-OS": genera proyectos AI-ready (carpeta .ai/), templates + Synapse Prompt | 🔧 | [repos/context-engineering-v2.md](repos/context-engineering-v2.md) |
| [vsCode-AI](https://github.com/ydiaz1699/vsCode-AI) | Config/tooling de IA para VS Code (Python) | 🌱 | — |
| [analisis_de_codigo](https://github.com/ydiaz1699/analisis_de_codigo) | Análisis de código | 🌱 | — |

## 💾 USB / almacenamiento / media

| Repo | Tema | Estado | Destilado |
|------|------|--------|-----------|
| [USB-AutoMount-Linux](https://github.com/ydiaz1699/USB-AutoMount-Linux) | Montaje/desmontaje automático USB en Linux vía udev | 🟢 | — |
| [Automontaje-de-Dispositivos-USB-en-Linux](https://github.com/ydiaz1699/Automontaje-de-Dispositivos-USB-en-Linux) | Automontaje USB (variante/relacionado) | 🌱 | — |
| [jellyBox_ydiaz1699](https://github.com/ydiaz1699/jellyBox_ydiaz1699) | Media (Jellyfin box, Python) | 🌱 | — |
| [iptv-channels](https://github.com/ydiaz1699/iptv-channels) | Colección de canales IPTV libres (fork/referencia, 2021) | 📦 | — |

## 📚 Otros / varios

| Repo | Tema | Estado | Destilado |
|------|------|--------|-----------|
| [proyec_jdw2](https://github.com/ydiaz1699/proyec_jdw2) | Proyecto (Python) | 🌱 | — |
| [proyecto_cole](https://github.com/ydiaz1699/proyecto_cole) | Proyecto escolar (C++) | 🌱 | — |

---

## Conexiones útiles (para recomendaciones proactivas)

- **n8n / automatización** → `alexa_y_n8n` (Alexa↔n8n↔Node-RED↔HA) + MCP n8n-mcp (en `mcp-catalog/`).
- **Alarma / PIR / sensores** → `wifi_PIR` (ESP8266 UDP + MQTT a HA).
- **Android / Tasker / ADB** → `Tasker_mcp` + `android_agent_bridge` + `Flujo_android`.
- **Cloud storage / MCP** → `9Drive_mcp` (patrón multi-MCP con Prisma) + rclone-mcp (Kiro CLI).
- **Contexto/skills para IA** → `Context_Engineering_V2` + patrón Prowler (en `mcp-catalog/`).
- **Keyless PKE** → trío `pke-keyless-{esp32,android,pcb}` (firmware + app + hardware).
