function onCreate()
    setProperty('camGame.alpha',0)
    setProperty('camHUD.alpha',0)
end

function onUpdate()
    if curStep == 1 then
        doTweenAlpha('inHUD','camHUD', 1, 7, 'quadInOut')
    end

    if curStep == 128 then
        setProperty('camGame.alpha',1)
    end
    if curStep == 1808 then
        setProperty('camGame.alpha',0)
        doTweenAlpha('inHUD','camHUD', 0, 1, 'quadInOut')
	end

end