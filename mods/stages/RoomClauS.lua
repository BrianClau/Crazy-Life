function onCreate()
	makeLuaSprite('mesa de noche', 'BGs/decay/mesa de noche',  -600, -100);
	scaleObject("mesa de noche", 0.8,0.9);
	setScrollFactor('mesa de noche', 1, 1);
	setObjectOrder("mesa de noche", 1);

	makeLuaSprite('stageback', 'BGs/decay/fondo', -1070, -520);
	scaleObject("stageback", 0.6,0.8);
	setScrollFactor('stageback', 1, 1);
	setObjectOrder("stageback", 1);

	makeLuaSprite('cama', 'BGs/decay/cama',  -1400, 470);
	scaleObject("cama", 0.8,0.9);
	setScrollFactor('cama', 1, 1);
	setObjectOrder("cama", 19);

	

	makeLuaSprite('compu', 'BGs/decay/mesa',  600, 370);
	scaleObject("compu", 0.8,0.8);
	setScrollFactor('compu', 1, 1);
	setObjectOrder("compu", 19);

	--setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup') + 1);
	
	addLuaSprite('stageback', false);
end


