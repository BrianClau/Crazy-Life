function onCreate()
	makeLuaSprite('stageback', 'BGs/Redentor/Fondo', -800, -340);
	makeLuaSprite('mesas', 'BGs/Redentor/Mesas', -305, 570);

	scaleObject("stageback", 2.3, 1.8)
	scaleObject("mesas", 1.6, 1.6)

	setScrollFactor('stageback', 1, 1);
	setScrollFactor('mesas', 1.3, 1);

	setObjectOrder('mesas', 15);

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagelight_left', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);
end