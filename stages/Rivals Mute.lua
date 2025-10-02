function onCreate()
	makeLuaSprite('stageback', 'BGs/Mute/mute wea', -350, -20);

	scaleObject("stageback", 1.5, 1.5)

	setScrollFactor('stageback', 1, 1);

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagelight_left', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);

	makeAnimatedLuaSprite('pedro', 'BGs/mute/pedrito', -70, 300)
    addAnimationByPrefix('pedro', 'pedrito instancia 1',   'pedrito instancia 1',    24, true)
    addLuaSprite('pedro', false)
    scaleObject('pedro', 1, 1)
    playAnim('pedro', 'pedrito instancia 1', true)

	makeAnimatedLuaSprite('mute video', 'BGs/mute/mutecinematica',0, 0);
	scaleObject('mute video', 1.7, 1.7);
	addLuaSprite('mute video', false);
    addAnimationByPrefix('mute video','mute video','mute video',30,false);
    setObjectOrder('mute video',4);
	setObjectCamera('mute video', 'HUD')
	setProperty('mute video.alpha',0)
end

function onUpdate()
	if curStep == 2048 then
		setProperty('camGame.alpha',0)
		  setProperty('camHUD.alpha',1)
		setProperty('mute video.alpha',1)
		objectPlayAnimation('mute video', 'mute video', true);
	end

	if curStep == 2176 then
		setProperty('mute video.alpha',0)
		setProperty('camGame.alpha',1)
	end
end