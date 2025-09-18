function onCreate()
    setProperty('camGame.alpha',0)
    setProperty('camHUD.alpha',0)
    setProperty('arbusto.alpha',0)
end

function onSongStart()
    doTweenAlpha('inGame','camGame', 1, 0.001, 'quadInOut')
    triggerEvent('badapplelol', 'a', 0.0001)
end

function onUpdate()

    if curStep == 48 then
        doTweenAlpha('inHUD','camHUD', 1, 3, 'quadInOut')
    end  

    if curStep == 128 then
		setProperty('arbusto.alpha',1)
	end

    if curStep == 512 then
		setProperty('camGame.alpha',0)
        setProperty('camHUD.alpha',0)
	end

    if curStep == 528 then
		doTweenAlpha('inGame','camGame', 1, 2, 'quadInOut')
        doTweenAlpha('inHUD','camHUD', 1, 3, 'quadInOut')
	end

    if curStep == 1184 then
        doTweenAlpha('inHUD','camHUD', 0, 3, 'quadInOut')
	end

    if curStep == 1200 then
		setProperty('camGame.alpha',0)
	end

end


