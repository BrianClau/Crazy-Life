function onCreatePost()
	makeLuaSprite('whitebg', '', 0, 0)
	setScrollFactor('whitebg', 0, 0)
	makeGraphic('whitebg', 5840, 3160, 'ffffff')
	addLuaSprite('whitebg', false)
	setProperty('whitebg.alpha', 0)
	screenCenter('whitebg', 'xy')
	scaleObject('whitebg', 10, 10);
end
function onEvent(n, v1, v2)
	if n == 'badapplelol' and string.lower(v1) == 'a' then
		doTweenAlpha('applebadxd69', 'whitebg', 1, v2, 'linear')
		doTweenColor('badapplexd', 'boyfriendGroup', '000000', v2, 'linear')
		doTweenColor('badapplexd1', 'dadGroup', '000000', v2, 'linear')
		doTweenColor('badapplexd2', 'gf', '000000', v2, 'linear')
		doTweenColor('badapplexd3', 'en2', '000000', v2, 'linear')
		doTweenColor('badapplexd4', 'en1', '000000', v2, 'linear')
		doTweenColor('badapplexd5', 'mesas', '000000', v2, 'linear')
		doTweenColor('badapplexd9', 'clau', '000000', v2, 'linear')
		doTweenColor('badapplexd10', 'discord', '000000', v2, 'linear')
		doTweenColor('badapplexd11', 'manu', '000000', v2, 'linear')
		doTweenColor('badapplexd12', 'anim2', '000000', v2, 'linear')
		doTweenColor('badapplexd13', 'eithan', '000000', v2, 'linear')
		doTweenColor('badapplexd14', 'nico', '000000', v2, 'linear')
	end
	if n == 'badapplelol' and string.lower(v1) == 'b' then
		doTweenAlpha('applebadxd', 'whitebg', 0, v2, 'linear')
		doTweenColor('badapplexd3', 'boyfriendGroup', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd4', 'dadGroup', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd5', 'gf', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd6', 'en2', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd7', 'en1', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd8', 'mesas', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd9', 'clau', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd10', 'discord', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd11', 'manu', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd12', 'anim2', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd13', 'eithan', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd14', 'nico', 'FFFFFF', v2, 'linear')
	end
	
end