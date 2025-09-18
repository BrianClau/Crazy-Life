local float = 0

function onCreate()
    makeLuaSprite('stageback', 'BGs/pastelcolors/fnaf 5', 400, 0);
    scaleObject("stageback", 1, 1)
    addLuaSprite('stageback', false);

    makeAnimatedLuaSprite('bg', 'BGs/pastelcolors/ducto', 670, 300)
    addAnimationByPrefix('bg', 'idle',   'bg',    24, true)
    addAnimationByPrefix('bg', 'static', 'static',24, false)
    addLuaSprite('bg', false)
    scaleObject('bg', 3.1, 3.1)
    playAnim('bg', 'idle', true)
end

function onUpdate()
    float = float + 0.02
    if curStep < 400 then
      setProperty("dad.y", getProperty("dad.y") + math.sin(float)*0.2)
    end

    if curStep >= 400 then
        setProperty('bg.alpha',0)
        setProperty('boyfriend.x', 590)
        setProperty('boyfriend.y', 310)
        setProperty('dad.x', 1000)
        setProperty('dad.y', 420)
    end
end

function onStepHit()
    if curStep < 400 then
        local bfAnim = getProperty('boyfriend.animation.curAnim.name'):lower()
        local bgAnim = getProperty('bg.animation.curAnim.name')
        if bfAnim:find('idle') then
            if bgAnim ~= 'idle' then 
                playAnim('bg', 'idle', true) 
            end
        else
            if bgAnim ~= 'static' then 
                playAnim('bg', 'static', false) 
            end
        end
    end
end
