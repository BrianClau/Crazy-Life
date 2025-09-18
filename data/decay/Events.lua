function onCreate()
    setProperty('camGame.alpha',0)
    setProperty('camHUD.alpha',0)
end

function onUpdate()
    if curStep == 16 then
		doTweenAlpha('inGame','camGame', 1, 7, 'quadInOut')
        doTweenAlpha('inHUD','camHUD', 1, 7, 'quadInOut')
    end

    if curStep == 1792 then
		setProperty('camGame.alpha',0)
        setProperty('camHUD.alpha',0)
	end

end