-- ryan_sdjr (la verdad se me hace una tonteria poner el nombre si de todas formas se lo van a robar pero todos lo hacen)
-- Variables para el efecto de lluvia de corazones (lluvia principal)
local heartScale = 0.15
local bgScale = 0.5
local hearts = {} -- Array para almacenar los corazones activos
local heartCount = 0 -- Contador para IDs únicos
local maxHearts = 75 -- Máximo número de corazones simultáneos
local spawnRate = 0.45 -- Tiempo entre spawns (segundos)
local fallSpeed = 65 -- Velocidad de caída (píxeles por segundo)
local fadeSpeed = 1.7 -- Velocidad de desvanecimiento
local rainActive = false

-- Variables para el efecto de lluvia de corazones HUD (segunda lluvia)
local heartScaleHUD = 1
local heartsHUD = {} -- Array para almacenar los corazones HUD activos
local heartCountHUD = 0 -- Contador para IDs únicos HUD
local maxHeartsHUD = 15 -- Máximo número de corazones HUD simultáneos
local spawnRateHUD = 3 -- Tiempo entre spawns HUD (segundos)
local fallSpeedHUD = 250 -- Velocidad de caída HUD (píxeles por segundo)
local fadeSpeedHUD = 0.2 -- Velocidad de desvanecimiento HUD
local rainActiveHUD = false

function onEvent(name, value1, value2)
    if name == 'RainHeartEvent' then
        if value1 == 'stop' then
            stopHeartRain()
            stopHeartRainHUD()
        else
            startHeartRain()
            startHeartRainHUD()
        end

        fallSpeedHUD = value2
        fallSpeed = value2 / 3.85

    end
end

function startHeartRain()
    -- Crear fondo del evento
    makeLuaSprite('bgEvent', 'RainHeartEvent/BGEvent', -1000, -750)
    addLuaSprite('bgEvent', false)
    setProperty('bgEvent.alpha', 0.65)
    setProperty('bgEvent.scale.x', bgScale)
    setProperty('bgEvent.scale.y', bgScale)
    setObjectCamera('bgEvent', 'hud')
    setBlendMode('bgEvent', 'add')

    -- Activar la lluvia
    rainActive = true
    
    -- Iniciar el timer para generar corazones
    runTimer('spawnHeart', spawnRate, 0)
    
    -- Timer para actualizar la lluvia
    runTimer('updateRain', 0.016, 0) -- ~60 FPS
end

function spawnHeart()
    if not rainActive or #hearts >= maxHearts then
        return
    end
    
    heartCount = heartCount + 1
    local heartTag = 'heart_' .. heartCount
    
    -- Posición X aleatoria en la pantalla
    local randomX = getRandomInt(-1280, screenWidth or 1280)
    local startY = -400 -- Comenzar por encima de la pantalla
    
    -- Crear el corazón
    makeLuaSprite(heartTag, 'RainHeartEvent/Heart', randomX, startY)
    addLuaSprite(heartTag, false)
    setProperty(heartTag .. '.scale.x', heartScale)
    setProperty(heartTag .. '.scale.y', heartScale)
    setProperty(heartTag .. '.alpha', 1.0)
    -- setObjectCamera(heartTag, 'hud')
    
    -- Agregar al array de corazones activos
    table.insert(hearts, {
        tag = heartTag,
        x = randomX,
        y = startY,
        alpha = 1.0
    })
end

function updateHearts()
    local screenHeight = getProperty('FlxG.height') or 720
    
    -- Actualizar cada corazón
    for i = #hearts, 1, -1 do
        local heart = hearts[i]
        
        -- Mover hacia abajo
        heart.y = heart.y + (fallSpeed * (1/60)) -- Asumiendo 60 FPS
        setProperty(heart.tag .. '.y', heart.y)
        
        -- Calcular desvanecimiento basado en la posición Y
        local fadeProgress = heart.y / (screenHeight + 200)
        heart.alpha = math.max(0, 1.0 - (fadeProgress * fadeSpeed))
        setProperty(heart.tag .. '.alpha', heart.alpha)
        
        -- Eliminar corazón si está fuera de pantalla o invisible
        if heart.y > screenHeight + 100 or heart.alpha <= 0 then
            removeLuaSprite(heart.tag, true)
            table.remove(hearts, i)
        end
    end
    
    -- Si la lluvia está inactiva y no quedan corazones, detener el timer
    if not rainActive and #hearts == 0 then
        cancelTimer('updateRain')
    end
end

function stopHeartRain()
    rainActive = false
    
    -- Cancelar solo el timer de generación de nuevos corazones
    cancelTimer('spawnHeart')
    
    -- Desvanecer el fondo inmediatamente
    doTweenAlpha('bgEventFadeOut', 'bgEvent', 0, 4.0, 'linear')
    
    -- Los corazones existentes continuarán su ciclo natural
    -- El timer updateRain sigue activo para permitir que los corazones completen su animación
end

-- Funciones para la lluvia de corazones HUD
function startHeartRainHUD()
    -- Activar la lluvia HUD
    rainActiveHUD = true
    
    -- Iniciar el timer para generar corazones HUD
    runTimer('spawnHeartHUD', spawnRateHUD, 0)
    
    -- Timer para actualizar la lluvia HUD
    runTimer('updateRainHUD', 0.016, 0) -- ~60 FPS
end

function spawnHeartHUD()
    if not rainActiveHUD or #heartsHUD >= maxHeartsHUD then
        return
    end
    
    heartCountHUD = heartCountHUD + 1
    local heartTag = 'heartHUD_' .. heartCountHUD
    
    -- Posición X aleatoria en la pantalla
    local randomX = getRandomInt(-380, screenWidth or 1280)
    local startY = -400 -- Comenzar por encima de la pantalla
    
    -- Crear el corazón en el HUD
    makeLuaSprite(heartTag, 'RainHeartEvent/HeartBlur', randomX, startY)
    addLuaSprite(heartTag, false)
    setProperty(heartTag .. '.scale.x', heartScaleHUD)
    setProperty(heartTag .. '.scale.y', heartScaleHUD)
    setProperty(heartTag .. '.alpha', 1.0)
    setObjectCamera(heartTag, 'hud') -- Corazones en la cámara HUD
    
    -- Agregar al array de corazones en el HUD activos
    table.insert(heartsHUD, {
        tag = heartTag,
        x = randomX,
        y = startY,
        alpha = 1.0
    })
end

function updateHeartsHUD()
    local screenHeight = getProperty('FlxG.height') or 720
    
    -- Actualizar cada corazón en el HUD
    for i = #heartsHUD, 1, -1 do
        local heart = heartsHUD[i]
        
        -- Mover hacia abajo
        heart.y = heart.y + (fallSpeedHUD * (1/60)) -- Asumiendo 60 FPS
        setProperty(heart.tag .. '.y', heart.y)
        
        -- Calcular desvanecimiento basado en la posición Y
        local fadeProgress = heart.y / (screenHeight + 200)
        heart.alpha = math.max(0, 1.0 - (fadeProgress * fadeSpeedHUD))
        setProperty(heart.tag .. '.alpha', heart.alpha)
        
        -- Eliminar corazón si está fuera de pantalla o invisible
        if heart.y > screenHeight + 100 or heart.alpha <= 0 then
            removeLuaSprite(heart.tag, true)
            table.remove(heartsHUD, i)
        end
    end
    
    -- Si la lluvia HUD está inactiva y no quedan corazones, detener el timer
    if not rainActiveHUD and #heartsHUD == 0 then
        cancelTimer('updateRainHUD')
    end
end

function stopHeartRainHUD()
    rainActiveHUD = false
    
    -- Cancelar solo el timer de generación de nuevos corazones HUD
    cancelTimer('spawnHeartHUD')
    
    -- Los corazones HUD existentes continuarán su ciclo natural
    -- El timer updateRainHUD sigue activo para permitir que los corazones completen su animación
end

function onTimerCompleted(tag)
    if tag == 'spawnHeart' then
        spawnHeart()
    elseif tag == 'updateRain' then
        updateHearts()
    elseif tag == 'spawnHeartHUD' then
        spawnHeartHUD()
    elseif tag == 'updateRainHUD' then
        updateHeartsHUD()
    end
end

function onTweenCompleted(tag)
    if tag == 'bgEventFadeOut' then
        removeLuaSprite('bgEvent', true)
    end
end
