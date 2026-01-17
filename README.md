# mGBA RNG Sniper for Pokémon Emerald

Un script de automatización en Lua diseñado para el emulador **mGBA**. Este script facilita la manipulación de RNG (Random Number Generator) en Pokémon Esmeralda (Gen 3) automatizando el "Soft Reset" y la entrada de inputs en el frame exacto.

## 🚀 Características

- **Precisión de Frame:** Realiza el input (A pulse) en el momento matemático exacto.
- **Soft Reset Automático:** Reinicia el juego automáticamente al ejecutar el script.
- **Feedback en Consola:** Muestra el progreso, tiempo restante y confirmación de disparo en la consola de scripting de mGBA.
- **Ajuste de Lag:** Variable `delayCorrection` configurable para compensar la latencia del hardware/emulador.

## 📋 Requisitos

- [mGBA Emulator](https://mgba.io/) (Versión con soporte de scripting).
- Una ROM de Pokémon Esmeralda (o Rubí/Zafiro).
- [PokéFinder](https://github.com/Admiral-Fish/PokeFinder) (Para calcular tu `targetFrame`).

## ⚙️ Configuración

Abre el archivo `rng_bot.lua` y edita las primeras líneas con tus datos obtenidos en PokéFinder:

```lua
-- === CONFIGURACIÓN ===
local targetFrame = 58521    -- TU FRAME OBJETIVO (Cámbialo por el tuyo)
local delayCorrection = 11   -- TU CALIBRACIÓN (Varía según PC/Método)
-- =====================
