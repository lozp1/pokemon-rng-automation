-- === CONFIGURACIÓN MAESTRA ===
local targetFrame = 172614   -- Electrike Shiny/Perfecto (Timid / 31 SpA / 31 Spe)
local delayCorrection = 522  -- ¡TU NUEVO LAG! (261 + 261)
-- =============================

local finalTarget = targetFrame - delayCorrection
local state = 0

console:log("--- INTENTO FINAL ELECTRIKE ---")
console:log("Objetivo: " .. targetFrame)
console:log("Lag Doble: " .. delayCorrection)
console:log(">>> PREPARA DULCE AROMA <<<")

emu:reset()
local startFrame = emu:currentFrame()

local function onFrame()
    if state == 2 then return end

    local current = emu:currentFrame()
    local passed = current - startFrame

    if passed % 1000 == 0 and passed < finalTarget then
        local secondsLeft = (finalTarget - passed) / 60
        console:log(string.format("Frames: %d | Faltan: %.1fs", passed, secondsLeft))
    end

    -- DISPARO
    if passed == finalTarget then
        console:log(">>> ¡DULCE AROMA AHORA! <<<")
        emu:setKeys(1) -- Pulsa A
        state = 1
    elseif passed == finalTarget + 1 and state == 1 then
        emu:setKeys(0) -- Suelta A
        state = 2
        callbacks:remove("frame", onFrame)
    end
end

callbacks:add("frame", onFrame)