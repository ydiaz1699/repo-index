# Context_Engineering_V2

- **Repo:** https://github.com/ydiaz1699/Context_Engineering_V2
- **Tema:** Framework "AI-OS" para hacer proyectos "legibles por IA" desde el día uno.
- **Estado:** 🔧 en desarrollo.

## De qué trata

Metodología + generador donde cada proyecto incluye una carpeta `.ai/` con documentación
estructurada que cualquier asistente IA puede leer para entender el sistema completo (evita
repetir contexto o que la IA adivine). Incluye: generador interactivo, templates (Arduino, ESP32,
Python, Web, Mobile, ESPHome), ejemplos y un "Synapse Prompt" (prompt de sistema universal).

## Nota importante para el LLM

⚠️ **Filosóficamente es HERMANO de `repo-index` y del tool_catalog.** Misma idea: dar contexto
estructurado a la IA para no re-explicar. Si el usuario quiere "hacer un proyecto legible por IA"
o "generar estructura AI-ready", este repo YA lo hace — recomendarlo.

## Ideas reutilizables

- **Carpeta `.ai/` por proyecto** con contexto estructurado (patrón para cualquier repo nuevo).
- **Templates por tipo de proyecto** (embebido/web/mobile) — reutilizable al scaffoldear.
- **Synapse Prompt** — prompt de sistema para razonamiento estructurado (revisar antes de escribir
  uno nuevo desde cero).

## Rutas clave

- `generator.py` — generador interactivo.
- templates y ejemplos en el repo.
