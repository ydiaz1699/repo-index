# wifi_dpsk

- **Repo:** https://github.com/ydiaz1699/wifi_dpsk
- **Tema:** Alarma IoT ESP8266 — IoTProtocol V4.3 (UDP binario) + central MQTT/HTTP + satélites ESPHome con failover.
- **Estado:** 🔧 en desarrollo (push activo).

## De qué trata

Alarma doméstica IoT sobre ESP8266. Es la línea **V4.3 madura** del protocolo binario propio
(la que en `wifi_PIR` aparecía como "V4.3 en desarrollo"): aquí vive ya estructurada en
librería + central + satélites. Tres piezas:

1. **`lib/IoTProtocol/`** — protocolo binario universal V4.1/4.3: paquete MAGIC+VER+TYPE+SRC+DST+
   BOOT_ID+SEQ+FLAGS+payload TLV+CRC16; dedup por `(src, boot, seq)`; HMAC opcional; storage.
   `lib/AlarmProfile/AlarmProfile.h` = vocabulario de alarma (EventCode, DeviceType, StateTag);
   es el **contrato wire** (no renumerar sin versionar).
2. **`central/`** (C++/PlatformIO, NodeMCU, IP 192.168.0.201) — recibe UDP, deduplica, mantiene
   la allowlist `debeActivarBocina()` (TIMBRE/SMOKE/FLOOD/BUTTON suenan siempre; MOTION/DOOR solo
   armado), publica a MQTT con cola por prioridades, y expone **`POST /event`** HTTP como canal
   de respaldo (solo con `auth` DISABLED; en REQUIRED se cierra con 403, porque HTTP no firma HMAC).
3. **`esphome_satellites/`** — nodos satélite en ESPHome con patrón `packages:` + `common/`
   (`base.yaml`, `mqtt_failover.yaml`, `alarm_codes.yaml`). Máquina de estados
   NORMAL(MQTT) → GRACE → EMERGENCY(HTTP `/event`): el satélite publica por MQTT y solo cae a
   HTTP si el broker muere. Nodos: `ventana_cocina.yaml` (reed), `pir_entrada.yaml` (PIR+timbre).

## Relación con wifi_PIR

`wifi_PIR` es el origen (UDP texto V3.5 + binario V4.3 incipiente). **`wifi_dpsk` es donde esa
línea V4.3 vive ya organizada** (librería IoTProtocol + central + satélites ESPHome). Si el
usuario trabaja alarma/PIR hoy, `wifi_dpsk` es el repo activo; `wifi_PIR` queda como antecedente.

## Nota importante para el LLM

⚠️ **Al tocar un satélite ESPHome o el central, verificar SIEMPRE contra el código** (no de
memoria): códigos en `AlarmProfile.h`, contrato `/event` en `central/src/http_endpoint.cpp`
(rechaza 400 si `src/boot/seq/code == 0`), IP/puerto en `central/src/config.cpp`, rangos de
`device_id` en `IoTProtocol.h` (0x02–0x1F entrada, 0x40–0x5F telemetría…). Un satélite nuevo
se escribe reutilizando `common/` (como `pir_entrada.yaml`), nunca inline.

## Ideas reutilizables

- Protocolo binario IoT con BOOT_ID + SEQ de 32 bits → dedup robusta tras reinicios.
- Un mismo evento viaja por MQTT (normal) o HTTP `/event` (respaldo) sin duplicar lógica de bocina:
  el central decide, el satélite solo reporta.
- Frontera de seguridad explícita: HTTP sin HMAC solo se habilita si auth está desactivado.
- Patrón ESPHome `packages:` + `common/` para no repetir plataforma entre nodos.

## Rutas clave

- `lib/IoTProtocol/IoTProtocol.h` — contrato wire + rangos de device_id.
- `lib/AlarmProfile/AlarmProfile.h` — EventCode / DeviceType (fuente de verdad de los códigos).
- `central/src/http_endpoint.cpp` — contrato `POST /event`.
- `central/src/event_handler.cpp` — `debeActivarBocina()` (cuándo suena).
- `central/src/config.cpp` — IP/puerto/pines/timings.
- `esphome_satellites/common/` — plataforma compartida de los satélites.
