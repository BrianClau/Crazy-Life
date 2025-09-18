function onCreate()
	makeLuaSprite('rojo', 'BGs/effects/rojo pum', -1000, -900);
	scaleObject("rojo", 2.5,2.5);
	setScrollFactor('rojo', 1, 1);
	setObjectOrder('rojo',100);


	makeLuaSprite('stageback', 'BGs/sumo/expansion de suminio', -2000, -3800);
	scaleObject("stageback", 3.5,5.5);
	--setProperty('stageback.angle', 5); -- Slight rotation for added depth

	-- Crear múltiples sprites para el efecto de scroll infinito
	makeLuaSprite('stageback2_1', 'BGs/sumo/expansion de suminio', -1000, -800);
	scaleObject("stageback2_1", 2, 2);
	setScrollFactor('stageback2_1', 0.3, 0.3);
	
	makeLuaSprite('stageback2_2', 'BGs/sumo/expansion de suminio', -1000, -800);
	scaleObject("stageback2_2", 2, 2);
	setScrollFactor('stageback2_2', 0.3, 0.3);
	
	addLuaSprite('stageback2_1', false);
	addLuaSprite('stageback2_2', false);
	addLuaSprite('stageback', false);
	addLuaSprite('rojo', false);
end

function onCreatePost()
	setPerspective('stageback', 0.5);
	
	-- Calcular la altura real del sprite escalado y posicionar el segundo sprite
	local spriteRealHeight = getProperty('stageback2_1.height')
	setProperty('stageback2_2.y', getProperty('stageback2_1.y') - spriteRealHeight)
end

-- Variables para el scroll infinito
local scrollSpeed = 50 -- Velocidad de movimiento hacia arriba (píxeles por segundo)
local resetThresholdY = -2000 -- Coordenada Y a la que debe llegar

function onUpdate(elapsed)
	
	-- Mover ambos sprites hacia arriba
	setProperty('stageback2_1.y', getProperty('stageback2_1.y') - scrollSpeed * elapsed)
	setProperty('stageback2_2.y', getProperty('stageback2_2.y') - scrollSpeed * elapsed)
	
	-- Obtener la altura real del sprite para cálculos precisos
	local spriteRealHeight = getProperty('stageback2_1.height')
	
	-- Resetear posición cuando el sprite sale completamente de la pantalla por arriba
	if getProperty('stageback2_1.y') <= resetThresholdY then
		setProperty('stageback2_1.y', getProperty('stageback2_2.y') + spriteRealHeight)
	end
	
	if getProperty('stageback2_2.y') <= resetThresholdY then
		setProperty('stageback2_2.y', getProperty('stageback2_1.y') + spriteRealHeight)
	end
end

function onBeatHit()
	setProperty('rojo.alpha',0.5)
	doTweenAlpha('rojotween2', 'rojo', 0, 0.5, linearOut)

	-- a ryam le gusta el pene
end
