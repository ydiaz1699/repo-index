# skill-portable — skill autocontenida para Kiro y Claude

Versión **portable y autocontenida** de la skill `repo-index`: lleva el índice DENTRO,
así funciona sin clonar ningún repo. Sirve para subir a **Kiro** (Settings → Skills →
"+ Add skill") y a **Claude** (Agent Skills). Formato compatible con ambos: una carpeta
con `SKILL.md` (frontmatter `name` + `description`) + archivos de apoyo, comprimida en `.zip`.

## Contenido

```
skill-portable/
└── repo-index/               ← esta carpeta es la que se comprime
    ├── SKILL.md              ← autocontenido: reglas + tabla-veredicto + índice
    └── references/
        └── repos-resumen.md  ← detalle destilado de los repos (sin depender del repo)
```

## Cómo empaquetar el .zip

Desde la carpeta `skill-portable/`:

```bash
cd skill-portable
zip -r repo-index-skill.zip repo-index
```

Esto genera `repo-index-skill.zip` con la carpeta `repo-index/` (con su `SKILL.md` en la raíz),
que es exactamente el formato que piden **Kiro** y **Claude**.

## Cómo subirla

- **Kiro:** Settings → Skills → **"+ Add skill"** → seleccionar `repo-index-skill.zip`.
- **Claude:** subir la skill (app de Claude / Claude Code) como Agent Skill (mismo .zip).

## Diferencia con la skill viva del repo

- `.kiro/skills/repo-index/` (raíz del repo-index) = skill **viva**: apunta a INDEX.md, trae
  el script `sync-index.sh` y el hook. Funciona en Kiro cuando el repo está cargado.
- `skill-portable/repo-index/` (esta) = **espejo autocontenido** para subir a Kiro/Claude sin
  el repo. **Es un espejo:** si el ecosistema cambia, regenerar `SKILL.md`/`repos-resumen.md`
  y volver a empaquetar + re-subir. No se sincroniza sola.

## Mantener sincronizado el espejo

Cuando cambie el índice vivo (INDEX.md), actualizar aquí la tabla-veredicto y `repos-resumen.md`,
regenerar el `.zip` y volver a subirlo a Kiro/Claude.
