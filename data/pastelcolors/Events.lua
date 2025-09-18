function onCreate()
    setProperty('camGame.alpha',0)
    setProperty('camHUD.alpha',0)
end

function onUpdate()
    if curStep == 16 then
        setProperty('camGame.alpha',1)
        setProperty('camHUD.alpha',1)	
    end

    if curStep == 672 then
        doTweenAlpha('inGame','camGame', 0, 5, 'quadInOut')
        doTweenAlpha('inHUD','camHUD', 0, 5, 'quadInOut')
    end
end