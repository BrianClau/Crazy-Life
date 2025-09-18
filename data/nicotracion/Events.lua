function onCreate()
    setProperty('camGame.alpha',0)
    setProperty('camHUD.alpha',0)
end

function onUpdate()
    if curStep == 1 then
		doTweenAlpha('inGame','camGame', 1, 3, 'quadInOut')
    end

    if curStep == 128 then
        doTweenAlpha('inHUD','camHUD', 1, 4, 'quadInOut')
    end

    if curStep == 1451 then
        doTweenAlpha('inHUD','camHUD', 0, 0.7, 'quadInOut')
    end

    if curStep == 1535 then
        
        doTweenAlpha('inGame','camGame', 0, 8, 'quadInOut')
    end

end