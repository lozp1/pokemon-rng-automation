-- === CONFIGURACIÓN DE FRANCOTIRADOR ===
local targetFrame = 58521    
local delayCorrection = 11
-- ======================================

local finalTarget = targetFrame - delayCorrection
local state = 0 

console:log("--- BOT RNG: MISIÓN 16 MINUTOS ---")
console:log("Objetivo: " .. targetFrame)
console:log("Corrección: -" .. delayCorrection)
console:log(">>> DISPARO EN: " .. finalTarget)

emu:reset()
local startFrame = emu:currentFrame()

local function onFrame()
    if state == 2 then return end

    local current = emu:currentFrame()
    local passed = current - startFrame

    -- Actualización de estado cada 10 segundos (para no llenar la consola)
    if passed % 600 == 0 and passed < finalTarget then
        local secondsLeft = (finalTarget - passed) / 60
        local minutesLeft = secondsLeft / 60
        console:log(string.format("Frames: %d | Faltan: %.1f min (%.0fs)", passed, minutesLeft, secondsLeft))
    end

    -- DISPARO
    if passed == finalTarget then
        console:log(">>> ¡DESPERTANDO! DISPARANDO AHORA (Frame " .. passed .. ") <<<")
        emu:setKeys(1) -- Presiona A
        state = 1
    
    -- FIN
    elseif passed == finalTarget + 1 and state == 1 then
        emu:setKeys(0) -- Suelta A
        console:log("--- MISIÓN CUMPLIDA ---")
        state = 2
        callbacks:remove("frame", onFrame)
    end
end

callbacks:add("frame", onFrame)
