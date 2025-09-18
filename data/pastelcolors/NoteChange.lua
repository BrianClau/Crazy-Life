function onStepHit()
  if curStep >= 1 and curStep < 400 then
    if middlescroll == false then
      -- NOTAS DEL JUGADOR
      	noteTweenX('move1', '4', 412, 0.7, 'quadOut')
				noteTweenX('move2', '5', 524, 0.7, 'quadOut')
				noteTweenX('move3', '6', 636, 0.7, 'quadOut')
				noteTweenX('move4', '7', 748, 0.7, 'quadOut')
      -- NOTAS DEL OPONENTE
        noteTweenX('move5', '0', 112, 0.7, 'quadOut')
				noteTweenX('move6', '1', 224, 0.7, 'quadOut')
				noteTweenX('move7', '2', 336, 0.7, 'quadOut')
				noteTweenX('move8', '3', 448, 0.7, 'quadOut')
    else
      -- nada
    end
    for i = 0, getProperty('unspawnNotes.length')-1 do 
      if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
        setPropertyFromGroup('unspawnNotes', i, 'visible', false)
      end
    end
    for i = 0,3 do
      setPropertyFromGroup('opponentStrums', i, 'visible', false)
    end
  end
  if curStep >= 400 then
    if middlescroll == false then
      -- NOTAS DEL JUGADOR
				noteTweenX('move1', '4', 112, 0.7, 'quadOut')
				noteTweenX('move2', '5', 224, 0.7, 'quadOut')
				noteTweenX('move3', '6', 336, 0.7, 'quadOut')
				noteTweenX('move4', '7', 448, 0.7, 'quadOut')
      -- NOTAS DEL OPONENTE
        noteTweenX('move5', '0', 712, 0.7, 'quadOut')
				noteTweenX('move6', '1', 824, 0.7, 'quadOut')
				noteTweenX('move7', '2', 936, 0.7, 'quadOut')
				noteTweenX('move8', '3', 1048, 0.7, 'quadOut')
      for i = 0, getProperty('unspawnNotes.length')-1 do
        if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
          setPropertyFromGroup('unspawnNotes', i, 'visible', true)
        end
      end
      for i = 0,3 do
        setPropertyFromGroup('opponentStrums', i, 'visible', true)
      end
    end
  end
end