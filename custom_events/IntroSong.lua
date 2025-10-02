local titleSprite = nil
local prodSprite = nil
local songName = ''
local UniversalX = 260
local UniversalXV = 370
local TitleY = 200
local ProdY = 200
local debugMode = false -- Variable para controlar el modo de depuración.
--Esta variable ajusta el tiempo en pantalla
local timeOn = 3

function onCreate()
    -- Get current song name
    songName = getProperty('curSong');
    if songName == nil or songName == '' then
        songName = 'unknown'
    end
    
    -- Clean song name (remove spaces and special characters for file naming)
    local cleanSongName = string.gsub(songName, '[%s%-_]', '')
    
    -- Define image paths
    local titleImagePath = 'IntroSong/' .. cleanSongName .. '-Title'
    local prodImagePath = 'IntroSong/' .. cleanSongName .. '-Prod'


    if debugMode then
        debugPrint(cleanSongName)
    end
    
    -- Create title sprite
    titleSprite = 'titleIntro'
    makeLuaSprite(titleSprite, titleImagePath, UniversalX -400 , TitleY- 70)
    setObjectCamera(titleSprite, 'other')
    addLuaSprite(titleSprite, true)
    setProperty(titleSprite .. '.visible', false)
    scaleObject(titleSprite, 1.5, 1.5);
    
    -- Create producer sprite
    prodSprite = 'prodIntro'
    makeLuaSprite(prodSprite, prodImagePath, UniversalX + 400, ProdY)
    setObjectCamera(prodSprite, 'other')
    addLuaSprite(prodSprite, true)
    setProperty(prodSprite .. '.visible', false)

end

function onEvent(name, value1, value2, strumTime)
    if name == 'IntroSong' then
        -- Optional: Add fade in animation
        if titleSprite then
            setProperty(titleSprite .. '.visible', true)
            setProperty(titleSprite .. '.alpha', 0)
            doTweenAlpha('titleFadeIn', titleSprite, 1, 0.5, 'linear')
            doTweenX('titleMoveIn', titleSprite, UniversalX, 0.23, 'circOut')
        end
        
        if prodSprite then
            setProperty(prodSprite .. '.visible', true)
            setProperty(prodSprite .. '.alpha', 0)
            doTweenAlpha('prodFadeIn', prodSprite, 1, 0.5, 'linear')
            doTweenX('prodMoveIn', prodSprite, UniversalXV, 0.23, 'circOut')

            runTimer('hideIntro', timeOn, 1)
        end
    end
end

-- Helper function to center sprites
function screenCenterXY(sprite)
    if sprite then
        setProperty(sprite .. '.x', (getProperty('FlxG.width') - getProperty(sprite .. '.width')) / 2)
        setProperty(sprite .. '.y', (getProperty('FlxG.height') - getProperty(sprite .. '.height')) / 2)
    end
end

-- Optional: Hide sprites after some time
function onTimerCompleted(tag)

    if tag == 'hideIntro' then
        if titleSprite then
            doTweenX('prodMoveOut', prodSprite, UniversalX - 1000, 0.23, 'circIn');
            doTweenAlpha('prodFadeOut', prodSprite, 0, 0.5, 'linear')
        end
        if prodSprite then
            doTweenX('titleMoveOut', titleSprite, UniversalX + 1000, 0.23, 'circIn');
            doTweenAlpha('titleFadeOut', titleSprite, 0, 0.5, 'linear')
        end
    end
end