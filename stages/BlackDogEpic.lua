function onCreate()

	makeLuaSprite('stageback', 'BGs/blackdog/Fondo', -200, 50);
	scaleObject("stageback", 2.3, 1.8)
	setScrollFactor('stageback', 1, 1);
	setObjectOrder('stageback',1);

	makeAnimatedLuaSprite('checkovideo', 'BGs/blackdog/checkovideosprite',0, 0);
	scaleObject('checkovideo', 1.5, 1.5);
	addLuaSprite('checkovideo', false);
    addAnimationByPrefix('checkovideo','checko video','checko video',24,false);
    setObjectOrder('checkovideo',4);
	setObjectCamera('checkovideo', 'HUD')

	

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagelight_left', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);
end

function onSongStart()
	objectPlayAnimation('checkovideo', 'checko video', true);
end

function onUpdate()
	if curStep == 128 then
		setProperty('checkovideo.alpha',0)
	end
end

