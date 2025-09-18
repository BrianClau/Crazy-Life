function onCreate()
    makeLuaSprite('w', 'HUD/flash', -100, 0)
    scaleObject('w', 0.73, 0.73)
    addLuaSprite('w', true)  
    setObjectCamera('w', 'camHUD')
    setObjectOrder('w', 28)  
    setProperty('w.visible', true)
    setProperty('w.alpha', 0)
end
function onEvent(name,value1,value2)
if name == 'Flash White Vignette' then
        setProperty('w.alpha', 1)
        doTweenAlpha('fadeIn', 'w', 0,0.8, 'circOut')
	end
end