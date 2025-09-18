function onCreate()
	makeAnimatedLuaSprite('firo', 'BGs/blackdog/girito',-400, 0);
	scaleObject('firo', 4, 2.5);
	addLuaSprite('firo', false);
    addAnimationByPrefix('firo','spiral','spiral',24,true);
	setObjectOrder('firo',2);
	setProperty('firo.alpha',0)

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
	objectPlayAnimation('firo', 'spiral', true);
end

function onUpdate()
	if curStep == 128 then
		setProperty('checkovideo.alpha',0)
	end

	if curStep == 384 then
		setProperty('firo.alpha',0.3)
	end

	if curStep == 640 then
		setProperty('firo.alpha',0)
	end

end

