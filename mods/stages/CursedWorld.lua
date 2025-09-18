function onCreate()
	makeLuaSprite('sky', 'BGs/cursedworld/sky', -2000, -1700);
	scaleObject("sky", 0.8,0.8);
	setScrollFactor('sky', 1, 1);
	addLuaSprite('sky', false);

	makeAnimatedLuaSprite('nube', 'BGs/cursedworld/cielo',-1500, -900);
	scaleObject('nube', 0.9, 0.9);
	addLuaSprite('nube', false);
    addAnimationByPrefix('nube','cielo','cielo',24,true);
    setObjectOrder('nube',3);
	setProperty('nube.alpha',0.8)

	makeLuaSprite('mount', 'BGs/cursedworld/mount', -600, 0);
	scaleObject("mount", 1.4,0.8);
	setScrollFactor('mount', 1.4, 1);
	addLuaSprite('mount', false);

	makeLuaSprite('mounts', 'BGs/cursedworld/mounts', -1100, -400);
	scaleObject("mounts", 0.8,0.8);
	setScrollFactor('mounts', 1.2, 1);
	addLuaSprite('mounts', false);

	makeLuaSprite('floor', 'BGs/cursedworld/floor', -900, -600);
	scaleObject("floor", 0.8,1.2);
	setScrollFactor('floor', 1, 1);
	addLuaSprite('floor', false);

	makeLuaSprite('arbusto', 'BGs/cursedworld/arbusto', -1300, 300);
	scaleObject("arbusto", 0.8,0.8);
	setScrollFactor('arbusto', 0.8, 1);
	addLuaSprite('arbusto', false);
	setObjectOrder('arbusto', 15);	

	
end


