# repo-index

> **Índice maestro del ecosistema `ydiaz1699/`** — la "memoria externa" portátil de todos
> mis repos, herramientas, MCPs y buenas prácticas, para que **cualquier LLM sin contexto
> previo** (Kiro Web nuevo, Kiro CLI tras reinstalar el NAS, Claude, modelo local) sepa lo
> que ya tengo **sin re-leer cada repo entero**.

## El problema que resuelve

Un chat nuevo arranca **de cero**: no sabe qué repos tengo, de qué tratan, ni qué
herramientas ya evalué. Sin este índice, cada vez habría que:
- re-clonar y re-leer repos completos para saber de qué tratan (gasto de tokens/tiempo),
- arriesgarse a **crear un repo que ya existe** (ej. pedir "crea Tasker_mcp" cuando ya está),
- perder recomendaciones proactivas ("estás instalando n8n → tienes `alexa_y_n8n`").

`repo-index` es la puerta de entrada: un LLM lo lee y **ya sabe** lo que yo sé.

## Cómo lo usa un LLM (arranque en frío)

1. Leer **`AGENTS.md`** → las reglas (consultar el índice ANTES de crear repos o recomendar).
2. Leer **`INDEX.md`** → tabla maestra de TODOS mis repos (nombre, tema, estado, link).
3. Si un repo es relevante, abrir **`repos/<repo>.md`** → destilado (de qué trata + ideas
   reutilizables + rutas clave) **sin clonar el repo entero**.
4. Para MCPs y buenas prácticas de construcción, ver **`mcp-catalog/INDICE.md`**.

## Filosofía (heredada de Varios_tools/tool_catalog)

- **Enlazar, no duplicar:** este repo **apunta** al contenido detallado que ya vive en otros
  repos (`Varios_tools/tool_catalog`, `Varios_tools/construir-mcp`, `nas-dotfiles`), no lo copia.
  El destilado aquí es lo mínimo para "saber que existe y de qué trata"; el detalle vive en su fuente.
- **Referencia vs conocimiento destilado:** cada ficha da (a) dónde está la fuente y (b) qué
  aprender de ella, para no re-leer la fuente salvo que haga falta un matiz.
- **Verificar contra la fuente real:** los destilados se hacen leyendo el repo (README/código),
  no de memoria.

## Estructura

```
repo-index/
├── README.md                 ← este archivo
├── AGENTS.md                 ← reglas para el LLM (consultar índice antes de actuar)
├── INDEX.md                  ← 🔑 tabla maestra de TODOS los repos ydiaz1699
├── repos/                    ← un .md por repo con destilado (de qué trata + ideas)
│   └── <repo>.md
└── mcp-catalog/
    └── INDICE.md             ← MCPs conocidos + buenas prácticas reutilizables
```

## Mantenimiento

El índice **NO se actualiza solo**. Al crear/analizar un repo nuevo: añadir su fila en
`INDEX.md` y (si es relevante) su destilado en `repos/`. Para detectar huecos, listar los
repos reales y comparar con el índice:

```bash
gh api "users/ydiaz1699/repos?per_page=100" --jq '.[].name' | sort > /tmp/reales.txt
grep -oE '\| \[[a-zA-Z0-9_-]+\]' INDEX.md | tr -d '| []' | sort > /tmp/indexados.txt
comm -23 /tmp/reales.txt /tmp/indexados.txt   # repos reales que faltan en el índice
```

_Última actualización del inventario: 2026-09-25 (26 repos)._
