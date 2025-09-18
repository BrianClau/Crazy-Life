local PersonasLlamadaDiscord = 0

local dadx
local dady

local bfx
local bfy

local gfx
local gfy

local by
local ey
local ly

local isSinging = false        -- Indica si la animación "VC" está activa
local isSinging2 = false 
local lastNoteTime = 0         -- Registra el tiempo de la última nota presionada
local waitTime = 500          -- Tiempo de espera en milisegundos (1 segundo)
local lastNoteTime2 = 0         -- Registra el tiempo de la última nota presionada
local waitTime2 = 500          -- Tiempo de espera en milisegundos (1 segundo)

--Ni le hagan caso a las declaraciones por que ni yo se que bodrio hice al final pero funciona asi que no le muevan por dios!!!!!!!!!


function onCreate()
	--VOICES CHAT ICON
	makeAnimatedLuaSprite('vcb', 'BGs/nicotracion/vc',-840, by);
	scaleObject('vcb', 0.9, 0.9);
	addLuaSprite('vcb', false);
    addAnimationByPrefix('vcb','VC','VC BCS',24,false);
    setObjectOrder('vcb',4);
	
	makeAnimatedLuaSprite('vce', 'BGs/nicotracion/vc',-840, ey);
	scaleObject('vce', 0.9, 0.9);
	addLuaSprite('vce', false);
    addAnimationByPrefix('vce','VC','VC EN',24,false);
    setObjectOrder('vce',4);

	makeAnimatedLuaSprite('vcl', 'BGs/nicotracion/vc',-840, ly);
	scaleObject('vcl', 0.9, 0.9);
	addLuaSprite('vcl', false);
    addAnimationByPrefix('vcl','VC','VC LTZ',24,false);	
    setObjectOrder('vcl',4);

	-- BACKGROUND STAGE
	makeLuaSprite('Chat', 'BGs/nicotracion/ChatVacio', 60, -150);
	scaleObject("Chat", 0.92,0.92);
	setScrollFactor('Chat', 1, 1);

	makeLuaSprite('stageback', 'BGs/nicotracion/DiscordBg', -1015, -598);
	scaleObject("stageback", 0.92,0.92);
	setScrollFactor('stageback', 1, 1);

	
	addLuaSprite('stageback', false);
	addLuaSprite('Chat', false);
end

function onUpdatePost()

	-- PERSONAJES Y VC

	setProperty('dad.x', dadx)
	setProperty('boyfriend.x', bfx)
	setProperty('gf.x', gfx)

	setProperty('dad.y', dady)
	setProperty('boyfriend.y', bfy)
	setProperty('gf.y', gfy)

	setProperty('vcb.y', by)
	setProperty('vcl.y', ly)
	setProperty('vce.y', ey)

	if PersonasLlamadaDiscord == 0 then
		bfx = 10000
		bfy = 10000

		dadx = 10000
		dady = 10000

		gfx = 10000
		gfy = 10000

		by = 10000
		ey = 10000
		ly = 10000

		setProperty('Chat.x', 60)
		setProperty('Chat.y', -150)
	end

	if PersonasLlamadaDiscord == 1 then
		bfx = 10000
		bfy = 10000

		dadx = -130
		dady = -210

		gfx = 10000
		gfy = 10000

		by = 10000
		ey = -209
		ly = 10000

		setProperty('Chat.x', 10000)
		setProperty('Chat.y', 10000)
	end

	if PersonasLlamadaDiscord == 2 then
		bfx = -150
		bfy = -380

		dadx = -150
		dady = 20

		gfx = 10000
		gfy = 10000

		by = 10000
		ey = -157
		ly = -207

		setProperty('Chat.x', 10000)
		setProperty('Chat.y', 10000)
	end

	if PersonasLlamadaDiscord == 3 then
		bfx = 250
		bfy = -380

		dadx = -450
		dady = -380

		gfx = -120
		gfy = 20

		by = -209
		ey = -157
		ly = -109

		setProperty('Chat.x', 10000)
		setProperty('Chat.y', 10000)
	end


	--EVENTOS DE LA SONG NICOTRACION EN ESPECIFICO

    if curStep == 30 then
		playSound("DiscordEnter", 0.8, tag);
        PersonasLlamadaDiscord = 1
    end

    if curStep == 54 then
		playSound("DiscordEnter", 0.8, tag);
        PersonasLlamadaDiscord = 2
    end

    if curStep == 591 then
		playSound("DiscordEnter", 0.8, tag);
        PersonasLlamadaDiscord = 3
    end

	if curStep == 721 then
		playSound("DiscordExit", 0.8, tag);
        PersonasLlamadaDiscord = 2
    end

    if curStep == 1233 then
		playSound("DiscordEnter", 0.8, tag);
        PersonasLlamadaDiscord = 3
    end

	if curStep == 1290 then
		playSound("DiscordExit", 0.8, tag);
        PersonasLlamadaDiscord = 2
    end

	if curStep == 1340 then
		playSound("DiscordEnter", 0.8, tag);
        PersonasLlamadaDiscord = 3
    end

	if curStep == 1537 then
		playSound("DiscordExit", 0.8, tag);
        PersonasLlamadaDiscord = 2
    end

		if isSinging then
			objectPlayAnimation('vce', 'VC', true);  -- Force restart animation every frame
			local currentTime = getSongPosition()
			if currentTime - lastNoteTime > waitTime then
				isSinging = false
			end
		end

		if isSinging2 then
			objectPlayAnimation('vcl', 'VC', true);  -- Force restart animation every frame
			local currentTime = getSongPosition()
			if currentTime - lastNoteTime2 > waitTime2 then
				isSinging2 = false
			end
		end
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    lastNoteTime = getSongPosition()
    isSinging = true
    objectPlayAnimation('vce', 'VC', false);
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	lastNoteTime2 = getSongPosition()
    isSinging2 = true
    objectPlayAnimation('vcl', 'VC', false);
end