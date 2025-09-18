function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'notenev' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/NoteMiss'); 
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); 
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'notenev' then
		setProperty('health', -100);
	end
end



