# android_agent_bridge

- **Repo:** https://github.com/ydiaz1699/android_agent_bridge
- **Tema:** Puente agent-first para controlar Android por ADB, sin acoplar el núcleo a una app.
- **Estado:** 🔧 base implementada.

## De qué trata

Permite que un LLM controle dispositivos Android (teléfonos, emuladores, Android TV, Fire TV)
por **ADB**, con un protocolo agent-first de frames compactos (`read` + `do`). El LLM no recibe
XML crudo ni coordenadas: recibe frames JSON; las coordenadas se calculan por acción.

Cuatro ideas: protocolo agent-first · transporte ADB único · percepción UI (parseo de
`uiautomator dump`, árbol de nodos, selectores, padre clickeable) · **knowledge packs** (conocimiento
por app cargado bajo demanda; MGAndroid es el primer pack).

## Ideas reutilizables

- **Knowledge packs bajo demanda:** en vez de meter la lógica de cada app en el núcleo, se carga
  un pack JSON con selectores/estados/acciones de esa app. (Patrón parecido a las skills.)
- **Frames JSON compactos con paginación** en vez de pasar XML crudo al LLM → ahorra contexto.
- **Automatización de UI robusta:** herencia de bounds desde ancestros clickeables (para no fallar
  al resolver el elemento pulsable). Útil como referencia si algún día se hace browser/UI automation.

## Relación con el ecosistema

Complementa `Tasker_mcp` (Tasker = automatización dentro del teléfono; este = control externo por ADB).

## Rutas clave

- README (arquitectura y estado actual). Leer el repo para las firmas del protocolo `read`/`do`.
