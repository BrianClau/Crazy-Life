function onUpdate()
      setTextString("botplayTxt", "MANCO")
end
      
function onCreatePost()
      ogys = getPropertyFromGroup("strumLineNotes", 0, 'scale.y')
      ogxs = getPropertyFromGroup("strumLineNotes", 0, 'scale.x')
      setProperty('timeBar.y', 10000000000000)
      setProperty('timeTxt.y', 100000000000000000)
end

function onUpdatePost()
	setProperty("iconP1.x", 835)
	setProperty('iconP2.x',275)

      setObjectOrder('healthBar', 48);
      setObjectOrder('iconP1', 50);
      setObjectOrder('iconP2', 50);
end

function onGameOver()
      setProperty('camHUD.alpha',0)
end

function goodNoteHit(i,d,t,s)
      noteTweenScale((d+4),ogxs,ogys-0.2,0.08,'quartOut')
end

function opponentNoteHit(i,d,t,s)
      noteTweenScale(d,ogxs,ogys-0.2,0.08,'quadOut')
end

function noteTweenScale(index,x,y,secs,ease)
      doTweenX('tagstrumsx'..index,'strumLineNotes.members['..index..'].scale',x,secs,ease)
      doTweenY('tagstrumsy'..index,'strumLineNotes.members['..index..'].scale',y,secs,ease)
end

function onTweenCompleted(t)
      for j = 0,7 do
            if t == 'tagstrumsy'..j then
                  doTweenX('tagstrumsxb'..j,'strumLineNotes.members['..j..'].scale',ogxs,0.08,'quadInOut')
                  doTweenY('tagstrumsyb'..j,'strumLineNotes.members['..j..'].scale',ogys,0.08,'quadInOut')
            end
      end
end