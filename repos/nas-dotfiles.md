# nas-dotfiles

- **Repo:** https://github.com/ydiaz1699/nas-dotfiles
- **Tema:** Framework de administración del NAS (Dell PowerEdge T20, Debian 13 + Docker).
- **Estado:** 🟢 activo, el proyecto ancla del homelab.

## De qué trata

Tres capas: (1) shell personalizado (aliases `dk`/`adm`/`nasfk`, funciones `nas`), (2) CLI
Docker `svc` (up/down/health/doctor/backup/boot-order…), (3) agente IA Python (Strands).
Tiene catálogo de servicios, skills, arranque escalonado por capas y pipeline de auto-docs.

## Ideas reutilizables

- **Separación código vs datos:** código en `$NAS_DOTFILES` (git), datos/secretos en `$dkco` (no git).
- **Arquitectura de 3 capas de docs "enlazar-no-duplicar":** guía `docs/services/<svc>-guide.md` +
  ficha `agent/catalog/services/<svc>/ficha.md` + tabla operativa en la skill.
- **Skills con auto-invoke manual** (tabla en AGENTS.md que ordena cargar la skill antes de actuar).
- **Arranque escalonado** por capas (`layers.conf`) con `.no-boot` para servicios bajo demanda.

## Rutas clave (para un matiz, no re-leer todo)

- `AGENTS.md` — reglas del framework y tabla de servicios/redes.
- `docs/framework-audit.md` — mapa de TODOS los componentes.
- `agent/catalog/services/kiro-cli/ficha.md` — Kiro CLI + MCPs (rclone, nextdns, n8n).
- `docs/services/<svc>-guide.md` — guía por servicio.

## Fuente de verdad

Este repo tiene su propio `AGENTS.md` y skills; NO duplicar aquí su documentación.
