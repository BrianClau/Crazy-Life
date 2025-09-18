local customCountdownActive = false
local countdownImages = {'ready', 'set', 'go'}
local currentCountdownSprite = nil

-- Función para verificar si camGame está invisible
local function isCamGameInvisible()
    return getProperty('camGame.alpha') < 1
end

-- Función para crear un sprite de contador personalizado
local function createCustomCountdownSprite(imageName, counter)
    -- Remover sprite anterior si existe
    if currentCountdownSprite then
        removeLuaSprite(currentCountdownSprite, true)
        currentCountdownSprite = nil
    end
    
    local spriteName = 'customCountdown_' .. counter
    
    -- Crear el sprite personalizado
    makeLuaSprite(spriteName, imageName, 0, 0)
    setObjectCamera(spriteName, 'other')
    screenCenter(spriteName)
    addLuaSprite(spriteName, true)
    
    -- Configurar propiedades del sprite
    setProperty(spriteName .. '.antialiasing', not getPropertyFromClass('PlayState', 'isPixelStage'))
    
    -- Si es pixel stage, ajustar el tamaño
    if getPropertyFromClass('PlayState', 'isPixelStage') then
        setGraphicSize(spriteName, getProperty(spriteName .. '.width') * 6)
        updateHitbox(spriteName)
    end
    
    -- Animación de desvanecimiento
    doTweenAlpha(spriteName .. '_fade', spriteName, 0, crochet / 1000, 'cubeInOut')
    
    currentCountdownSprite = spriteName
end



-- Callback: Se ejecuta en cada tick del contador
function onCountdownTick(counter)
    -- Solo activar contador personalizado si camGame está invisible
    if isCamGameInvisible() then
        customCountdownActive = true
        
        -- Crear sprite correspondiente (retrasado en un tick)
        -- counter 1 -> primera imagen, counter 2 -> segunda imagen, counter 3 -> tercera imagen
        if counter >= 1 and counter <= #countdownImages then
            createCustomCountdownSprite(countdownImages[counter], counter)
        end
        
    end
end

function onTweenCompleted(tag)
    -- Limpiar sprites del contador cuando termine la animación
    if string.find(tag, 'customCountdown_') and string.find(tag, '_fade') then
        local spriteName = string.gsub(tag, '_fade', '')
        removeLuaSprite(spriteName, true)
        if currentCountdownSprite == spriteName then
            currentCountdownSprite = nil
        end
    end
end

-- Por si acaso
function onCountdownStarted()
    customCountdownActive = false
end