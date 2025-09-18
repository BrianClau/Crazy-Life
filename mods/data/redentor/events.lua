
zoominwa = true

function onCreate()
    setProperty('camGame.alpha',0)
    setProperty('camHUD.alpha',0)
end

function onUpdate()
    if zoominwa then
        setProperty('camZooming', true)
    else
        setProperty('camZooming', false)
    end




  if curStep == 1 then
		doTweenAlpha('inGame','camGame', 1, 7, 'quadInOut')

    end
  if curStep == 136 then
        doTweenAlpha('inHUD','camHUD', 1, 3, 'quadInOut')
  end   

    if curStep == 1544 then
		setProperty('camGame.alpha',0)
        doTweenAlpha('inHUD','camHUD', 0, 2, 'quadInOut')
	end


end


function onBeatHit()
    if curBeat == 17 or curBeat == 22 or curBeat == 337 or curBeat == 342 then
        zoominwa = true
    elseif curBeat == 3 or curBeat == 19 or curBeat == 324 or curBeat == 340 or curBeat == 388 then
        zoominwa = false
    end
end


