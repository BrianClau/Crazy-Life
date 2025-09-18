function onCreate()
-- FONDO OFICINA --
	makeLuaSprite('stageback', 'BGs/fnaf/ofics', -946, -450);
	scaleObject("stageback", 0.8, 0.8)
	setScrollFactor('stageback', 1, 1);
	setObjectOrder("stageback", 2);

	makeLuaSprite('bgfondoxdxd', 'BGs/fnaf/fondoofics', -950, -450);
	scaleObject("bgfondoxdxd", 0.8, 0.8)
	setScrollFactor('bgfondoxdxd', 1, 1);
	setObjectOrder('bgfondoxdxd', 1);

-- DIRECTO --
	makeAnimatedLuaSprite('banner', 'BGs/fnaf/HUD YUTU',-720, 250);
	scaleObject('banner', 1.25, 1.25);
    addAnimationByPrefix('banner','idle','BANNER',20,false);
	setObjectOrder('banner', 4);
	setProperty('banner.alpha',1)

-- PLUSHTRAP BG
	makeLuaSprite('fanf4', 'BGs/fnaf/fanf4', -770, -380);
	scaleObject("fanf4", 1.15, 1.15)
	setScrollFactor('fanf4', 1, 1);
	setProperty('fanf4.alpha', 1)
	setObjectOrder("fanf4", 1);


	setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup') - 2);
	setObjectOrder('gfGroup', getObjectOrder('dadGroup') + 5);
	setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup') + 3);

	addLuaSprite('stageback', false);
	addLuaSprite('fanf4', false);
	addLuaSprite('banner', false);
	addLuaSprite('bgfondoxdxd', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagelight_left', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);
end

function onBeatHit()
	playAnim('banner', 'idle', false)
end

function onUpdate()
    if curStep == 1280 then
        setProperty('stageback.alpha', 0)
		setProperty('bgfondoxdxd.alpha', 0)
		setProperty('fanf4.alpha', 1)

        --setProperty('dad.x', 1000)
        --setProperty('dad.y', 420)
    end
end

















