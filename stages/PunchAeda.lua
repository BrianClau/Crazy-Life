function onCreate()
	makeLuaSprite('satg', 'BGs/punch/Punch', -900, -1200);
	scaleObject("satg", 3.2,3.2);
	setScrollFactor('satg', 1, 1);
	setObjectOrder('satg', 0);


	addLuaSprite('satg', true);
end


