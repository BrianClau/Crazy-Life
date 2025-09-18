function onCreate()
    setProperty('camGame.alpha',0)
    setProperty('camHUD.alpha',0)
end

function onSongStart()
    doTweenAlpha('inGame','camGame', 1, 0.001, 'quadInOut')
    setProperty('camHUD.alpha',1)
end
